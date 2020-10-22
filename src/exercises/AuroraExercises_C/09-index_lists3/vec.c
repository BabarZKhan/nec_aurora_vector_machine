#include "dims.h"

void do_comp(double* A, double* B, int* ind1, int* ind2) {

  for (int j=0; j<n; j++) {
    for (int i=0; i<m; i++) {
      int idx = j*m+i;
      B[j*m+ind1[i]] += A[idx];
    }
  }
  
  for (int j=0; j<n; j++) {
    for (int i=0; i<m; i++) {
      int idx = j*m+i;
      B[j*m+ind2[i]] += A[idx];
    }
  }

}
