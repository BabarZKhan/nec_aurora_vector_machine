#include <stdio.h>
#include <ftrace.h>
#include <math.h>
#include "dims.h"

// functions to find the min/max value in the i dimension
int compute_minval_i(int j, int* arr);
int compute_maxval_i(int j, int* arr);

void do_comp_boolmask(double* A, double* B, double* C, int* L, char* ftraceident) {

  ftrace_region_begin(ftraceident);
  for (int j=0; j<n; j++) {
    // determine minimal value and maximal value of L for a given j
    int kmin = compute_minval_i(j, L);
    int kmax = compute_maxval_i(j, L);
    // pull out k-loop and execute only for cases where every i has a k
    for (int k=0; k<kmin; k++) {
      for (int i=0; i<m; i++) {
        int idx = j*m+i;
        int idx2 = j*m*o+i*o;
        int idx3 = j*m*(o+1)+i*(o+1);
        B[idx] += sqrt((k+1)*B[idx]) * exp(sin(A[idx2+k]));
        C[idx3+k] = B[idx] * A[idx2+k];
      }
    }
    // pull out k-loop and execute all other cases
    for (int k=kmin; k<kmax; k++) {
      for (int i=0; i<m; i++) {
        int idx = j*m+i;
        // use a boolean mask to only work on the cases, where it is required
        if (k < L[idx]) {
          int idx2 = j*m*o+i*o;
          int idx3 = j*m*(o+1)+i*(o+1);
          B[idx] += sqrt((k+1)*B[idx]) * exp(sin(A[idx2+k]));
          C[idx3+k] = B[idx] * A[idx2+k];
        }
      }
    }
  }

  for (int j=0; j<n; j++) {
    #pragma _NEC ivdep
    for (int i=0; i<m; i++) {
      int idx = j*m+i;
      int idx3 = j*m*(o+1)+i*(o+1);
      int lij = L[idx];
      C[idx3+lij] = C[idx3 +lij-1] + sqrt(B[idx]);
    }
  }
  ftrace_region_end(ftraceident);

}

void do_comp_static_idxlist(double* A, double* B, double* C, int* L, char* ftraceident) {

  ftrace_region_begin(ftraceident);
  for (int j=0; j<n; j++) {
    // precompute entire index list for every value of k
    // (where it is required)
    int kmin = compute_minval_i(j, L);
    int kmax = compute_maxval_i(j, L);
    int midx[o];
    double idxlist[m*o];
    for (int k=kmin; k<kmax; k++) {
      int midx_tmp = 0;
      for (int i=0; i<m; i++) {
        if (k < L[j*m+i]) {
          idxlist[k*m+midx_tmp] = i;
          midx_tmp++;
        }
      }
      midx[k] = midx_tmp;
    }
    
    // push k-loop out of i-loop
    // execute k-loop where no condition is needed
    for (int k=0; k<kmin; k++) {
      for (int i=0; i<m; i++) {
        int idx = j*m+i;
        int idx2 = j*m*o+i*o;
        int idx3 = j*m*(o+1)+i*(o+1);
        B[idx] += sqrt((k+1)*B[idx]) * exp(sin(A[idx2+k]));
        C[idx3+k] = B[idx] * A[idx2+k];
      }
    }

    // Push k-loop out of i-loop
    // execute rest of the k-loop utilizing the index list.
    for (int k=kmin; k<kmax; k++) {
      #pragma _NEC ivdep
      for (int lidx=0; lidx<midx[k]; lidx++) {
        int i = idxlist[k*m+lidx];
        int idx = j*m+i;
        int idx2 = j*m*o+i*o;
        int idx3 = j*m*(o+1)+i*(o+1);
        B[idx] += sqrt((k+1)*B[idx]) * exp(sin(A[idx2+k]));
        C[idx3+k] = B[idx] * A[idx2+k];
      }
    }
  }

  for (int j=0; j<n; j++) {
    #pragma _NEC ivdep
    for (int i=0; i<m; i++) {
      int idx = j*m+i;
      int idx3 = j*m*(o+1)+i*(o+1);
      int lij = L[idx];
      C[idx3+lij] = C[idx3 +lij-1] + sqrt(B[idx]);
    }
  }
  ftrace_region_end(ftraceident);

}

void do_comp_dynamic_idxlist(double* A, double* B, double* C, int* L, char* ftraceident) {

  ftrace_region_begin(ftraceident);
  for (int j=0; j<n; j++) {
    // determine minimal value and maximal value of L for a given j
    int kmin = compute_minval_i(j, L);
    // pull out k-loop and execute only for cases where every i has a k
    for (int k=0; k<kmin; k++) {
      for (int i=0; i<m; i++) {
        int idx = j*m+i;
        int idx2 = j*m*o+i*o;
        int idx3 = j*m*(o+1)+i*(o+1);
        B[idx] += sqrt((k+1)*B[idx]) * exp(sin(A[idx2+k]));
        C[idx3+k] = B[idx] * A[idx2+k];
      }
    }

    // initialize index list
    int midx = 0;
    int idxlist[m];
    for (int i=0; i<m; i++) {
      if (L[j*m+i] > kmin) {
        idxlist[midx++] = i;
      }
    }

    int k = kmin;
    while (midx > 0) {
      int midx_tmp = 0;
      // use index list
      #pragma _NEC ivdep
      for (int lidx=0; lidx<midx; lidx++) {
        int i = idxlist[lidx];
        int idx = j*m+i;
        int idx2 = j*m*o+i*o;
        int idx3 = j*m*(o+1)+i*(o+1);
        // perform the operation
        B[idx] += sqrt((k+1)*B[idx]) * exp(sin(A[idx2+k]));
        C[idx3+k] = B[idx] * A[idx2+k];
        // check if i needs to be included in the list again
        if (k < L[idx]-1) {
          // rebuild index list
          idxlist[midx_tmp++] = i;
        }
      }
      midx = midx_tmp;
      k++;
    }
  }

  for (int j=0; j<n; j++) {
    #pragma _NEC ivdep
    for (int i=0; i<m; i++) {
      int idx = j*m+i;
      int idx3 = j*m*(o+1)+i*(o+1);
      int lij = L[idx];
      C[idx3+lij] = C[idx3 +lij-1] + sqrt(B[idx]);
    }
  }
  ftrace_region_end(ftraceident);
}

// these routines are only created, as the min/max search is needed in all three approaches
int compute_minval_i(int j, int* arr) {
  arr += j*m;
  int minval = *arr;
  for (int i=1; i<m; i++) {
    arr++;
    minval = (*arr < minval) ? *arr : minval; 
  }
  return minval;
}

int compute_maxval_i(int j, int* arr) {
  arr += j*m;
  int maxval = *arr;
  for (int i=1; i<m; i++) {
    arr++;
    maxval = (*arr > maxval) ? *arr : maxval;
  }
  return maxval;
}
