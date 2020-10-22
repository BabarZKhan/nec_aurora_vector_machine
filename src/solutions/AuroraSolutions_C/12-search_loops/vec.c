#include "dims.h"

void do_comp_extensive(double* A, double* B) {

  for (int j=0; j<n; j++) {
    // initialize with the first element
    double a_s[m];
    for (int i=0; i<m; i++) {
      a_s[i] = A[j*m*o+i*o];
    }
    // search can start from 1 because [0] is already in a_s
    // exchange i and k loop to vectorize over i
    for (int k=1; k<o; k++) {
      for (int i=0; i<m; i++) {
        if (A[j*o*m+i*o+k] > a_s[i]) a_s[i] = A[j*o*m+i*o+k];
      }
    }

    // separate work loop from search
    //apply computation in vectorized form
    for (int i=0; i<m; i++) {
      B[j*m+i] -= a_s[i];
    }
  }
}

void do_comp_boolmask(double* A, double* B, double* C, double* L) {

  for (int j=0; j<n; j++) {
    // promote k_s to an array and init with -1
    int k_s[m];
    for (int i=0; i<m; i++) k_s[i] = -1;
    // pull out k-loop
    for (int k=0; k<o; k++) {
      for (int i=0; i<m; i++) {
        // only do stuff if not found yet
        if (k_s[i] == -1) {
          // perform check
          int idx = j*m+i;
          if (C[idx] > L[k]) {
            // save element 
            k_s[i] = k;
          }
        }
      }
    }

    for (int i=0; i<m; i++) {
      B[j*m+i] += A[j*o*m+i*o+k_s[i]];
    }
  }
}

void do_comp_indexlist(double* A, double* B, double* C, double* L) {

  for (int j=0; j<n; j++) {
    // create an initial index list
    int idxlist[m];
    for (int i=0; i<m; i++) idxlist[i] = i;
    // set k_s to -1 to indicate no success yet
    int k_s[m];
    for (int i=0; i<m; i++) k_s[i] = -1;
    // last entry in index list is at m-1
    // because the index list is completely full
    int midx = m;
    // pull out k-loop
    for (int k=0; k<o; k++) {
      int midx_new = 0;
      // ensure compiler the uniqueness of entries in the index list
      #pragma _NEC ivdep
      for (int lidx=0; lidx<midx; lidx++) {
        int i = idxlist[lidx];
        int idx = j*m+i;
        // perform check
        if (C[idx] > L[k]) {
          // if true: search successfull
          // i will not be part of the new index list
          k_s[i] = k;
        } else {
          // if false: search still not successfull
          // i will be part of the new index list
          idxlist[midx_new++] = i;
        } 
      }
      // transfer length of new index list
      midx = midx_new;
    }

    for (int i=0; i<m; i++) {
      B[j*m+i] += A[j*o*m+i*o+k_s[i]];
    }
  }
}
