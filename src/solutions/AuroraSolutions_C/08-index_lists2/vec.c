#include <stdio.h>
#include <math.h>
#include "dims.h"

void do_comp(double* A, double* B, double* C, double* D) {
  double static const eps = 0.001;

  for (int k=0; k<o; k++) {
    // build index list for special cases (e.g. warnings)
    int midx = 0;
    double idxlist[n*m], jdxlist[n*m];
    for (int j=0; j<n; j++) {
      #pragma _NEC ivdep
      for (int i=0; i<m; i++) {
        int idx=j*m+i;
        if (fabs(C[k] - D[idx]) < eps) {
          idxlist[midx] = i;
          jdxlist[midx] = j;
          midx++;
        }
      }
    }

    // write warnings
    // still a scalar operation
    for (int lidx=0; lidx<midx; lidx++) {
      int i = idxlist[midx];
      int j = jdxlist[midx];
      int idx=j*m+i;
      printf("WARNING: |C(k) - D(i,j)| < eps\n"
             "for i=%d,j=%d,k=%d\n"
             "and C[k] = %16.12f, D[j*m+i] = %16.12f\n", i, j, k, C[k], D[idx]);
    }

    // execute operation utilizing a boolean mask
    for (int j=0; j<n; j++) {
      #pragma _NEC ivdep
      for (int i=0; i<m; i++) {
        int idx=j*m+i;
        // invert warning condition to execute computation
        if (fabs(C[k] - D[idx]) >= eps) {
          B[idx] += A[idx] / (C[k] - D[idx]);
        }
      }
    }
  }
}
