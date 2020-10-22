NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:11:45 2019
FILE NAME: test.c

FUNCTION NAME: main
DIAGNOSTIC LIST

 LINE              DIAGNOSTIC MESSAGE

    10: vec( 101): Vectorized loop.
    10: err( 504): The number of VLOAD, VSTORE.:  0,  2.
    10: err( 505): The number of VGT,   VSC.   :  0,  0.
    12: opt(1112): Loop fused with previous loop.: i
    12: vec( 128): Fused multiply-add operation applied.
    20: vec( 101): Vectorized loop.
    20: err( 504): The number of VLOAD, VSTORE.:  1,  0.
    20: err( 505): The number of VGT,   VSC.   :  0,  0.
    22: vec( 126): Idiom detected.: Max/Min
    25: vec( 126): Idiom detected.: Max/Min
    27: vec( 126): Idiom detected.: Sum


NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:11:45 2019
FILE NAME: test.c

FUNCTION NAME: main
FORMAT LIST

 LINE   LOOP      STATEMENT

     6:           int main () {
     7:           
     8:             double A[m*n], B[m*n];
     9:           
    10: |      >    for (int i=0; i<m*n; i++) B[i] = 0.0;
    11: |           double p=2.0*acos(0.0)/137.0;
    12: V======>F   for (int i=0; i<m*n; i++) A[i] = minA + maxi*(fabs(2.0*(i/p-floor(i/p+0.5))));
    13:           
    14:             do_comp(A, B);
    15:             do_comp(A, B);
    16:           
    17:             double minval = B[0];
    18:             double maxval = B[0];
    19:             double sum = B[0];
    20: V------>    for (int i=1; i<m*n; i++) {
    21: |             if (B[i] < minval) {
    22: |               minval = B[i];
    23: |             }
    24: |             if (B[i] > maxval) {
    25: |               maxval = B[i];
    26: |             }
    27: |             sum += B[i];
    28: V------     }
    29:             printf("MIN: %20.16e\n", minval);
    30:             printf("MAX: %20.16e\n", maxval);
    31:             printf("AVG: %20.16e\n", sum/(m*n));
    32:           }


