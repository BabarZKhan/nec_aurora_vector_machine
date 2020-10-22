NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:16:00 2019
FILE NAME: test.c

FUNCTION NAME: mat_init
DIAGNOSTIC LIST

 LINE              DIAGNOSTIC MESSAGE

     6: vec( 101): Vectorized loop.
     6: err( 504): The number of VLOAD, VSTORE.:  0,  4.
     6: err( 505): The number of VGT,   VSC.   :  0,  0.
     8: vec( 101): Vectorized loop.
     8: err( 504): The number of VLOAD, VSTORE.:  0,  1.
     8: err( 505): The number of VGT,   VSC.   :  0,  0.


NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:16:00 2019
FILE NAME: test.c

FUNCTION NAME: mat_init
FORMAT LIST

 LINE   LOOP      STATEMENT

     4:           void mat_init(int n, double* mat) {
     5:            
     6: V------>    for (int j=0; j<n; j++) {
     7: |             double rj = (double) (j+1);
     8: |V----->      for (int i=0; i<n; i++) {
     9: ||              double ri = (double) (i+1);
    10: ||              int idx = j*n+i;
    11: ||              mat[idx] = sin(ri*ri)*sin(rj)*sin(ri*rj);
    12: |V-----       }
    13: V------     }
    14:           
    15:           }


NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:16:00 2019
FILE NAME: test.c

FUNCTION NAME: transpose_mat
DIAGNOSTIC LIST

 LINE              DIAGNOSTIC MESSAGE

    20: vec( 101): Vectorized loop.
    20: err( 504): The number of VLOAD, VSTORE.:  1,  1.
    20: err( 505): The number of VGT,   VSC.   :  0,  0.


NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:16:00 2019
FILE NAME: test.c

FUNCTION NAME: transpose_mat
FORMAT LIST

 LINE   LOOP      STATEMENT

    17:           void transpose_mat(int n, double* mat, double* mat2) {
    18:           
    19: +------>    for (int j=0; j<n; j++) {
    20: |V----->      for (int i=0; i<n; i++) {
    21: ||              mat2[j*n+i] = mat[i*n+j];
    22: |V-----       }
    23: +------     }
    24:           
    25:           }


NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:16:00 2019
FILE NAME: test.c

FUNCTION NAME: main
DIAGNOSTIC LIST

 LINE              DIAGNOSTIC MESSAGE

    38: vec( 103): Unvectorized loop.
    38: vec( 110): Vectorization obstructive function reference.: transpose_mat
    39: opt(1025): Reference to this function inhibits optimization.: transpose_mat
    46: vec( 101): Vectorized loop.
    46: err( 504): The number of VLOAD, VSTORE.:  1,  0.
    46: err( 505): The number of VGT,   VSC.   :  0,  0.
    48: vec( 126): Idiom detected.: Max/Min
    51: vec( 126): Idiom detected.: Max/Min
    53: vec( 126): Idiom detected.: Sum


NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:16:00 2019
FILE NAME: test.c

FUNCTION NAME: main
FORMAT LIST

 LINE   LOOP      STATEMENT

    28:           int main() {
    29:           
    30:             const int n=1024;
    31:             double mat[n*n];
    32:             double mat2[n*n];
    33:           
    34:             const int rep = 50;
    35:           
    36:             mat_init(n,mat);
    37:           
    38: +------>    for (int irep=0; irep<rep; irep++) {
    39: |             transpose_mat(n,mat,mat2);
    40: |             transpose_mat(n,mat2,mat);
    41: +------     }
    42:           
    43:             double minval = mat[0];
    44:             double maxval = mat[0];
    45:             double sum = mat[0];
    46: V------>    for (int i=1; i<n*n; i++) {
    47: |             if (mat[i] < minval) {
    48: |               minval = mat[i];
    49: |             }
    50: |             if (mat[i] > maxval) {
    51: |               maxval = mat[i];
    52: |             }
    53: |             sum += mat[i];
    54: V------     }
    55:             printf("MIN: %20.16e\n", minval);
    56:             printf("MAX: %20.16e\n", maxval);
    57:             printf("AVG: %20.16e\n", sum/n);
    58:           
    59:             return 0;
    60:            
    61:           }


