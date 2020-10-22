#include <ftrace.h>
#include <stdio.h>
#include <stdlib.h>

void doit (int m, int n, int o, double* A, double* B, int* ind) {
  
  int i,j,k,idx;

  ftrace_region_begin("DIRECT");
#pragma _NEC novector
  for (j=0; j<n; j++) {
    for (i=0; i<m; i++) {
      idx = j*m+i;
      B[idx] += A[idx];
    }
  }
  ftrace_region_end("DIRECT");

  ftrace_region_begin("MASK");
#pragma _NEC novector
  for (j=0; j<n; j++) {
    for (i=0; i<m; i++) {
      idx = j*m+i;
      if (A[idx] > 0.0) {
        B[idx] += A[idx];
      }
    }
  }
  ftrace_region_end("MASK");

  ftrace_region_begin("GATHER");
#pragma _NEC novector
  for (j=0; j<n; j++) {
    for (i=0; i<m; i++) {
      idx = j*m+i;
      B[idx] += A[j*m+ind[i]];
    }
  }
  ftrace_region_end("GATHER");

  ftrace_region_begin("SCATTER");
#pragma _NEC novector
  for (j=0; j<n; j++) {
#pragma _NEC ivdep
    for (i=0; i<m; i++) {
      idx = j*m+i;
      B[j*m+ind[i]] = B[idx] +A[idx];
    }
  }
  ftrace_region_end("SCATTER");

  ftrace_region_begin("GATHER-SCATTER");
#pragma _NEC novector
  for (j=0; j<n; j++) {
#pragma _NEC ivdep
    for (i=0; i<m; i++) {
      idx = j*m+ind[i];
      B[idx] += A[j*m+i];
    }
  }
  ftrace_region_end("GATHER-SCATTER");

  ftrace_region_begin("FOLR");
#pragma _NEC novector
  for (j=0; j<n; j++) {
    for (i=1; i<m; i++) {
      idx = j*m+i;
      B[idx] = B[j*m+i-1] +A[idx];
    }
  }
  ftrace_region_end("FOLR");

  ftrace_region_begin("REDUCTION");
  j = 1;
#pragma _NEC novector
  for (i=0; i<m; i++) {
    for (k=0; k<o; k++) {
      idx = j*m+i;
      B[idx] += A[k*m+i];
    }
  }
  ftrace_region_end("REDUCTION");

}

int main () {

  int const m = 1000, n = 1000, o = 1000, iter = 1000;
  double A[m*n], B[m*n];
  int ind[m];

  for (int i=0; i<m*n; i++) B[i] = 0.0;
  for (int i=0; i<m*n; i++) A[i] = 1.0;
  for (int i=0; i<m; i++) ind[i] = m-i-1;

  for (int i=0; i<iter; i++) {
    doit(m, n, o, A, B, ind);
  }

  printf("Done!\n");
}
