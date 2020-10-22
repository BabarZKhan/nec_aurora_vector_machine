NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:09:45 2019
FILE NAME: test.c

FUNCTION NAME: main
DIAGNOSTIC LIST

 LINE              DIAGNOSTIC MESSAGE

    10: vec( 101): Vectorized loop.
    10: err( 504): The number of VLOAD, VSTORE.:  0,  2.
    10: err( 505): The number of VGT,   VSC.   :  0,  0.
    11: opt(1112): Loop fused with previous loop.: i
    12: vec( 101): Vectorized loop.
    12: err( 504): The number of VLOAD, VSTORE.:  0,  2.
    12: err( 505): The number of VGT,   VSC.   :  0,  0.
    13: opt(1112): Loop fused with previous loop.: i
    14: vec( 101): Vectorized loop.
    14: err( 504): The number of VLOAD, VSTORE.:  0,  1.
    14: err( 505): The number of VGT,   VSC.   :  0,  0.
    16: vec( 103): Unvectorized loop.
    16: vec( 110): Vectorization obstructive function reference.: do_loop
    18: opt(1025): Reference to this function inhibits optimization.: do_loop
    25: vec( 101): Vectorized loop.
    25: err( 504): The number of VLOAD, VSTORE.:  1,  0.
    25: err( 505): The number of VGT,   VSC.   :  0,  0.
    27: vec( 126): Idiom detected.: Max/Min
    30: vec( 126): Idiom detected.: Max/Min
    32: vec( 126): Idiom detected.: Sum


NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:09:45 2019
FILE NAME: test.c

FUNCTION NAME: main
FORMAT LIST

 LINE   LOOP      STATEMENT

     6:           int main () {
     7:             double A[m*n], B[m*n], C[m], D[m], L[o];
     8:             int today;
     9:           
    10: |      >    for (int i=0; i<n*m; i++) A[i] = 0.0;
    11: V======>    for (int i=0; i<n*m; i++) B[i] = 1.0;
    12: |      >    for (int i=0; i<m; i++) C[i] = 2.0;
    13: V======>    for (int i=0; i<m; i++) D[i] = 3.0;
    14: V======>    for (int i=0; i<o; i++) L[i] = sqrt((double)(i+1)) + 1.0;
    15:           
    16: +------>    for (int i=0; i<iter; i++) {
    17: |             today = (i+1)%7;
    18: |             do_loop(A, B, C, D, L, today);
    19: +------     }
    20:           
    21:           
    22:             double minval = A[0];
    23:             double maxval = A[0];
    24:             double sum = A[0];
    25: V------>    for (int i=1; i<m*n; i++) {
    26: |             if (A[i] < minval) {
    27: |               minval = A[i];
    28: |             }
    29: |             if (A[i] > maxval) {
    30: |               maxval = A[i];
    31: |             }
    32: |             sum += A[i];
    33: V------     }
    34:             printf("MIN: %20.16e\n", minval);
    35:             printf("MAX: %20.16e\n", maxval);
    36:             printf("AVG: %20.16e\n", sum/(m*n));
    37:           
    38:             return 0;
    39:           }


