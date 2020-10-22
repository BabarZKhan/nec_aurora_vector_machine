#include <math.h>
#include "dims.h"

void do_comp(double* A,double* B) {

  const double barr = 0.01;
  const double maxibarr = maxi*barr;

  for (int j=0; j<n; j++) {
    for (int i=0; i<m; i++) {
      int idx = j*m+i;
      if (A[idx] < maxibarr) {
        B[idx] += A[idx]*(B[idx]+1.0)/(A[idx] + B[idx] + 1.0);
      }  
    }
  }

}
