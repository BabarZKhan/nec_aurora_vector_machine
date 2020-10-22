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
 
  // collapsing is always possible 
  // as i,j,k go from 0 to the size of the array minus one
  for (int i=0; i<l*n*m; i++) {
    b[i] = 0.99*b[i]+a[i];
  }
}

void sub2(double* a, double* b, int imax, int jmax, int kmax) {

  // collapsing is not always possible!
  // the values imax, jmax, and kmax might not span the complete array 
  // thus leaving holes
  // as this routine is only used with known input parameters it is safe (in this
  // case) to collapse the loop as shown above
  for (int i=0; i<imax*jmax*kmax; i++) {
    b[i]=0.5*(b[i]+a[i]);
  }

}

void sub3(double* a, double* b, int imax, int jmax, int kmax) {

  // collapsing is not always possible!
  // the values imax, jmax, and kmax might not span the complete array 
  // thus leaving holes
  // Note that jmax is not equal to the size of the second dimension.
  // this allows (in this case) only for a partial collapse
  for (int k=0; k<kmax; k++) {
    for (int i=0; i<imax*jmax; i++) {
      int idx = k*m*l+i;
      b[idx]=(sqrt(fabs(b[idx]))+a[idx]*a[idx]);
    }
  }

}


void sub4(double* a, double* b) {
 
  // collapsing is not possible in any case
  // from the usage of the array size
  // it is known that there are holes between the different chunks of data
  for (int k=1; k<n-1; k++) {
    for (int j=1; j<m-1; j++) {
      for (int i=1; i<l-1; i++) {
        int idx = k*m*l+j*l+i;
        b[idx] = b[idx]*b[idx]+a[idx]*a[idx];
      }
    }
  }

}
