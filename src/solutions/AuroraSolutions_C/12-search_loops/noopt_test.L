NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:14:01 2019
FILE NAME: test.c

FUNCTION NAME: main
DIAGNOSTIC LIST

 LINE              DIAGNOSTIC MESSAGE

     9: vec( 101): Vectorized loop.
     9: err( 504): The number of VLOAD, VSTORE.:  0,  1.
     9: err( 505): The number of VGT,   VSC.   :  0,  0.
    11: vec( 128): Fused multiply-add operation applied.
    11: vec( 101): Vectorized loop.
    11: err( 504): The number of VLOAD, VSTORE.:  0,  1.
    11: err( 505): The number of VGT,   VSC.   :  0,  0.
    13: vec( 128): Fused multiply-add operation applied.
    13: vec( 101): Vectorized loop.
    13: err( 504): The number of VLOAD, VSTORE.:  0,  1.
    13: err( 505): The number of VGT,   VSC.   :  0,  0.
    15: vec( 101): Vectorized loop.
    15: err( 504): The number of VLOAD, VSTORE.:  0,  1.
    15: err( 505): The number of VGT,   VSC.   :  0,  0.
    19: vec( 103): Unvectorized loop.
    19: vec( 110): Vectorization obstructive function reference.: do_comp_boolmask
    19: vec( 110): Vectorization obstructive function reference.: do_comp_indexlist
    19: vec( 110): Vectorization obstructive function reference.: do_comp_extensive
    20: opt(1025): Reference to this function inhibits optimization.: do_comp_extensive
    28: vec( 101): Vectorized loop.
    28: err( 504): The number of VLOAD, VSTORE.:  1,  0.
    28: err( 505): The number of VGT,   VSC.   :  0,  0.
    30: vec( 126): Idiom detected.: Max/Min
    33: vec( 126): Idiom detected.: Max/Min
    35: vec( 126): Idiom detected.: Sum


NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:14:01 2019
FILE NAME: test.c

FUNCTION NAME: main
FORMAT LIST

 LINE   LOOP      STATEMENT

     6:           int main () {
     7:             double A[o*m*n], B[m*n], C[m*n], L[o];
     8:           
     9: V======>    for (int i=0; i<m*n; i++) B[i] = 0.0;
    10:             double p=2.0*acos(0.0)/137.0;
    11: V======>F   for (int i=0; i<m*n*o; i++) A[i] = maxi*(fabs(2.0*(i/p-floor(i/p+0.5))));
    12:             p=exp(1.0)/42.0;
    13: V======>F   for (int i=0; i<m*n; i++) C[i] = 0.1+o*(fabs(2.0*(i/p-floor(i/p+0.5))));
    14:           
    15: V------>    for (int k=0; k<o; k++) {
    16: |             L[k] = o - k -1;
    17: V------     }
    18:           
    19: +------>    for (int i=0; i<iter; i++) {
    20: |             do_comp_extensive(A, B);
    21: |             do_comp_boolmask(A, B, C, L);
    22: |             do_comp_indexlist(A, B, C, L);
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


