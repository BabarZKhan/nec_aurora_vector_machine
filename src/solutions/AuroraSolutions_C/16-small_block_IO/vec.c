#include <stdlib.h>
#include <stdio.h>
#include "dims.h"

void do_write(double* Btmp) {

  FILE* outfileh = fopen("output.txt", "ab");
  // remove everything but IO from this routine
  // output.txt is written in the same order as Btmp is in memory
  // replace loops of IO into one giant IO operation
  fwrite(Btmp, n*m*o*sizeof(double), 1, outfileh);
  fclose(outfileh);

}

void do_comp(double* A, double* B) {

  // create temporary B tensor to reorder elements of B
  // to be able to write everything in one binary dump
  double Btmp[o*n*m];

  // pull all IO operations out of the inner loop and put into do_write
  for (int j=0; j<n; j++) {
    // inline the k-loop from do_write
    // k in j loop because:
    // o > n and enables keeping of progress output status at the end of loop
    for (int k=0; k<o; k++) {
      for (int i=0; i<m; i++) {
        // save status of each B(i,j) summation for IO
        B[j*m+i] += A[k*m*n+j*m+i];
        Btmp[j*m*o+i*o+k] = B[j*m+i];
      }
    }
    printf("%d %d\n", j, n);
  }

  do_write(Btmp);

}

void do_read(double* C) {

  FILE* infileh = fopen("output.txt", "rb");
  // read everything in one go
  fread(C, n*m*o*sizeof(double), 1, infileh);
  fclose(infileh);
}
