#include "dims.h"

void do_comp_boolmask(double* A, double* B) {
  double static const max_val = 1000.0;
  
  // create a todo counter initialized to something >= 1
  int todo = 1;
  // pull out while loop
  while (todo > 0) {
    // reset counter for remaining tasks
    todo = 0;
    for (int j=0; j<n; j++) {
      for (int i=0; i<m; i++) {
        int idx = m*j+i;
        // build a boolean mask and execute
        if (B[idx] < max_val) {
          B[idx] += A[idx];
          // take note of how many operations got performed
          // and might need to be performed again
          todo++;
        }
      }
    }
  }
}

void do_comp_idxlist(double* A, double* B) {
  double static const max_val = 1000.0;
  
  // create an intial collapsed index list
  int midx = 0;
  int idxlist[m*n];
  for (int i=0; i<n*m; i++) {
    if (B[i] < max_val) {
      idxlist[midx++] = i;
    }
  }

  // pull out the while loop
  while (midx > 0) {
    // counter to keep track of how many operations were performed
    int midx_new = 0;
    // directive to tell the compiler that every element occurs only once in the
    // index list (injective)
    #pragma _NEC ivdep
    // directive to allow checking the loop size before vectorizing
    #pragma _NEC loop_count_test
    for (int lidx=0; lidx<midx; lidx++) {
      int i = idxlist[lidx];
      // perform the operation
      B[i] += A[i];
      // check weather the operation needs to be applied in the next iteration
      if (B[i] < max_val) {
        // create new index list
        // note that the elements are replaced, which is valid, as the number of
        // accessed indices shrinks
        idxlist[midx_new++] = i;
      }
    }
    // transfer counter
    midx = midx_new;
  }
}
