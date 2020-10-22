#include <stdio.h>
#include <math.h>
#include "dims.h"
#include "vec.h"

int main () {
  double A[m*n], B[m*n], C[o];
  int i;

  double p=2.0*acos(0.0)/137.0;
  for (int i=0; i<m*n; i++) A[i] = 2.0*(fabs(2.0*(i/p-floor(i/p+0.5))));
  for (int i=0; i<m*n; i++) B[i] = 0.0;
  p=exp(1.0)/42.0;
  for (int i=0; i<o; i++) C[i] = 2.0*(fabs(2.0*(i/p-floor(i/p+0.5))));

  for (i=0; i<iter; i++) {
    do_comp1(A, B);
    do_comp2(A, B);
    do_comp3(A, B);
    do_comp4(A, B);
    do_comp5(A, B);
    do_comp6(A, B, C);
    do_comp7(A, B);
  }

  double minval = B[0];
  double maxval = B[0];
  double sum = B[0];
  for (i=1; i<m*n; i++) {
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
