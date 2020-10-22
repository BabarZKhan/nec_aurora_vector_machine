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

  // replace the linear matrix access with hyper plane ordering access
  //
  // note that in each skew diagonal the sum of indices
  // is always equal to the index of the skew diagonal
  //
  // e.g.: the elements (2,0), (1,1), (0,2) all have a sum of indices of 2
  //       they all lie on the 2nd (starting at 0) skew diagonal
  //
  // +-----+-----+-----+-----+
  // | 0,0 | 0,1 | 0,2 | 0,3 |
  // +-----+-----+-----+-----+
  // | 1,0 | 1,1 | 1,2 | 1,3 |
  // +-----+-----+-----+-----+
  // | 2,0 | 2,1 | 2,2 | 2,3 |
  // +-----+-----+-----+-----+
  // | 3,0 | 3,1 | 3,2 | 3,3 |
  // +-----+-----+-----+-----+
  //
  // by accessing the elements on a skew diagonal simultaniously
  // only elements with an offset of (n-1) are read from memory
  // this prohibits bank conflicts 
  //
  // create a loop over the skew diagonals
  // starting at the top left (l=0)
  // stop before you reach the longest skew diagonal (l=n-1)
  for (int l=0; l<n; l++) {
    int minln = (l+1<n)?l+1:n;
    // loop over the amounts of elements in the skew diagonal
    for (int j=0; j<minln; j++) {
      // compute the index i by exploiting the fact, that the sum of indices
      // is constant in one skew diagonal
      int i = l-j;
      mat2[j*n+i] = mat[i*n+j];
    }
  }

  // create a second loop for the lower right triangular matrix
  // start at the longest skew diagonal (l=n)
  // and end at the last one (l<2*n-2)
  for (int l=n; l<2*n-2; l++) {
    // loop over the amounts of elements in the skew diagonal
    for (int j=l-n+1; j<n; j++) {
      // compute the index i by exploiting the fact, that the sum of indices
      // is constant in one skew diagonal
      int i = l-j;
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

