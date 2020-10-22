NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:16:14 2019
FILE NAME: test.c

FUNCTION NAME: main
DIAGNOSTIC LIST

 LINE              DIAGNOSTIC MESSAGE

    13: vec( 101): Vectorized loop.
    13: err( 504): The number of VLOAD, VSTORE.:  0,  1.
    13: err( 505): The number of VGT,   VSC.   :  0,  0.
    15: vec( 128): Fused multiply-add operation applied.
    15: vec( 101): Vectorized loop.
    15: err( 504): The number of VLOAD, VSTORE.:  0,  1.
    15: err( 505): The number of VGT,   VSC.   :  0,  0.
    18: vec( 110): Vectorization obstructive function reference.: do_comp
    19: opt(1025): Reference to this function inhibits optimization.: do_comp
    21: vec( 101): Vectorized loop.
    21: err( 504): The number of VLOAD, VSTORE.:  1,  1.
    21: err( 505): The number of VGT,   VSC.   :  0,  0.
    29: vec( 101): Vectorized loop.
    29: err( 504): The number of VLOAD, VSTORE.:  1,  0.
    29: err( 505): The number of VGT,   VSC.   :  0,  0.
    31: vec( 126): Idiom detected.: Max/Min
    34: vec( 126): Idiom detected.: Max/Min
    36: vec( 126): Idiom detected.: Sum


NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:16:14 2019
FILE NAME: test.c

FUNCTION NAME: main
FORMAT LIST

 LINE   LOOP      STATEMENT

     5:           int main () {
     6:             const int m = 100;
     7:             const int n = 100;
     8:             const int o = 100;
     9:             const int iter = 100000;
    10:           
    11:             double A[o*m*n], B[m*n];
    12:           
    13: V======>    for (int i=0; i<m*n; i++) B[i] = 0.0;
    14:             double p=2.0*acos(0.0)/137.0;
    15: V======>F   for (int i=0; i<m*n*o; i++) A[i] = fabs(2.0*(i/p-floor(i/p+0.5)));
    16:           
    17:             double isize = 1.0/(m*n);
    18: +------>    for (int i=0; i<iter; i++) {
    19: |             do_comp(m, n, o, A, B);
    20: |             //do_comp_general(m, n, o, A, B);
    21: |V----->      for (int j=0; j<m*n; j++) {
    22: ||              B[j] *= isize;
    23: |V-----       }
    24: +------     }
    25:           
    26:             double minval = B[0];
    27:             double maxval = B[0];
    28:             double sum = B[0];
    29: V------>    for (int i=1; i<m*n; i++) {
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
    40:             printf("AVG: %20.16e\n", sum*isize);
    41:           }


