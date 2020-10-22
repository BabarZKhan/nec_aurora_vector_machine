#include <math.h>
#include "dims.h"

void do_comp1 (double* A, double* B) {

  for (int j=1; j<n-1; j++) {
    for (int i=1; i<m-1; i++) {
      int idx = j*m+i;
      B[idx] += pow(A[idx],3.0);
    }
  }
}

void do_comp2 (double* A, double* B) {

  for (int j=1; j<n-1; j++) {
    for (int i=1; i<m-1; i++) {
      int idx = j*m+i;
      B[idx] += pow(A[idx],0.5);
    }
  }
}

void do_comp3 (double* A, double* B) {

  for (int j=1; j<n-1; j++) {
    for (int i=1; i<m-1; i++) {
      int idx = j*m+i;
      B[idx] += pow(A[idx],-1.5);
    }
  }
}

void do_comp4 (double* A, double* B) {

  double const pi=2.0*acos(0.0);

  for (int j=1; j<n-1; j++) {
    for (int i=1; i<m-1; i++) {
      int idx = j*m+i;
      B[idx] += sqrt(sqrt(A[idx])*pi);
    }
  }
}

void do_comp5 (double* A, double* B) {

  for (int j=0; j<n; j++) {
    for (int i=0; i<m; i++) {
      int idx = j*m+i;
      B[idx] += pow(A[idx],0.834);
    }
  }

  for (int j=1; j<n; j++) {
    for (int i=0; i<m; i++) {
      int idx = j*m+i;
      B[idx] += 1.0/(1.0+pow(A[idx],0.834));
    }
  }
}

void do_comp6 (double* A, double* B, double* C) {

  for (int j=1; j<n-1; j++) {
    for (int i=1; i<m-1; i++) {
      for (int k=0; k<o; k++) {
        int idx = j*m+i;
        B[idx] += sqrt(C[k]*A[idx]);
      }
    }
  }
}

void do_comp7 (double* A, double* B) {

  for (int j=1; j<n-1; j++) {
    for (int i=0; i<m; i++) {
      int idx = j*m+i;
      B[idx] += sqrt(A[idx]) + sqrt(A[idx-m]);
    }
  }
}

