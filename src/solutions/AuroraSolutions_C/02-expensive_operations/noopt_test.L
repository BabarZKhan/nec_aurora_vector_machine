NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:09:04 2019
FILE NAME: test.c

FUNCTION NAME: main
DIAGNOSTIC LIST

 LINE              DIAGNOSTIC MESSAGE

    11: vec( 128): Fused multiply-add operation applied.
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
    16: vec( 110): Vectorization obstructive function reference.: do_comp4
    16: vec( 110): Vectorization obstructive function reference.: do_comp5
    16: vec( 110): Vectorization obstructive function reference.: do_comp6
    16: vec( 110): Vectorization obstructive function reference.: do_comp7
    16: vec( 110): Vectorization obstructive function reference.: do_comp1
    17: opt(1025): Reference to this function inhibits optimization.: do_comp1
    29: vec( 101): Vectorized loop.
    29: err( 504): The number of VLOAD, VSTORE.:  1,  0.
    29: err( 505): The number of VGT,   VSC.   :  0,  0.
    31: vec( 126): Idiom detected.: Max/Min
    34: vec( 126): Idiom detected.: Max/Min
    36: vec( 126): Idiom detected.: Sum


NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:09:04 2019
FILE NAME: test.c

FUNCTION NAME: main
FORMAT LIST

 LINE   LOOP      STATEMENT

     6:           int main () {
     7:             double A[m*n], B[m*n], C[o];
     8:             int i;
     9:           
    10:             double p=2.0*acos(0.0)/137.0;
    11: |      >F   for (int i=0; i<m*n; i++) A[i] = 2.0*(fabs(2.0*(i/p-floor(i/p+0.5))));
    12: V======>    for (int i=0; i<m*n; i++) B[i] = 0.0;
    13:             p=exp(1.0)/42.0;
    14: V======>F   for (int i=0; i<o; i++) C[i] = 2.0*(fabs(2.0*(i/p-floor(i/p+0.5))));
    15:           
    16: +------>    for (i=0; i<iter; i++) {
    17: |             do_comp1(A, B);
    18: |             do_comp2(A, B);
    19: |             do_comp3(A, B);
    20: |             do_comp4(A, B);
    21: |             do_comp5(A, B);
    22: |             do_comp6(A, B, C);
    23: |             do_comp7(A, B);
    24: +------     }
    25:           
    26:             double minval = B[0];
    27:             double maxval = B[0];
    28:             double sum = B[0];
    29: V------>    for (i=1; i<m*n; i++) {
    30: |             if (B[i] < minval) {
    31: |               minval = B[i];
    32: |             }
    33: |             if (B[i] > maxval) {
    34: |               maxval = B[i];
    35: |             }
    36: |             sum += B[i];
    37: V------     }
    38:             printf("MIN: %20.16e\n", minval);
    39:             printf("MAX: %20.16e\n", maxval);
    40:             printf("AVG: %20.16e\n", sum/(m*n));
    41:           
    42:             return 0;
    43:           }


