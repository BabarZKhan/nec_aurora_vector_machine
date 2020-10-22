#include <stdio.h>
#include <math.h>
#include "vec.h"
#include "dims.h"

int main () {
  double A[m*n], B[m*n], C[m], E[m*n*o], F[m*n*o];

  for (int i=0; i<m*n; i++) B[i] = 0.0;
  for (int i=0; i<m; i++) C[i] = 0.0;
  for (int i=0; i<m*n*o; i++) E[i] = 0.0;
  for (int i=0; i<m*n*o; i++) F[i] = 1.0;
  double p=2.0*acos(0.0)/137.0;
  for (int i=0; i<m*n; i++) A[i] = maxi*(fabs(2.0*(i/p-floor(i/p+0.5))));

  for (int i=0; i<iter; i++) {
    do_comp1(A, B);
    do_comp2(B, C);
    do_comp3(E, F, B);
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

}
