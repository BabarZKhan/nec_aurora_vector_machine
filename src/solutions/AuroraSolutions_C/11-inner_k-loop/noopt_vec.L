NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:12:05 2019
FILE NAME: vec.c

FUNCTION NAME: do_comp
DIAGNOSTIC LIST

 LINE              DIAGNOSTIC MESSAGE

    10: vec( 103): Unvectorized loop.
    10: vec( 113): Overhead of loop division is too large.
    15: vec( 103): Unvectorized loop.
    16: opt(1036): Potential feedback - use directive or compiler option if OK.: B
    16: opt(1019): Feedback of scalar value from one loop pass to another.: B
    16: vec( 120): Unvectorizable dependency.: *(B)
    17: opt(1033): Potential multiple store conflict -- use directive if OK.: C
    18: opt(1512): Loop unrolled.: k
    19: opt(1033): Potential multiple store conflict -- use directive if OK.: C
    19: opt(1036): Potential feedback - use directive or compiler option if OK.: C


NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:12:05 2019
FILE NAME: vec.c

FUNCTION NAME: do_comp
FORMAT LIST

 LINE   LOOP      STATEMENT

     6:           void do_comp(double* A, double* B, double* C, int* L, char* ftraceident) {
     7:           
     8:             ftrace_region_begin(ftraceident);
     9: +------>    for (int j=0; j<n; j++) {
    10: |+----->      for (int i=0; i<m; i++) {
    11: ||              int idx = j*m+i;
    12: ||              int idx2 = j*m*o+i*o;
    13: ||              int idx3 = j*m*(o+1)+i*(o+1);
    14: ||              int lij = L[idx];
    15: ||+---->        for (int k=0; k<lij; k++) {
    16: |||               B[idx] += sqrt((k+1)*B[idx]) * exp(sin(A[idx2+k]));
    17: |||               C[idx3+k] = B[idx] * A[idx2+k];
    18: ||+----         }
    19: ||              C[idx3+lij] = C[idx3 +lij-1] + sqrt(B[idx]);
    20: |+-----       }
    21: +------     }
    22:             ftrace_region_end(ftraceident);
    23:           
    24:           }


