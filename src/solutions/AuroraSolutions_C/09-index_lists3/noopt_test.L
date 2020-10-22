NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:11:32 2019
FILE NAME: test.c

FUNCTION NAME: main
DIAGNOSTIC LIST

 LINE              DIAGNOSTIC MESSAGE

    12: vec( 101): Vectorized loop.
    12: err( 504): The number of VLOAD, VSTORE.:  0,  2.
    12: err( 505): The number of VGT,   VSC.   :  0,  0.
    14: opt(1112): Loop fused with previous loop.: i
    14: vec( 128): Fused multiply-add operation applied.
    16: vec( 101): Vectorized loop.
    16: err( 504): The number of VLOAD, VSTORE.:  0,  2.
    16: err( 505): The number of VGT,   VSC.   :  0,  0.
    17: opt(1112): Loop fused with previous loop.: i
    19: vec( 110): Vectorization obstructive function reference.: do_comp
    20: vec( 101): Vectorized loop.
    20: err( 504): The number of VLOAD, VSTORE.:  1,  1.
    20: err( 505): The number of VGT,   VSC.   :  0,  0.
    21: opt(1025): Reference to this function inhibits optimization.: do_comp
    27: vec( 101): Vectorized loop.
    27: err( 504): The number of VLOAD, VSTORE.:  1,  0.
    27: err( 505): The number of VGT,   VSC.   :  0,  0.
    29: vec( 126): Idiom detected.: Max/Min
    32: vec( 126): Idiom detected.: Max/Min
    34: vec( 126): Idiom detected.: Sum


NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:11:32 2019
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
    16: |      >    for (int i=0; i<m; i++) ind1[i] = m-i-1;
    17: V======>    for (int i=0; i<m; i++) ind2[i] = i%l;
    18:           
    19: +------>    for (int i=0; i<iter; i++) {
    20: |V=====>      for (int j=0; j<m*n; j++) B[j] /= (m*n);
    21: |             do_comp(A, B, ind1, ind2);
    22: +------     }
    23:           
    24:             double minval = B[0];
    25:             double maxval = B[0];
    26:             double sum = B[0];
    27: V------>    for (int i=1; i<m*n; i++) {
    28: |             if (B[i] < minval) {
    29: |               minval = B[i];
    30: |             }
    31: |             if (B[i] > maxval) {
    32: |               maxval = B[i];
    33: |             }
    34: |             sum += B[i];
    35: V------     }
    36:             printf("MIN: %20.16e\n", minval);
    37:             printf("MAX: %20.16e\n", maxval);
    38:             printf("AVG: %20.16e\n", sum/(m*n));
    39:           
    40:             return 0;
    41:           
    42:           }


