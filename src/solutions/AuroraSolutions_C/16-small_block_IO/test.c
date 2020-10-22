#include <stdlib.h>
#include <stdio.h>
#include <math.h>
#include "vec.h"
#include "dims.h"


int main() {
  double A[m*n*o], B[m*n], C[o*m*n];

  FILE* outfileh = fopen("output.txt", "wb");
  fclose(outfileh);

  for (int i=0; i<m*n; i++) B[i] = 0.0;
  double p=2.0*acos(0.0)/137.0;
  for (int i=0; i<m*n*o; i++) A[i] = maxi*fabs(2.0*(i/p-floor(i/p+0.5)));

  for (int i=0; i<iter; i++) {
    do_comp(A, B);
  }

  do_read(C);

  double minval = C[0];
  double maxval = C[0];
  double sum = C[0];
  for (int i=1; i<m*n*o; i++) {
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
  printf("AVG: %20.16e\n", sum/(m*n));
  system("if [[ $(which md5sum) == '' ]] ;"//&
         "then "//&
         "   echo 'No md5sum found!' ; "//&
         "else " //&
         "   md5sum output.txt;"//&
         "fi");
}
