#include "dims.h"

void do_comp(double* A, double* B) {
  double static const max_val = 1000.0;

  for (int j=0; j<n; j++) {
    for (int i=0; i<m; i++) {
      int idx = m*j+i;
      while (B[idx] < max_val){
        B[idx] += A[idx];
      }
    }
  }
}
