#include <stdio.h>
#include <math.h>
#include "dims.h"
#include "vec.h"

int main() {

  double B[m*n];
  double A[o*m*n], C[(o+1)*m*n];
  int L1[m*n];
  int L2[m*n];

  int idx;

  for (int i=0; i<m*n; i++) B[i] = 1.0;
  for (int i=0; i<(o+1)*m*n; i++) C[i] = 0.0;
  double p=2.0*acos(0.0)/137.0;
  for (int i=0; i<m*n*o; i++) A[i] = maxi*(fabs(2.0*(i/p-floor(i/p+0.5))));

  for (int j=0; j<n; j++) {
    for (int i=0; i<m; i++) {
      idx = j*m+i;
      L1[idx] = o/10 + (int)(A[j*m*o+i*o+0]*10.0);
      L2[idx] = L1[idx];
      if (((i+1+j+1)%128) == 0) L2[idx] = o;
    }
  }

// IMPORANT A and L do not change for all calls to do_comp 
  do_comp(A, B, C, L1, "L1-BOOLM");
  do_comp(A, B, C, L1, "L1-STIDX");
  do_comp(A, B, C, L1, "L1-DYIDX");

  do_comp(A, B, C, L2, "L2-BOOLM");
  do_comp(A, B, C, L2, "L2-STIDX");
  do_comp(A, B, C, L2, "L2-DYIDX");

  double minval = C[0];
  double maxval = C[0];
  double sum = C[0];
  for (int i=1; i<(o+1)*m*n; i++) {
    if (C[i] < minval) {
      minval = C[i];
    } 
    if (C[i] > maxval) {
      maxval = C[i];
    }
    sum += C[i];
  }
  printf("MIN: %20.16e\n", minval);
  printf("MAX: %20.16e\n", maxval);
  printf("AVG: %20.16e\n", sum/((o+1)*m*n));

}
