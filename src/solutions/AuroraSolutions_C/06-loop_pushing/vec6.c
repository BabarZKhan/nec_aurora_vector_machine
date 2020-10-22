#include <stdlib.h>
#include <stdio.h>
#include <stdbool.h>
#include <math.h>
#include "dims.h"

void add_term_vec(double* A, double* C, double* D, double* L);
void add_term(int j, double* A, double C, double D, double* L);
void add_C_vec(double* A, double* C);
void add_C(double* A, double C);
void add_D_vec(double* A, double* C, double* L);
void add_D(double* A, double C, double* L);

void do_loop(double* A, double* B, double* C, double* D, double* L,
             int today) {
  // promote the scalar variable tmp to the same size as A and B
  double tmp[m*n];
  // array to precompute square root
  double sqrttmp[m*n];
  double const max_tmp = 1000000.0;
  int idx;
  // introduce boolen for error stop
  bool errorstop;

  // split the loop to isolate the different computations
  // push the loop in each case block
  switch (today) {
    case (MONDAY):
      for (int j=0; j<n; j++) {
        for (int i=0; i<m; i++) {
          idx = j*m+i;
          tmp[idx] = B[idx]+2;
        }
      }
      break;
    case (TUESDAY):
      for (int j=0; j<n; j++) {
        for (int i=0; i<m; i++) {
          idx = j*m+i;
          tmp[idx] = B[idx]-2;
        }
      }
      break;
    case (WEDNESDAY):
      for (int j=0; j<n; j++) {
        for (int i=0; i<m; i++) {
          idx = j*m+i;
          tmp[idx] = ((double)(i+1))/((double)(j+1));
        }
      }
      break;
    case (THURSDAY):
      for (int j=0; j<n; j++) {
        for (int i=0; i<m; i++) {
          idx = j*m+i;
          tmp[idx] = (i+1)/(j+1)+1;
        }
      }
      break;
    case (FRIDAY):
      for (int j=0; j<n; j++) {
        for (int i=0; i<m; i++) {
          idx = j*m+i;
          tmp[idx] = ((double)(i+1))*((double)(j+1));
        }
      }
      break;
    case (SATURDAY):
      for (int j=0; j<n; j++) {
        for (int i=0; i<m; i++) {
          idx = j*m+i;
          tmp[idx] = 0.5*(double)((i+1)/(j+1));
        }
      }
      break;
    case (SUNDAY):
      for (int j=0; j<n; j++) {
        for (int i=0; i<m; i++) {
          idx = j*m+i;
          tmp[idx] = (i+1)/((double)(j+1+2));
        }
      }
      break;
  }

  // precompute square root as it is needed twice
  for (int j=0; j<n; j++) {
    for (int i=0; i<m; i++) {
      idx = j*m+i;
      sqrttmp[idx] = sqrt(fabs(tmp[idx])+1);
    }
  }

  // compute tmp and reorder loops such that the longest loop is inside and vectorizable
  for (int k=0; k<o; k++) {
    for (int j=0; j<n; j++) {
      for (int i=0; i<m; i++) {
        idx = j*m+i;
        tmp[idx] += exp(B[idx] * L[k]);
      }
    }
  }
      
  // do error checking
  errorstop = false;
  for (int j=0; j<n; j++) {
    for (int i=0; i<m; i++) {
      idx = j*m+i;
      if (tmp[idx] > max_tmp) errorstop = true;
    }
  }

  if (errorstop) {
    printf("TMP greater MAX_TMP -> STOP\n");
    exit(0);
  }

  // combine loops for computing A
  for (int j=0; j<n; j++) {
    for (int i=0; i<m; i++) {
      idx = j*m+i;
      A[idx] += sqrttmp[idx] * exp(B[idx]);
      A[idx] += tmp[idx] / sqrttmp[idx];
    }
  }

  //create a new version of add_term and push in the loops
  add_term_vec(A, C, D, L);
}

void add_term_vec(double* A, double* C, double* D, double* L) {

  // The loop parameters are known, therefore the if construct can be eliminated
  // and replaced by explicit looping
  // The stop can never happen with these loop parameters
  add_D_vec(A, D, L);
  add_C_vec(A, C);
}
void add_term(int j, double* A, double C, double D, double* L) {

  if (j >= 90) {
    add_C(A, C);
  } else if (j >= 0) {
    add_D(A, D, L);
  } else {
    printf("A = 0.0 -> STOP\n");
    exit(0);
  }

}

void add_C_vec(double* A, double* C) {
  // push in loops from outside and order such that inner loop is largest to be
  // vectorized
  for (int j=90; j<n; j++) {
    for (int i=0; i<m; i++) {
      int idx = j*m+i;
      A[idx] = A[idx] + sqrt(C[i]);
    }
  }
}
void add_C(double* A, double C) {
  *A += sqrt(C);
}

void add_D_vec(double* A, double* D, double* L) {
  // push in loops from outside and order such that inner loop is largest to be
  // vectorized
  for (int k=0; k<o; k++) {
    for (int j=0; j<90; j++) {
      for (int i=0; i<m; i++) {
        int idx = j*m+i;
        A[idx] += sqrt(D[i] * L[k]);
      }
    }
  }
}

void add_D(double* A, double D, double* L) {
  
  for (int k=0; k<o; k++) {
    *A += sqrt(D * L[k]);
  }

}
