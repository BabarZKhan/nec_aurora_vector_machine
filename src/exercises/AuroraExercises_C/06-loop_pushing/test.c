#include <stdio.h>
#include <math.h>
#include "dims.h"
#include "vec.h"

int main () {
  double A[m*n], B[m*n], C[m], D[m], L[o];
  int today;

  for (int i=0; i<n*m; i++) A[i] = 0.0;
  for (int i=0; i<n*m; i++) B[i] = 1.0;
  for (int i=0; i<m; i++) C[i] = 2.0;
  for (int i=0; i<m; i++) D[i] = 3.0;
  for (int i=0; i<o; i++) L[i] = sqrt((double)(i+1)) + 1.0;

  for (int i=0; i<iter; i++) {
    today = (i+1)%7;
    do_loop(A, B, C, D, L, today);
  }


  double minval = A[0];
  double maxval = A[0];
  double sum = A[0];
  for (int i=1; i<m*n; i++) {
    if (A[i] < minval) {
      minval = A[i];
    } 
    if (A[i] > maxval) {
      maxval = A[i];
    }
    sum += A[i];
  }
  printf("MIN: %20.16e\n", minval);
  printf("MAX: %20.16e\n", maxval);
  printf("AVG: %20.16e\n", sum/(m*n));

  return 0;
}
