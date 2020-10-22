#include <ftrace.h>
#include "dims.h"

void do_comp1(double* A, double* C) {
  
  for (int j=0; j<n; j++) {
    for (int i=0; i<m; i++) {
      int idx = j*m+i;
      C[i] += A[idx] * A[idx]; 
    }
  }

}

void do_comp2(double* B,double* C) {

  for (int j=0; j<n; j++) {
    for (int i=0; i<m; i++) {
      int idx = j*m+i;
      B[idx] += C[i] * C[i]; 
    }
  }

}

void do_comp3(double* E, double* F, double* B) {
  
  ftrace_region_begin("l-1");
  int k1=0;
  for (int j=0; j<n; j++) {
    for (int i=0; i<m; i++) {
      int idx=j*m+i;
      E[k1*m*n+idx] -= B[idx] * B[idx];
    }
  }
  ftrace_region_end("l-1");

  ftrace_region_begin("l-2");
  for (int k=1; k<o; k++) {
    for (int j=0; j<n; j++) {
      for (int i=0; i<m; i++) {
        int idx=j*m+i;
        E[k*m*n+idx] = E[(k-1)*m*n+idx] - F[k*m*n+idx] * F[k*m*n+idx];
      }
    }
  }
  ftrace_region_end("l-2");

  ftrace_region_begin("l-3");
  int k2=o-1;
  for (int j=0; j<n; j++) {
    for (int i=0; i<m; i++) {
      int idx=j*m+i;
      E[k2*n*m+idx] += B[idx] * B[idx];
    }
  }
  ftrace_region_end("l-3");

  ftrace_region_begin("l-4");
  for (int k=o-2; k>=0; k--) {
    for (int j=0; j<n; j++) {
      for (int i=0; i<m; i++) {
        int idx=j*m+i;
        E[k*m*n+idx] = E[(k+1)*m*n+idx] - F[k*m*n+idx] * F[k*m*n+idx];
      }
    }
  }
  ftrace_region_end("l-4");

  ftrace_region_begin("l-5");
  int k3=0;
  for (int j=0; j<n; j++) {
    for (int i=0; i<m; i++) {
      int idx=j*m+i;
      B[idx] = E[k3*m*n+idx];
    }
  }
  ftrace_region_end("l-5");

}

void do_comp4(double* A, double* B) {

  for (int j=1; j<n-1; j++) {
    for (int i=1; i<m-1; i++) {
      int idx=j*m+i;
      B[idx] += A[idx] * A[(j-1)*m+i] - A[(j+1)*m+i];
    }
  }

}
