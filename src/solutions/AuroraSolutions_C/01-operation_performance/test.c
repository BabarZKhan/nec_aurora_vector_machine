#include <stdio.h>
#include <ftrace.h>
#include <math.h>

void doit(int m, int n, double* A, double* B) {



// Addition  
  ftrace_region_begin("ADD");
  #pragma unroll_completely
  for (int i=0; i<m; i++) {
     for (int j=0;j<n; j++) {
        int idx = i*m + j;
        B[idx] += A[idx];
     }
  }
  ftrace_region_end("ADD");




//Multipliccation
  ftrace_region_begin("MUL");
  for (int i=0; i<m; i++) {
     for (int j=0;j<n; j++) {
        int idx = i*m + j;
        B[idx] *= A[idx];
     }
  }
  ftrace_region_end("MUL");




//	FMA
  ftrace_region_begin("FMA");
  for (int i=0; i<m; i++) {
     for (int j=0;j<n; j++) {
        int idx = i*m + j;
        B[idx] += A[idx]*A[idx];
     }
  }
  ftrace_region_end("FMA");



//DIV
  ftrace_region_begin("DIV");
  for (int i=0; i<m; i++) {
     for (int j=0;j<n; j++) {
        int idx = i*m + j;
        B[idx] /= A[idx];
     }
  }
  ftrace_region_end("DIV");



//SQRT
  ftrace_region_begin("SQRT");
  for (int i=0; i<m; i++) {
     for (int j=0;j<n; j++) {
        int idx = i*m + j;
        B[idx] += sqrt(A[idx]);
     }
  }
  ftrace_region_end("SQRT");


//EXP
  ftrace_region_begin("EXP");
  for (int i=0; i<m; i++) {
     for (int j=0;j<n; j++) {
        int idx = i*m + j;
        B[idx] += exp(A[idx]);
     }
  }
  ftrace_region_end("EXP");



//LOG
  ftrace_region_begin("LOG");
  for (int i=0; i<m; i++) {
     for (int j=0;j<n; j++) {
        int idx = i*m + j;
        B[idx] += log(A[idx]);
     }
  }
  ftrace_region_end("LOG");

  ftrace_region_begin("EXP-LOG");
  for (int i=0; i<m; i++) {
     for (int j=0;j<n; j++) {
        int idx = i*m + j;
        B[idx] += exp(1.17*log(A[idx]));
     }
  }
  ftrace_region_end("EXP-LOG");

  ftrace_region_begin("POW");
  for (int i=0; i<m; i++) {
     for (int j=0;j<n; j++) {
        int idx = i*m + j;
        B[idx] += pow(A[idx],0.17);
     }
  }
  ftrace_region_end("POW");

  ftrace_region_begin("SIN");
  for (int i=0; i<m; i++) {
     for (int j=0;j<n; j++) {
        int idx = i*m + j;
        B[idx] += sin(A[idx]);
     }
  }
  ftrace_region_end("SIN");

  ftrace_region_begin("COS");
  for (int i=0; i<m; i++) {
     for (int j=0;j<n; j++) {
        int idx = i*m + j;
        B[idx] += cos(A[idx]);
     }
  }
  ftrace_region_end("COS");

  ftrace_region_begin("TAN");
  for (int i=0; i<m; i++) {
     for (int j=0;j<n; j++) {
        int idx = i*m + j;
        B[idx] += tan(A[idx]);
     }
  }
  ftrace_region_end("TAN");;
}

int main() {

  const int m = 1000, n = 1000, iter = 1000;
  double A[m*n], B[m*n];

  for (int i=0; i<m*n; i++) B[i] = 0.0;
  for (int i=0; i<m*n; i++) A[i] = 1.1;

  for (int i=0; i<iter; i++) {
    doit(m, n, A, B);
  }

  printf("Done!\n");

}
