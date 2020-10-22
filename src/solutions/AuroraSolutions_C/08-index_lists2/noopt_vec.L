NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:11:21 2019
FILE NAME: vec.c

FUNCTION NAME: do_comp
DIAGNOSTIC LIST

 LINE              DIAGNOSTIC MESSAGE

    10: vec( 103): Unvectorized loop.
    10: vec( 110): Vectorization obstructive function reference.: printf
    13: opt(1118): This I/O statement inhibits optimization of loop.


NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:11:21 2019
FILE NAME: vec.c

FUNCTION NAME: do_comp
FORMAT LIST

 LINE   LOOP      STATEMENT

     5:           void do_comp(double* A, double* B, double* C, double* D) {
     6:             double static const eps = 0.001;
     7:           
     8: +------>    for (int k=0; k<o; k++) {
     9: |+----->      for (int j=0; j<n; j++) {
    10: ||+---->        for (int i=0; i<m; i++) {
    11: |||               int idx=j*m+i;
    12: |||               if (fabs(C[k] - D[idx]) < eps) {
    13: |||                 printf("WARNING: |C(k) - D(i,j)| < eps\n"
    14: |||                        "for i=%d,j=%d,k=%d\n"
    15: |||                        "and C[k] = %16.12f, D[j*m+i] = %16.12f\n", i, j, k, C[k], D[idx]);
    16: |||               } else {
    17: |||                 B[idx] += A[idx] / (C[k] - D[idx]);
    18: |||               }
    19: ||+----         }
    20: |+-----       }
    21: +------     }
    22:           }


