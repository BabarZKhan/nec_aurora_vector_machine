NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:10:39 2019
FILE NAME: test.c

FUNCTION NAME: main
DIAGNOSTIC LIST

 LINE              DIAGNOSTIC MESSAGE

    10: vec( 101): Vectorized loop.
    10: err( 504): The number of VLOAD, VSTORE.:  0,  2.
    10: err( 505): The number of VGT,   VSC.   :  0,  0.
    12: opt(1112): Loop fused with previous loop.: i
    12: vec( 128): Fused multiply-add operation applied.
    14: vec( 103): Unvectorized loop.
    14: vec( 110): Vectorization obstructive function reference.: do_comp
    15: opt(1025): Reference to this function inhibits optimization.: do_comp
    21: vec( 101): Vectorized loop.
    21: err( 504): The number of VLOAD, VSTORE.:  1,  0.
    21: err( 505): The number of VGT,   VSC.   :  0,  0.
    23: vec( 126): Idiom detected.: Max/Min
    26: vec( 126): Idiom detected.: Max/Min
    28: vec( 126): Idiom detected.: Sum


NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:10:39 2019
FILE NAME: test.c

FUNCTION NAME: main
FORMAT LIST

 LINE   LOOP      STATEMENT

     6:           int main() {
     7:           
     8:             double A[m*n], B[m*n];
     9:            
    10: |      >    for (int i=0; i<m*n; i++) B[i] = 0.0;
    11: |           double p=2.0*acos(0.0)/137.0;
    12: V======>F   for (int i=0; i<m*n; i++) A[i] = maxi*(fabs(2.0*(i/p-floor(i/p+0.5))));
    13:            
    14: +------>    for (int i=0; i<iter; i++) {
    15: |             do_comp(A, B);
    16: +------     }
    17:            
    18:             double minval = B[0];
    19:             double maxval = B[0];
    20:             double sum = B[0];
    21: V------>    for (int i=1; i<m*n; i++) {
    22: |             if (B[i] < minval) {
    23: |               minval = B[i];
    24: |             }
    25: |             if (B[i] > maxval) {
    26: |               maxval = B[i];
    27: |             }
    28: |             sum += B[i];
    29: V------     }
    30:             printf("MIN: %20.16e\n", minval);
    31:             printf("MAX: %20.16e\n", maxval);
    32:             printf("AVG: %20.16e\n", sum/(m*n));
    33:           
    34:             return 0;
    35:           }


