#include <math.h>
#include "dims.h"

void do_comp(double* A,double* B) {

  const double barr = 0.01;
  const double maxibarr = barr*maxi;
  // introduce index list for i and j
  int midx ;
  int idxlist[m*n];
  int jdxlist[m*n];
  

  midx = 0;
  for (int j=0; j<n; j++) {
    #pragma _NEC ivdep
    for (int i=0; i<m; i++) {
      //build index list for everything that meets the condition
      if (A[j*m+i] < maxibarr) {
        idxlist[midx] = i;
        jdxlist[midx] = j;
        midx++;
      }
    }
  }
  
  // apply the conditional operation via index listing
  // Directive to tell compiler that an index does not appear twice
  // (injective list)
  #pragma _NEC ivdep
  for (int lidx=0; lidx<midx; lidx++) {
    int i = idxlist[lidx];
    int j = jdxlist[lidx];
    int idx = j*m+i;
    // apply complicated operation
    B[idx] += A[idx]*(B[idx]+1.0)/(A[idx] + B[idx] + 1.0);
  }

}
