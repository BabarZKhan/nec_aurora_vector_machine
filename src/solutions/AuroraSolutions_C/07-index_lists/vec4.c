#include <stdlib.h>
#include <stdbool.h>
#include <math.h>
#include "dims.h"

void do_comp(double* A,double* B) {

  const double barr = 0.01;
  const double maxibarr = barr*maxi;
  // introduce static collapsed index list for i and j
  // as it only depends on A and A does not change
  static int midx ;
  static int* idxlist = NULL;
  static bool needlist = true;

  if (needlist) {
    needlist = false;
    idxlist = (int*) malloc(n*m*sizeof(int));
    midx = 0;
    for (int i=0; i<m*n; i++) {
      //build index list for everything that meets the condition
      if (A[i] < maxibarr) {
        idxlist[midx++] = i;
      }
    }
  }
  
  // apply the conditional operation via index listing
  // Directive to tell compiler that an index does not appear twice
  // (injective list)
  #pragma _NEC ivdep
  for (int lidx=0; lidx<midx; lidx++) {
    int idx = idxlist[lidx];
    // apply complicated operation
    B[idx] += A[idx]*(B[idx]+1.0)/(A[idx] + B[idx] + 1.0);
  }

}
