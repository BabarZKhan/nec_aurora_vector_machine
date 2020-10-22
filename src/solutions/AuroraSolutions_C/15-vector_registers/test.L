NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:15:12 2019
FILE NAME: test.c

FUNCTION NAME: main
DIAGNOSTIC LIST

 LINE              DIAGNOSTIC MESSAGE

    12: vec( 101): Vectorized loop.
    12: err( 504): The number of VLOAD, VSTORE.:  0,  1.
    12: err( 505): The number of VGT,   VSC.   :  0,  0.
    13: vec( 101): Vectorized loop.
    13: err( 504): The number of VLOAD, VSTORE.:  0,  1.
    13: err( 505): The number of VGT,   VSC.   :  0,  0.
    14: vec( 101): Vectorized loop.
    14: err( 504): The number of VLOAD, VSTORE.:  0,  2.
    14: err( 505): The number of VGT,   VSC.   :  0,  0.
    15: opt(1112): Loop fused with previous loop.: i
    17: vec( 128): Fused multiply-add operation applied.
    17: vec( 101): Vectorized loop.
    17: err( 504): The number of VLOAD, VSTORE.:  0,  1.
    17: err( 505): The number of VGT,   VSC.   :  0,  0.
    19: vec( 110): Vectorization obstructive function reference.: do_comp4
    19: vec( 110): Vectorization obstructive function reference.: do_comp3
    19: vec( 110): Vectorization obstructive function reference.: do_comp2
    19: vec( 110): Vectorization obstructive function reference.: do_comp1
    21: opt(1025): Reference to this function inhibits optimization.: do_comp1
    22: vec( 101): Vectorized loop.
    22: err( 504): The number of VLOAD, VSTORE.:  1,  1.
    22: err( 505): The number of VGT,   VSC.   :  0,  0.
    24: vec( 101): Vectorized loop.
    24: err( 504): The number of VLOAD, VSTORE.:  1,  1.
    24: err( 505): The number of VGT,   VSC.   :  0,  0.
    26: vec( 101): Vectorized loop.
    26: err( 504): The number of VLOAD, VSTORE.:  1,  1.
    26: err( 505): The number of VGT,   VSC.   :  0,  0.
    28: vec( 101): Vectorized loop.
    28: err( 504): The number of VLOAD, VSTORE.:  1,  1.
    28: err( 505): The number of VGT,   VSC.   :  0,  0.
    34: vec( 101): Vectorized loop.
    34: err( 504): The number of VLOAD, VSTORE.:  1,  0.
    34: err( 505): The number of VGT,   VSC.   :  0,  0.
    36: vec( 126): Idiom detected.: Max/Min
    39: vec( 126): Idiom detected.: Max/Min
    41: vec( 126): Idiom detected.: Sum


NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:15:12 2019
FILE NAME: test.c

FUNCTION NAME: main
FORMAT LIST

 LINE   LOOP      STATEMENT

     8:           int main() {
     9:           
    10:             double A[m*n], B[m*n], C[m], E[o*m*n], F[o*m*n];
    11:           
    12: V======>    for (int i=0; i<m*n; i++) B[i] = 0.0;
    13: V======>    for (int i=0; i<m; i++) C[i] = 0.0;
    14: |      >    for (int i=0; i<o*m*n; i++) E[i] = 0.0;
    15: V======>    for (int i=0; i<o*m*n; i++) F[i] = 1.0;
    16:             double p=2.0*acos(0.0)/137.0;
    17: V======>F   for (int i=0; i<m*n; i++) A[i] = maxi*(fabs(2.0*(i/p-floor(i/p+0.5))));
    18:           
    19: +------>    for (int i=0; i<iter; i++) {
    20: |             double isize = 1.0 / (m*n);
    21: |             do_comp1(A, C);
    22: |V=====>      for (int i=0; i<m*n; i++) B[i] *= isize;
    23: |             do_comp2(B, C);
    24: |V=====>      for (int i=0; i<m*n; i++) B[i] *= isize;
    25: |             do_comp3(E, F, B);
    26: |V=====>      for (int i=0; i<m*n; i++) B[i] *= isize;
    27: |             do_comp4(A, B);
    28: |V=====>      for (int i=0; i<m*n; i++) B[i] *= isize;
    29: +------     }
    30:           
    31:             double minval = B[0];
    32:             double maxval = B[0];
    33:             double sum = B[0];
    34: V------>    for (int i=1; i<m*n; i++) {
    35: |             if (B[i] < minval) {
    36: |               minval = B[i];
    37: |             }
    38: |             if (B[i] > maxval) {
    39: |               maxval = B[i];
    40: |             }
    41: |             sum += B[i];
    42: V------     }
    43:             printf("MIN: %20.16e\n", minval);
    44:             printf("MAX: %20.16e\n", maxval);
    45:             printf("AVG: %20.16e\n", sum/(m*n));
    46:           
    47:             return 0;
    48:           
    49:           }


