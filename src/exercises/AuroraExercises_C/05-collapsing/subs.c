#include <stdlib.h>
#include <math.h>
#include "dims.h"

void init(double* a) {
 
  for (int k=0; k<n; k++) {
    for (int j=0; j<m; j++) {
      for (int i=0; i<l; i++) {
        int idx = k*m*l+j*l+i;
        a[idx] = (i+1.)/(j+1.)*(k+1.);
      }
    }
  }

}

void sub1(double* a, double* b) {
 
  for (int k=0; k<n; k++) {
    for (int j=0; j<m; j++) {
      for (int i=0; i<l; i++) {
        int idx = k*m*l+j*l+i;
        b[idx] = 0.99*b[idx]+a[idx];
      }
    }
  }

}

void sub2(double* a, double* b, int imax, int jmax, int kmax) {

  for (int k=0; k<kmax; k++) {
    for (int j=0; j<jmax; j++) {
      for (int i=0; i<imax; i++) {
        int idx = k*m*l+j*l+i;
        b[idx]=0.5*(b[idx]+a[idx]);
      }
    }
  }

}

void sub3(double* a, double* b, int imax, int jmax, int kmax) {

  for (int k=0; k<kmax; k++) {
    for (int j=0; j<jmax; j++) {
      for (int i=0; i<imax; i++) {
        int idx = k*m*l+j*l+i;
        b[idx]=(sqrt(fabs(b[idx]))+a[idx]*a[idx]);
      }
    }
  }

}


void sub4(double* a, double* b) {
 
  for (int k=1; k<n-1; k++) {
    for (int j=1; j<m-1; j++) {
      for (int i=1; i<l-1; i++) {
        int idx = k*m*l+j*l+i;
        b[idx] = b[idx]*b[idx]+a[idx]*a[idx];
      }
    }
  }

}
