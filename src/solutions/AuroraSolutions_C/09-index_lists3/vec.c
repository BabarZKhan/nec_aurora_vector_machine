#include "dims.h"

void do_comp(double* A, double* B, int* ind1, int* ind2) {

  for (int j=0; j<n; j++) {
    for (int i=0; i<m; i++) {
      // replace index list by direct indexing
      int k = m-i-1;
      B[j*m+k] += A[j*m+i];
    }
  }
  
  // prevent compiler from applying optimizations to the outermost loop
  #pragma _NEC novector
  for (int j=0; j<n; j++) {
    // define a starting point for the innermost loop
    for (int k=0; k<l; k++) {
      // loop over everything l times, with stepwidth l and starting point k
      for (int i=k; i<m; i+=l) {
        B[j*m+k] += A[j*m+i];
      }
    }
  }

}
