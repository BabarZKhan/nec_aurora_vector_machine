NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:11:44 2019
FILE NAME: test.c

FUNCTION NAME: main
DIAGNOSTIC LIST

 LINE              DIAGNOSTIC MESSAGE

    12: vec( 101): Vectorized loop.
    12: err( 504): The number of VLOAD, VSTORE.:  0,  2.
    12: err( 505): The number of VGT,   VSC.   :  0,  0.
    14: opt(1112): Loop fused with previous loop.: i
    14: vec( 128): Fused multiply-add operation applied.
    18: vec( 110): Vectorization obstructive function reference.: do_comp
    19: vec( 101): Vectorized loop.
    19: err( 504): The number of VLOAD, VSTORE.:  1,  1.
    19: err( 505): The number of VGT,   VSC.   :  0,  0.
    20: opt(1025): Reference to this function inhibits optimization.: do_comp
    26: vec( 101): Vectorized loop.
    26: err( 504): The number of VLOAD, VSTORE.:  1,  0.
    26: err( 505): The number of VGT,   VSC.   :  0,  0.
    28: vec( 126): Idiom detected.: Max/Min
    31: vec( 126): Idiom detected.: Max/Min
    33: vec( 126): Idiom detected.: Sum


NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:11:44 2019
FILE NAME: test.c

FUNCTION NAME: main
FORMAT LIST

 LINE   LOOP      STATEMENT

     7:           int main() {
     8:           
     9:             double A[m*n], B[m*n];
    10:             int ind1[m], ind2[m];
    11:           
    12: |      >    for (int i=0; i<m*n; i++) B[i] = 0.0;
    13: |           double p=2.0*acos(0.0)/137.0;
    14: V======>F   for (int i=0; i<m*n; i++) A[i] = maxi*(fabs(2.0*(i/p-floor(i/p+0.5))));
    15:           
    16:             //remove index list creation
    17:           
    18: +------>    for (int i=0; i<iter; i++) {
    19: |V=====>      for (int j=0; j<m*n; j++) B[j] /= (m*n);
    20: |             do_comp(A, B, ind1, ind2);
    21: +------     }
    22:           
    23:             double minval = B[0];
    24:             double maxval = B[0];
    25:             double sum = B[0];
    26: V------>    for (int i=1; i<m*n; i++) {
    27: |             if (B[i] < minval) {
    28: |               minval = B[i];
    29: |             }
    30: |             if (B[i] > maxval) {
    31: |               maxval = B[i];
    32: |             }
    33: |             sum += B[i];
    34: V------     }
    35:             printf("MIN: %20.16e\n", minval);
    36:             printf("MAX: %20.16e\n", maxval);
    37:             printf("AVG: %20.16e\n", sum/(m*n));
    38:           
    39:             return 0;
    40:           
    41:           }


