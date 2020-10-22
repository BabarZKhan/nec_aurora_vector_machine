#include <math.h>
#include "dims.h"

void do_comp(double* A,double* B) {

  const double barr = 0.01;
  const double maxibarr = barr*maxi;
  // introduce index list for i of length n
  int midx ;
  int idxlist[m];
  

  for (int j=0; j<n; j++) {
    // build first index list for i
    midx = 0;
    for (int i=0; i<m; i++) {
      // build index list for everything that meets the condition
      if (A[j*m+i] < maxibarr) {
        idxlist[midx++] = i;
      }
    }

    // apply the conditional operation via index listing
    // directive to tell compiler that an index does not appear twice
    // (injective list)
    #pragma _NEC ivdep
    for (int lidx=0; lidx<midx; lidx++) {
      int i = idxlist[lidx];
      int idx = j*m+i;
      // apply complicated operation
      B[idx] += A[idx]*(B[idx]+1.0)/(A[idx] + B[idx] + 1.0);
    }
  }

}
