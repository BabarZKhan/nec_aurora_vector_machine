#include <stdio.h>
#include <math.h>
#include "dims.h"
#include "vec.h"

int main () {
  double A[o*m*n], B[m*n], C[m*n], L[o];

  for (int i=0; i<m*n; i++) B[i] = 0.0;
  double p=2.0*acos(0.0)/137.0;
  for (int i=0; i<m*n*o; i++) A[i] = maxi*(fabs(2.0*(i/p-floor(i/p+0.5))));
  p=exp(1.0)/42.0;
  for (int i=0; i<m*n; i++) C[i] = 0.1+o*(fabs(2.0*(i/p-floor(i/p+0.5))));

  for (int k=0; k<o; k++) {
    L[k] = o - k -1;
  }

  for (int i=0; i<iter; i++) {
    do_comp_extensive(A, B);
    do_comp_boolmask(A, B, C, L);
    do_comp_indexlist(A, B, C, L);
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
