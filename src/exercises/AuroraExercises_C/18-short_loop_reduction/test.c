#include <stdio.h>
#include <math.h>
#include "vec.h"

int main () {
  const int m = 100;
  const int n = 100;
  const int o = 100;
  const int iter = 100000;

  double A[o*m*n], B[m*n];

  for (int i=0; i<m*n; i++) B[i] = 0.0;
  double p=2.0*acos(0.0)/137.0;
  for (int i=0; i<m*n*o; i++) A[i] = fabs(2.0*(i/p-floor(i/p+0.5)));

  double isize = 1.0/(m*n);
  for (int i=0; i<iter; i++) {
    do_comp(m, n, o, A, B);
    for (int j=0; j<m*n; j++) {
      B[j] *= isize;
    }
  }

  double minval = B[0];
  double maxval = B[0];
  double sum = B[0];
  for (int i=1; i<m*n; i++) {
    if (B[i] < minval) {
      minval = B[i];
    }
    if (B[i] > maxval) {
      maxval = B[i];
    }
    sum += B[i];
  }
  printf("MIN: %20.16e\n", minval);
  printf("MAX: %20.16e\n", maxval);
  printf("AVG: %20.16e\n", sum*isize);
}
