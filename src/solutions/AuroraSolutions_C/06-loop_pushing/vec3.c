#include <stdlib.h>
#include <stdio.h>
#include <math.h>
#include "dims.h"

void add_term_vec(double* A, double* C, double* D, double* L);
void add_term(int j, double* A, double C, double D, double* L);
void add_C(double* A, double C);
void add_D(double* A, double C, double* L);

void do_loop(double* A, double* B, double* C, double* D, double* L,
             int today) {
  // promote the scalar variable tmp and tmp_old to the same size as A and B
  double tmp[m*n], tmp_old[m*n];
  double const max_tmp = 1000000.0;
  int idx;

  // split the loop to isolate the different computations
  // push the loops in each case block
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

  for (int j=0; j<n; j++) {
    for (int i=0; i<m; i++) {
      idx = j*m+i;
      A[idx] += sqrt(fabs(tmp[idx])+1) * exp(B[idx]);
      tmp_old[idx] = tmp[idx];
      for (int k=0; k<o; k++) {
        tmp[idx] += exp(B[idx] * L[k]);
      }
    }
  }

  for (int j=0; j<n; j++) {
    for (int i=0; i<m; i++) {
      idx = j*m+i;
      if (tmp[idx] > max_tmp) {
        printf("TMP greater MAX_TMP -> STOP\n");
        exit(0);
      }
    }
  }

  for (int j=0; j<n; j++) {
    for (int i=0; i<m; i++) {
      idx = j*m+i;
      A[idx] += tmp[idx] / sqrt(fabs(tmp_old[idx])+1);
    }
  }

  //create a new version of add_term and push in the loops
  add_term_vec(A, C, D, L);
}

void add_term_vec(double* A, double* C, double* D, double* L) {
  for (int j=0; j<n; j++) {
    for (int i=0; i<m; i++) {
      int idx = j*m+i;
      if (j >= 90) {
        add_C(A+idx, C[i]);
      } else if (j >= 0) {
        add_D(A+idx, D[i], L);
      } else {
        printf("A = 0.0 -> STOP\n");
        exit(0);
      }
    }
  }
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

void add_C(double* A, double C) {
  *A += sqrt(C);
}

void add_D(double* A, double D, double* L) {
  
  for (int k=0; k<o; k++) {
    *A += sqrt(D * L[k]);
  }

}
