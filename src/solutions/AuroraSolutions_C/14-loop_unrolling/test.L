NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:14:33 2019
FILE NAME: test.c

FUNCTION NAME: main
DIAGNOSTIC LIST

 LINE              DIAGNOSTIC MESSAGE

     9: vec( 101): Vectorized loop.
     9: err( 504): The number of VLOAD, VSTORE.:  0,  1.
     9: err( 505): The number of VGT,   VSC.   :  0,  0.
    10: vec( 101): Vectorized loop.
    10: err( 504): The number of VLOAD, VSTORE.:  0,  1.
    10: err( 505): The number of VGT,   VSC.   :  0,  0.
    11: vec( 101): Vectorized loop.
    11: err( 504): The number of VLOAD, VSTORE.:  0,  2.
    11: err( 505): The number of VGT,   VSC.   :  0,  0.
    12: opt(1112): Loop fused with previous loop.: i
    14: vec( 128): Fused multiply-add operation applied.
    14: vec( 101): Vectorized loop.
    14: err( 504): The number of VLOAD, VSTORE.:  0,  1.
    14: err( 505): The number of VGT,   VSC.   :  0,  0.
    16: vec( 103): Unvectorized loop.
    16: vec( 110): Vectorization obstructive function reference.: do_comp2
    16: vec( 110): Vectorization obstructive function reference.: do_comp3
    16: vec( 110): Vectorization obstructive function reference.: do_comp1
    17: opt(1025): Reference to this function inhibits optimization.: do_comp1
    25: vec( 101): Vectorized loop.
    25: err( 504): The number of VLOAD, VSTORE.:  1,  0.
    25: err( 505): The number of VGT,   VSC.   :  0,  0.
    27: vec( 126): Idiom detected.: Max/Min
    30: vec( 126): Idiom detected.: Max/Min
    32: vec( 126): Idiom detected.: Sum


NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:14:33 2019
FILE NAME: test.c

FUNCTION NAME: main
FORMAT LIST

 LINE   LOOP      STATEMENT

     6:           int main () {
     7:             double A[m*n], B[m*n], C[m], E[m*n*o], F[m*n*o];
     8:           
     9: V======>    for (int i=0; i<m*n; i++) B[i] = 0.0;
    10: V======>    for (int i=0; i<m; i++) C[i] = 0.0;
    11: |      >    for (int i=0; i<m*n*o; i++) E[i] = 0.0;
    12: V======>    for (int i=0; i<m*n*o; i++) F[i] = 1.0;
    13:             double p=2.0*acos(0.0)/137.0;
    14: V======>F   for (int i=0; i<m*n; i++) A[i] = maxi*(fabs(2.0*(i/p-floor(i/p+0.5))));
    15:           
    16: +------>    for (int i=0; i<iter; i++) {
    17: |             do_comp1(A, B);
    18: |             do_comp2(B, C);
    19: |             do_comp3(E, F, B);
    20: +------     }
    21:           
    22:             double minval = B[0];
    23:             double maxval = B[0];
    24:             double sum = B[0];
    25: V------>    for (int i=1; i<m*n; i++) {
    26: |             if (B[i] < minval) {
    27: |               minval = B[i];
    28: |             }
    29: |             if (B[i] > maxval) {
    30: |               maxval = B[i];
    31: |             }
    32: |             sum += B[i];
    33: V------     }
    34:             printf("MIN: %20.16e\n", minval);
    35:             printf("MAX: %20.16e\n", maxval);
    36:             printf("AVG: %20.16e\n", sum/(m*n));
    37:           }


