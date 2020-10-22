#include <stdio.h>
#include <math.h>
#include "dims.h"
#include "vec.h"


int main() {

  double A[m*n], B[m*n];
  int ind1[m], ind2[m];

  for (int i=0; i<m*n; i++) B[i] = 0.0;
  double p=2.0*acos(0.0)/137.0;
  for (int i=0; i<m*n; i++) A[i] = maxi*(fabs(2.0*(i/p-floor(i/p+0.5))));

  for (int i=0; i<m; i++) ind1[i] = m-i-1;
  for (int i=0; i<m; i++) ind2[i] = i%l;

  for (int i=0; i<iter; i++) {
    for (int j=0; j<m*n; j++) B[j] /= (m*n);
    do_comp(A, B, ind1, ind2);
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
