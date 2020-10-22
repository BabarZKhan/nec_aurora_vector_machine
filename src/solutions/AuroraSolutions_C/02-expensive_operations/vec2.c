#include <math.h>
#include "dims.h"

void do_comp1 (double* A, double* B) {

  for (int j=1; j<n-1; j++) {
    for (int i=1; i<m-1; i++) {
      int idx = j*m+i;
      // replace power to rational number with two multiplications
      // to avoid expensive power function
      B[idx] += A[idx]*A[idx]*A[idx];
    }
  }
}

void do_comp2 (double* A, double* B) {

  for (int j=1; j<n-1; j++) {
    for (int i=1; i<m-1; i++) {
      int idx = j*m+i;
      // replace power to 0.5 by call of intrinsic sqrt
      // to make use of hardware square root routine
      B[idx] += sqrt(A[idx]);
    }
  }
}

void do_comp3 (double* A, double* B) {

  for (int j=1; j<n-1; j++) {
    for (int i=1; i<m-1; i++) {
      int idx = j*m+i;
      // replace by precomputed inverse square root and multiplication
      double tmp = 1.0/sqrt(A[idx]);
      B[idx] += tmp*tmp*tmp;
    }
  }
}

void do_comp4 (double* A, double* B) {

  double const pi=2.0*acos(0.0);
  // precompute square root of pi
  double const sqrtpi = sqrt(pi);

  for (int j=1; j<n-1; j++) {
    for (int i=1; i<m-1; i++) {
      int idx = j*m+i;
      B[idx] += sqrtpi*sqrt(sqrt(A[idx]));
    }
  }
}

void do_comp5 (double* A, double* B) {

  // do the part which is only done in one of the loops
  for (int i=0; i<m; i++) {
    B[i] += pow(A[i],0.834);
  }

  // combine loops and precompute power of A[idx]
  for (int j=1; j<n; j++) {
    for (int i=0; i<m; i++) {
      int idx = j*m+i;
      double tmp = pow(A[idx],0.834);
      B[idx] += tmp + 1.0/(1.0+tmp);
    }
  }
}

void do_comp6 (double* A, double* B, double* C) {

  // pull out k-loop
  // compute the sum over sqrt(C[k]) which is independent of i and j
  // this changes the numerics of the checksum
  double sum_sqrt_ck = 0.0;
  for (int k=0; k<o; k++) {
    sum_sqrt_ck += sqrt(C[k]);
  }

  // only calculate i and j loop
  for (int j=1; j<n-1; j++) {
    for (int i=1; i<m-1; i++) {
      int idx = j*m+i;
      B[idx] += sum_sqrt_ck*sqrt(A[idx]);
    }
  }

}

void do_comp7 (double* A, double* B) {

  // precompute the square root for j=0
  double sqrt_v[m];
  for (int i=0; i<m; i++) {
    sqrt_v[i] = sqrt(A[i]);
  }

  double sqrt_old, sqrt_new;
  for (int j=1; j<n-1; j++) {
    for (int i=0; i<m; i++) {
      int idx = j*m+i;
      // reuse old square root
      sqrt_old = sqrt_v[i];
      sqrt_new = sqrt(A[idx]);
      B[idx] += sqrt_old+sqrt_new;
      sqrt_v[i] = sqrt_new;
    }
  }
}

