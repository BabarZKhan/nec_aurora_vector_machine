#include <stdio.h>
#include <ftrace.h>
#include <math.h>
#include "dims.h"

void do_comp(double* A, double* B, double* C, int* L, char* ftraceident) {

  ftrace_region_begin(ftraceident);
  for (int j=0; j<n; j++) {
    for (int i=0; i<m; i++) {
      int idx = j*m+i;
      int idx2 = j*m*o+i*o;
      int idx3 = j*m*(o+1)+i*(o+1);
      int lij = L[idx];
      for (int k=0; k<lij; k++) {
        B[idx] += sqrt((k+1)*B[idx]) * exp(sin(A[idx2+k]));
        C[idx3+k] = B[idx] * A[idx2+k];
      }
      C[idx3+lij] = C[idx3 +lij-1] + sqrt(B[idx]);
    }
  }
  ftrace_region_end(ftraceident);

}
