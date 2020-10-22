#include <ftrace.h>
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include "dims.h"
#include "vec.h"

int main () {
  double A[m*n], B[m*n], C[o], D[m*n];

  for (int i=0; i<m*n; i++) B[i] = 0.0;
  C[0] = 2.0;
  for (int i=1; i<o; i++) C[i] = 1.0;
  for (int j=0; j<n; j++) {
    D[j*m] = 2.0;
    for (int i=1; i<m; i++) D[j*m+i] = 0;
  }
  double p=2*acos(0.0)/137.0;
  for (int i=0; i<m*n; i++) A[i] = maxi*(fabs(2.0*(i/p-floor(i/p+0.5))));

  for (int i=0; i<iter; i++) {
    do_comp(A, B, C, D);
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
  printf("AVG: %20.16e\n", sum/(m*n));

  return 0;
}
