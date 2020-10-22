#include <ftrace.h>
#include "dims.h"

void do_comp1(double* A, double* B) {

  // unroll the outer loop to decrease number of loads of A
  #pragma _NEC outerloop_unroll(32)
  for (int j=1; j<n-1; j++) {
    for (int i=1; i<m-1; i++) {
      B[j*m+i] += A[j*m+i] * A[(j-1)*m + i] - A[(j+1)*m + i];
    }
  }
}

void do_comp2(double* B, double* C) {

  #pragma _NEC outerloop_unroll(16)
  for (int j=0; j<n; j++) {
    for (int i=0; i<m; i++) {
      B[j*m+i] += C[i] * C[i]; 
    }
  }
}

void do_comp3(double* E, double* F, double* B) {

  ftrace_region_begin("l-1");
  for (int j=0; j<n; j++) {
    for (int i=0; i<m; i++) {
      E[0*n*m+j*m+i] -= B[j*m+i]*B[j*m+i];
    }
  }
  ftrace_region_end("l-1");

  ftrace_region_begin("l-2");
  for (int j=0; j<n; j++) {
    #pragma _NEC outerloop_unroll(8)
    for (int k=1; k<o; k++) {
      #pragma _NEC ivdep
      for (int i=0; i<m; i++) {
        E[k*n*m+j*m+i] = E[(k-1)*n*m+j*m+i] - F[k*n*m+j*m+i]*F[k*n*m+j*m+i];
      }
    }
  }
  ftrace_region_end("l-2");

  ftrace_region_begin("l-3");
  for (int j=0; j<n; j++) {
    for (int i=0; i<m; i++) {
      E[(o-1)*n*m+j*m+i] += B[j*m+i] * B[j*m+i];
    }
  }
  ftrace_region_end("l-3");

  ftrace_region_begin("l-4");
  for (int j=0; j<n; j++) {
    #pragma _NEC outerloop_unroll(2)
    for (int k=o-2; k>=0; k--) {
      for (int i=0; i<m; i++) {
        E[k*n*m+j*m+i] = E[(k+1)*n*m+j*m+i] - F[k*n*m+j*m+i]*F[k*n*m+j*m+i];
      }
    }
  }
  ftrace_region_end("l-4");

  ftrace_region_begin("l-5");
  for (int j=0; j<n; j++) {
    for (int i=0; i<m; i++) {
      B[j*m+i] = E[0*n*m+j*m+i];
    }
  }
  ftrace_region_end("l-5");

}
