#include <stdlib.h>
#include <stdio.h>
#include "dims.h"

void do_write(int i, int j, double* A, double* B) {

  FILE* outfileh = fopen("output.txt", "ab");

  for (int k=0; k<o; k++) {
    B[j*m+i] += A[k*m*n+j*m+i];
    fwrite(B+j*m+i, sizeof(double), 1, outfileh);
  }
  fclose(outfileh);

}

void do_comp(double* A, double* B) {

  for (int j=0; j<n; j++) {
    for (int i=0; i<m; i++) {
      do_write(i, j, A, B);
    }
    printf("%d %d\n", j, n);
  }

}

void do_read(double* C) {

  FILE* infileh = fopen("output.txt", "rb");

  for (int j=0; j<n; j++) {
    for (int i=0; i<m; i++) {
      for (int k=0; k<o; k++) {
        fread(C+j*m*o+i*o+k, sizeof(double), 1, infileh);
      }
    }
  }
  fclose(infileh);
}
