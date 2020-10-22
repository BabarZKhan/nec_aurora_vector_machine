#include "dims.h"

void do_comp(double* A, double* B) {

  // separate the operations which are performed in only one of the loops
  for (int i=0; i<m; i++) {
    int idx = 0*m+i;
    B[idx] += A[idx] * A[idx];
  }

  // combine the two loops and merge their operations
  for (int j=1; j<n-1; j++) {
    for (int i=0; i<m; i++) {
      int idx = j*m+i;
      B[idx] += A[idx] * A[idx] + A[idx] + A[(j-1)*m+i];
    }
  }

  // separate the operations which are performed in only one of the loops
  for (int i=0; i<m; i++) {
    int idx = (n-1)*m+i;
    B[idx] += A[idx] * A[idx];
  }

}
