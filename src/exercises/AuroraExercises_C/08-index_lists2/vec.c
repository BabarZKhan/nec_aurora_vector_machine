#include <stdio.h>
#include <math.h>
#include "dims.h"

void do_comp(double* A, double* B, double* C, double* D) {
  double static const eps = 0.001;

  for (int k=0; k<o; k++) {
    for (int j=0; j<n; j++) {
      for (int i=0; i<m; i++) {
        int idx=j*m+i;
        if (fabs(C[k] - D[idx]) < eps) {
          printf("WARNING: |C(k) - D(i,j)| < eps\n"
                 "for i=%d,j=%d,k=%d\n"
                 "and C[k] = %16.12f, D[j*m+i] = %16.12f\n", i, j, k, C[k], D[idx]);
        } else {
          B[idx] += A[idx] / (C[k] - D[idx]);
        }
      }
    }
  }
}
