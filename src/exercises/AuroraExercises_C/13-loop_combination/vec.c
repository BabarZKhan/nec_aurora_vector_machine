#include "dims.h"

void do_comp(double* A, double* B) {

  for (int j=0; j<n; j++) {
    for (int i=0; i<m; i++) {
      int idx = j*m+i;
      B[idx] += A[idx] * A[idx];
    }
  }

  for (int j=1; j<n-1; j++) {
    for (int i=0; i<m; i++) {
      int idx = j*m+i;
      B[idx] += A[idx] + A[(j-1)*m+i];
    }
  }

}
