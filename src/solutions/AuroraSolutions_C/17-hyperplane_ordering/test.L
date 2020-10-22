NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:16:01 2019
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


NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:16:01 2019
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


NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:16:01 2019
FILE NAME: test.c

FUNCTION NAME: transpose_mat
DIAGNOSTIC LIST

 LINE              DIAGNOSTIC MESSAGE

    47: vec( 101): Vectorized loop.
    47: err( 504): The number of VLOAD, VSTORE.:  1,  1.
    47: err( 505): The number of VGT,   VSC.   :  0,  0.
    51: opt(1033): Potential multiple store conflict -- use directive if OK.: mat2
    60: vec( 101): Vectorized loop.
    60: err( 504): The number of VLOAD, VSTORE.:  1,  1.
    60: err( 505): The number of VGT,   VSC.   :  0,  0.
    64: opt(1033): Potential multiple store conflict -- use directive if OK.: mat2


NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:16:01 2019
FILE NAME: test.c

FUNCTION NAME: transpose_mat
FORMAT LIST

 LINE   LOOP      STATEMENT

    17:           void transpose_mat(int n, double* mat, double* mat2) {
    18:           
    19:             // replace the linear matrix access with hyper plane ordering access
    20:             //
    21:             // note that in each skew diagonal the sum of indices
    22:             // is always equal to the index of the skew diagonal
    23:             //
    24:             // e.g.: the elements (2,0), (1,1), (0,2) all have a sum of indices of 2
    25:             //       they all lie on the 2nd (starting at 0) skew diagonal
    26:             //
    27:             // +-----+-----+-----+-----+
    28:             // | 0,0 | 0,1 | 0,2 | 0,3 |
    29:             // +-----+-----+-----+-----+
    30:             // | 1,0 | 1,1 | 1,2 | 1,3 |
    31:             // +-----+-----+-----+-----+
    32:             // | 2,0 | 2,1 | 2,2 | 2,3 |
    33:             // +-----+-----+-----+-----+
    34:             // | 3,0 | 3,1 | 3,2 | 3,3 |
    35:             // +-----+-----+-----+-----+
    36:             //
    37:             // by accessing the elements on a skew diagonal simultaniously
    38:             // only elements with an offset of (n-1) are read from memory
    39:             // this prohibits bank conflicts
    40:             //
    41:             // create a loop over the skew diagonals
    42:             // starting at the top left (l=0)
    43:             // stop before you reach the longest skew diagonal (l=n-1)
    44: +------>    for (int l=0; l<n; l++) {
    45: |             int minln = (l+1<n)?l+1:n;
    46: |             // loop over the amounts of elements in the skew diagonal
    47: |V----->      for (int j=0; j<minln; j++) {
    48: ||              // compute the index i by exploiting the fact, that the sum of indices
    49: ||              // is constant in one skew diagonal
    50: ||              int i = l-j;
    51: ||              mat2[j*n+i] = mat[i*n+j];
    52: |V-----       }
    53: +------     }
    54:           
    55:             // create a second loop for the lower right triangular matrix
    56:             // start at the longest skew diagonal (l=n)
    57:             // and end at the last one (l<2*n-2)
    58: +------>    for (int l=n; l<2*n-2; l++) {
    59: |             // loop over the amounts of elements in the skew diagonal
    60: |V----->      for (int j=l-n+1; j<n; j++) {
    61: ||              // compute the index i by exploiting the fact, that the sum of indices
    62: ||              // is constant in one skew diagonal
    63: ||              int i = l-j;
    64: ||              mat2[j*n+i] = mat[i*n+j];
    65: |V-----       }
    66: +------     }
    67:           
    68:           }


NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:16:01 2019
FILE NAME: test.c

FUNCTION NAME: main
DIAGNOSTIC LIST

 LINE              DIAGNOSTIC MESSAGE

    81: vec( 103): Unvectorized loop.
    81: vec( 110): Vectorization obstructive function reference.: transpose_mat
    82: opt(1025): Reference to this function inhibits optimization.: transpose_mat
    89: vec( 101): Vectorized loop.
    89: err( 504): The number of VLOAD, VSTORE.:  1,  0.
    89: err( 505): The number of VGT,   VSC.   :  0,  0.
    91: vec( 126): Idiom detected.: Max/Min
    94: vec( 126): Idiom detected.: Max/Min
    96: vec( 126): Idiom detected.: Sum


NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:16:01 2019
FILE NAME: test.c

FUNCTION NAME: main
FORMAT LIST

 LINE   LOOP      STATEMENT

    71:           int main() {
    72:           
    73:             const int n=1024;
    74:             double mat[n*n];
    75:             double mat2[n*n];
    76:           
    77:             const int rep = 50;
    78:           
    79:             mat_init(n,mat);
    80:           
    81: +------>    for (int irep=0; irep<rep; irep++) {
    82: |             transpose_mat(n,mat,mat2);
    83: |             transpose_mat(n,mat2,mat);
    84: +------     }
    85:           
    86:             double minval = mat[0];
    87:             double maxval = mat[0];
    88:             double sum = mat[0];
    89: V------>    for (int i=1; i<n*n; i++) {
    90: |             if (mat[i] < minval) {
    91: |               minval = mat[i];
    92: |             }
    93: |             if (mat[i] > maxval) {
    94: |               maxval = mat[i];
    95: |             }
    96: |             sum += mat[i];
    97: V------     }
    98:             printf("MIN: %20.16e\n", minval);
    99:             printf("MAX: %20.16e\n", maxval);
   100:             printf("AVG: %20.16e\n", sum/n);
   101:           
   102:             return 0;
   103:            
   104:           }


