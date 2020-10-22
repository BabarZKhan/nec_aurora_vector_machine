#include "dims.h"

void do_comp_extensive(double* A, double* B) {

  for (int j=0; j<n; j++) {
    for (int i=0; i<m; i++) {
      double a_s = A[j*m*o+i*o];
      for (int k=1; k<o; k++) {
        if (A[j*o*m+i*o+k] > a_s) a_s = A[j*o*m+i*o+k];
      }
      B[j*m+i] -= a_s;
    }
  }
}

void do_comp_boolmask(double* A, double* B, double* C, double* L) {

  for (int j=0; j<n; j++) {
    int k_s;
    for (int i=0; i<m; i++) {
      k_s = o-1;
      for (int k=0; k<o; k++) {
        int idx = j*m+i;
        if (C[idx] > L[k]) {
          k_s = k;
          break;
        }
      }
      B[j*m+i] += A[j*o*m+i*o+k_s];
    }
  }
}

void do_comp_indexlist(double* A, double* B, double* C, double* L) {

  for (int j=0; j<n; j++) {
    int k_s;
    for (int i=0; i<m; i++) {
      k_s = o-1;
      for (int k=0; k<o; k++) {
        int idx = j*m+i;
        if (C[idx] > L[k]) {
          k_s = k;
          break;
        }
      }
      B[j*m+i] += A[j*o*m+i*o+k_s];
    }
  }
}
