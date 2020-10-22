#include <ftrace.h>
#include "dims.h"

// define a macro to compute the minimum of two numbers
#define MIN(a,b) (((a)<(b))?(a):(b))

// length of vector registers on the Aurora
const int nreg=256;

void do_comp1(double* A, double* C) {
  
  // create an array and assign it directly to the vector registers
  double vregc[nreg];
  #pragma _NEC vreg(vregc)

  // create an outer loopt to work on chunks, which fit into the vector registers
  for (int si=0; si<m; si+=nreg) {
    int se = MIN(si+nreg,m);
    // transfer array to the vector registers
    #pragma _NEC ivdep
    for (int i=si; i<se; i++) {
      vregc[i-si] = C[i];
    }
    // perform computation and store the result in the vecor registers 
    // thus minimizing loads
    for (int j=0; j<n; j++) {
      for (int i=si; i<se; i++) {
        int idx = j*m+i;
        vregc[i-si] += A[idx]*A[idx];
      }
    }
    // copy the results back from the vector registers
    #pragma _NEC ivdep
    for (int i=si; i<se; i++) {
      C[i] = vregc[i-si];
    }
  }
}

void do_comp2(double* B,double* C) {

  // create an array and assign it directly to the vector registers
  double vregc[nreg];
  #pragma _NEC vreg(vregc)

  // create an outer loopt to work on chunks, which fit into the vector registers
  for (int si=0; si<m; si+=nreg) {
    int se = MIN(si+nreg,m);
    // transfer array to the vector registers
    #pragma _NEC ivdep
    for (int i=si; i<se; i++) {
      vregc[i-si] = C[i];
    }
    // perform computation by repeatedly using the information stored in the vector registers
    // thus minimizing loads
    for (int j=0; j<n; j++) {
      for (int i=si; i<se; i++) {
        int idx = j*m+i;
        B[idx] += vregc[i-si]*vregc[i-si];
      }
    }
  }
}

void do_comp3(double* E, double* F, double* B) {
  
  // create an array and assign it directly to the vector registers
  double vregc[nreg];
  #pragma _NEC vreg(vregc)

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
  for (int j=0; j<n; j++) {
    // create a loop to work in chunks, which fit into the vector registers
    for (int si=0; si<m; si+=nreg) {
      int se = MIN(si+nreg,m);
      // transfer array to the vector registers
      #pragma _NEC ivdep
      for (int i=si; i<se; i++) {
        vregc[i-si] = E[0*m*n+j*m+i];
      }
      // perform computation and shift the vector register content to minimize loads
      for (int k=1; k<o; k++) {
        for (int i=si; i<se; i++) {
          int idx=j*m+i;
          E[k*m*n+idx] = vregc[i-si] - F[k*m*n+idx] * F[k*m*n+idx];
          vregc[i-si] = E[k*m*n+idx];
        }
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
  for (int j=0; j<n; j++) {
    // create a loop to work in chunks, which fit into the vector registers
    for (int si=0; si<m; si+=nreg) {
      int se = MIN(si+nreg,m);
      // transfer array to the vector registers
      for (int i=si; i<se; i++) {
        vregc[i-si] = E[(o-1)*m*n+j*m+i];
      }
      // perform computation and shift the vector register content to minimize loads
      for (int k=o-2; k>=0; k--) {
        for (int i=si; i<se; i++) {
          int idx=j*m+i;
          E[k*m*n+idx] = vregc[i-si] - F[k*m*n+idx] * F[k*m*n+idx];
          vregc[i-si] = E[k*m*n+idx];
        }
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

  // create two arrays and assign both directly to the vector registers
  double vregc[nreg];
  double vregd[nreg];
  #pragma _NEC vreg(vregc)
  #pragma _NEC vreg(vregd)

  // create an outer loopt to work on chunks, which fit into the vector registers
  for (int si=1; si<m-1; si+=nreg) {
    int se = MIN(si+nreg,m-1);
    // transfer array to the vector registers
    #pragma _NEC shortloop
    for (int i=si; i<se; i++) {
      vregc[i-si] = A[0*m+i];
      vregd[i-si] = A[1*m+i];
    }
    // perform computation and echange the vector register content
    // and fill vregd with new content to minimize loads
    for (int j=1; j<n-1; j++) {
      #pragma _NEC shortloop
      for (int i=si; i<se; i++) {
        B[j*m+i] += vregd[i-si] * vregc[i-si] - A[(j+1)*m+i];
        vregc[i-si] = vregd[i-si];
        vregd[i-si] = A[(j+1)*m+i];
      }
    }
  }

}
