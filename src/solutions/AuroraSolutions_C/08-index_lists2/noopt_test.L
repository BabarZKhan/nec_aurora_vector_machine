NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:11:21 2019
FILE NAME: test.c

FUNCTION NAME: main
DIAGNOSTIC LIST

 LINE              DIAGNOSTIC MESSAGE

    11: vec( 101): Vectorized loop.
    11: err( 504): The number of VLOAD, VSTORE.:  0,  1.
    11: err( 505): The number of VGT,   VSC.   :  0,  0.
    13: vec( 101): Vectorized loop.
    13: err( 504): The number of VLOAD, VSTORE.:  0,  1.
    13: err( 505): The number of VGT,   VSC.   :  0,  0.
    15: opt(1033): Potential multiple store conflict -- use directive if OK.: D
    16: vec( 101): Vectorized loop.
    16: err( 504): The number of VLOAD, VSTORE.:  0,  1.
    16: err( 505): The number of VGT,   VSC.   :  0,  0.
    19: vec( 128): Fused multiply-add operation applied.
    19: vec( 101): Vectorized loop.
    19: err( 504): The number of VLOAD, VSTORE.:  0,  1.
    19: err( 505): The number of VGT,   VSC.   :  0,  0.
    21: vec( 103): Unvectorized loop.
    21: vec( 110): Vectorization obstructive function reference.: do_comp
    22: opt(1025): Reference to this function inhibits optimization.: do_comp
    28: vec( 101): Vectorized loop.
    28: err( 504): The number of VLOAD, VSTORE.:  1,  0.
    28: err( 505): The number of VGT,   VSC.   :  0,  0.
    30: vec( 126): Idiom detected.: Max/Min
    33: vec( 126): Idiom detected.: Max/Min
    35: vec( 126): Idiom detected.: Sum


NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:11:21 2019
FILE NAME: test.c

FUNCTION NAME: main
FORMAT LIST

 LINE   LOOP      STATEMENT

     8:           int main () {
     9:             double A[m*n], B[m*n], C[o], D[m*n];
    10:           
    11: V======>    for (int i=0; i<m*n; i++) B[i] = 0.0;
    12:             C[0] = 2.0;
    13: V======>    for (int i=1; i<o; i++) C[i] = 1.0;
    14: +------>    for (int j=0; j<n; j++) {
    15: |             D[j*m] = 2.0;
    16: |V=====>      for (int i=1; i<m; i++) D[j*m+i] = 0;
    17: +------     }
    18:             double p=2*acos(0.0)/137.0;
    19: V======>F   for (int i=0; i<m*n; i++) A[i] = maxi*(fabs(2.0*(i/p-floor(i/p+0.5))));
    20:           
    21: +------>    for (int i=0; i<iter; i++) {
    22: |             do_comp(A, B, C, D);
    23: +------     }
    24:           
    25:             double minval = B[0];
    26:             double maxval = B[0];
    27:             double sum = B[0];
    28: V------>    for (int i=1; i<m*n; i++) {
    29: |             if (B[i] < minval) {
    30: |               minval = B[i];
    31: |             }
    32: |             if (B[i] > maxval) {
    33: |               maxval = B[i];
    34: |             }
    35: |             sum += B[i];
    36: V------     }
    37:             printf("MIN: %20.16e\n", minval);
    38:             printf("MAX: %20.16e\n", maxval);
    39:             printf("AVG: %20.16e\n", sum/(m*n));
    40:           
    41:             return 0;
    42:           }


