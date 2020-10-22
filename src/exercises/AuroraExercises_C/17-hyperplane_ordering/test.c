#include <stdio.h>
#include <math.h>

void mat_init(int n, double* mat) {
 
  for (int j=0; j<n; j++) {
    double rj = (double) (j+1);
    for (int i=0; i<n; i++) {
      double ri = (double) (i+1);
      int idx = j*n+i; 
      mat[idx] = sin(ri*ri)*sin(rj)*sin(ri*rj);
    }
  }

}

void transpose_mat(int n, double* mat, double* mat2) {

  for (int j=0; j<n; j++) {
    for (int i=0; i<n; i++) {
      mat2[j*n+i] = mat[i*n+j];
    }
  }

}


int main() {

  const int n=1024;
  double mat[n*n];
  double mat2[n*n];

  const int rep = 50;

  mat_init(n,mat);

  for (int irep=0; irep<rep; irep++) {
    transpose_mat(n,mat,mat2);
    transpose_mat(n,mat2,mat);
  }

  double minval = mat[0];
  double maxval = mat[0];
  double sum = mat[0];
  for (int i=1; i<n*n; i++) {
    if (mat[i] < minval) {
      minval = mat[i];
    } 
    if (mat[i] > maxval) {
      maxval = mat[i];
    }
    sum += mat[i];
  }
  printf("MIN: %20.16e\n", minval);
  printf("MAX: %20.16e\n", maxval);
  printf("AVG: %20.16e\n", sum/n);

  return 0;
  
}

