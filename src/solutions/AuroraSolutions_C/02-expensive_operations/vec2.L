NEC C/C++ Compiler (3.0.6) for Vector Engine     Sat Aug 22 15:07:13 2020
FILE NAME: vec2.c

FUNCTION NAME: do_comp1
DIAGNOSTIC LIST

 LINE              DIAGNOSTIC MESSAGE

     7: vec( 101): Vectorized loop.
     7: err( 510): The number of VCOMPRESS, VEXPAND.:  0,  0.
     7: err( 504): The number of VLOAD, VSTORE.:  2,  1.
     7: err( 505): The number of VGT,   VSC.   :  0,  0.
    11: vec( 128): Fused multiply-add operation applied.


NEC C/C++ Compiler (3.0.6) for Vector Engine     Sat Aug 22 15:07:13 2020
FILE NAME: vec2.c

FUNCTION NAME: do_comp1
FORMAT LIST

 LINE   LOOP      STATEMENT

     4:           void do_comp1 (double* A, double* B) {
     5:           
     6: +------>    for (int j=1; j<n-1; j++) {
     7: |V----->      for (int i=1; i<m-1; i++) {
     8: ||              int idx = j*m+i;
     9: ||              // replace power to rational number with two multiplications
    10: ||              // to avoid expensive power function
    11: ||      F       B[idx] += A[idx]*A[idx]*A[idx];
    12: |V-----       }
    13: +------     }
    14:           }


NEC C/C++ Compiler (3.0.6) for Vector Engine     Sat Aug 22 15:07:13 2020
FILE NAME: vec2.c

FUNCTION NAME: do_comp2
DIAGNOSTIC LIST

 LINE              DIAGNOSTIC MESSAGE

    19: vec( 101): Vectorized loop.
    19: err( 510): The number of VCOMPRESS, VEXPAND.:  0,  0.
    19: err( 504): The number of VLOAD, VSTORE.:  2,  1.
    19: err( 505): The number of VGT,   VSC.   :  0,  0.


NEC C/C++ Compiler (3.0.6) for Vector Engine     Sat Aug 22 15:07:13 2020
FILE NAME: vec2.c

FUNCTION NAME: do_comp2
FORMAT LIST

 LINE   LOOP      STATEMENT

    16:           void do_comp2 (double* A, double* B) {
    17:           
    18: +------>    for (int j=1; j<n-1; j++) {
    19: |V----->      for (int i=1; i<m-1; i++) {
    20: ||              int idx = j*m+i;
    21: ||              // replace power to 0.5 by call of intrinsic sqrt
    22: ||              // to make use of hardware square root routine
    23: ||              B[idx] += sqrt(A[idx]);
    24: |V-----       }
    25: +------     }
    26:           }


NEC C/C++ Compiler (3.0.6) for Vector Engine     Sat Aug 22 15:07:13 2020
FILE NAME: vec2.c

FUNCTION NAME: do_comp3
DIAGNOSTIC LIST

 LINE              DIAGNOSTIC MESSAGE

    31: vec( 101): Vectorized loop.
    31: err( 510): The number of VCOMPRESS, VEXPAND.:  0,  0.
    31: err( 504): The number of VLOAD, VSTORE.:  2,  1.
    31: err( 505): The number of VGT,   VSC.   :  0,  0.
    35: vec( 128): Fused multiply-add operation applied.


NEC C/C++ Compiler (3.0.6) for Vector Engine     Sat Aug 22 15:07:13 2020
FILE NAME: vec2.c

FUNCTION NAME: do_comp3
FORMAT LIST

 LINE   LOOP      STATEMENT

    28:           void do_comp3 (double* A, double* B) {
    29:           
    30: +------>    for (int j=1; j<n-1; j++) {
    31: |V----->      for (int i=1; i<m-1; i++) {
    32: ||              int idx = j*m+i;
    33: ||              // replace by precomputed inverse square root and multiplication
    34: ||              double tmp = 1.0/sqrt(A[idx]);
    35: ||      F       B[idx] += tmp*tmp*tmp;
    36: |V-----       }
    37: +------     }
    38:           }


NEC C/C++ Compiler (3.0.6) for Vector Engine     Sat Aug 22 15:07:13 2020
FILE NAME: vec2.c

FUNCTION NAME: do_comp4
DIAGNOSTIC LIST

 LINE              DIAGNOSTIC MESSAGE

    47: vec( 101): Vectorized loop.
    47: err( 510): The number of VCOMPRESS, VEXPAND.:  0,  0.
    47: err( 504): The number of VLOAD, VSTORE.:  2,  1.
    47: err( 505): The number of VGT,   VSC.   :  0,  0.
    49: vec( 128): Fused multiply-add operation applied.


NEC C/C++ Compiler (3.0.6) for Vector Engine     Sat Aug 22 15:07:13 2020
FILE NAME: vec2.c

FUNCTION NAME: do_comp4
FORMAT LIST

 LINE   LOOP      STATEMENT

    40:           void do_comp4 (double* A, double* B) {
    41:           
    42:             double const pi=2.0*acos(0.0);
    43:             // precompute square root of pi
    44:             double const sqrtpi = sqrt(pi);
    45:           
    46: +------>    for (int j=1; j<n-1; j++) {
    47: |V----->      for (int i=1; i<m-1; i++) {
    48: ||              int idx = j*m+i;
    49: ||      F       B[idx] += sqrtpi*sqrt(sqrt(A[idx]));
    50: |V-----       }
    51: +------     }
    52:           }


NEC C/C++ Compiler (3.0.6) for Vector Engine     Sat Aug 22 15:07:13 2020
FILE NAME: vec2.c

FUNCTION NAME: do_comp5
DIAGNOSTIC LIST

 LINE              DIAGNOSTIC MESSAGE

    57: vec( 101): Vectorized loop.
    57: err( 510): The number of VCOMPRESS, VEXPAND.:  0,  0.
    57: err( 504): The number of VLOAD, VSTORE.:  2,  1.
    57: err( 505): The number of VGT,   VSC.   :  0,  0.
    63: vec( 101): Vectorized loop.
    63: err( 510): The number of VCOMPRESS, VEXPAND.:  0,  0.
    63: err( 504): The number of VLOAD, VSTORE.:  2,  1.
    63: err( 505): The number of VGT,   VSC.   :  0,  0.


NEC C/C++ Compiler (3.0.6) for Vector Engine     Sat Aug 22 15:07:13 2020
FILE NAME: vec2.c

FUNCTION NAME: do_comp5
FORMAT LIST

 LINE   LOOP      STATEMENT

    54:           void do_comp5 (double* A, double* B) {
    55:           
    56:             // do the part which is only done in one of the loops
    57: V------>    for (int i=0; i<m; i++) {
    58: |             B[i] += pow(A[i],0.834);
    59: V------     }
    60:           
    61:             // combine loops and precompute power of A[idx]
    62: +------>    for (int j=1; j<n; j++) {
    63: |V----->      for (int i=0; i<m; i++) {
    64: ||              int idx = j*m+i;
    65: ||              double tmp = pow(A[idx],0.834);
    66: ||              B[idx] += tmp + 1.0/(1.0+tmp);
    67: |V-----       }
    68: +------     }
    69:           }


NEC C/C++ Compiler (3.0.6) for Vector Engine     Sat Aug 22 15:07:14 2020
FILE NAME: vec2.c

FUNCTION NAME: do_comp6
DIAGNOSTIC LIST

 LINE              DIAGNOSTIC MESSAGE

    77: vec( 101): Vectorized loop.
    77: err( 510): The number of VCOMPRESS, VEXPAND.:  0,  0.
    77: err( 504): The number of VLOAD, VSTORE.:  1,  0.
    77: err( 505): The number of VGT,   VSC.   :  0,  0.
    78: vec( 126): Idiom detected.: Sum
    83: vec( 101): Vectorized loop.
    83: err( 510): The number of VCOMPRESS, VEXPAND.:  0,  0.
    83: err( 504): The number of VLOAD, VSTORE.:  2,  1.
    83: err( 505): The number of VGT,   VSC.   :  0,  0.
    85: vec( 128): Fused multiply-add operation applied.


NEC C/C++ Compiler (3.0.6) for Vector Engine     Sat Aug 22 15:07:14 2020
FILE NAME: vec2.c

FUNCTION NAME: do_comp6
FORMAT LIST

 LINE   LOOP      STATEMENT

    71:           void do_comp6 (double* A, double* B, double* C) {
    72:           
    73:             // pull out k-loop
    74:             // compute the sum over sqrt(C[k]) which is independent of i and j
    75:             // this changes the numerics of the checksum
    76:             double sum_sqrt_ck = 0.0;
    77: V------>    for (int k=0; k<o; k++) {
    78: |             sum_sqrt_ck += sqrt(C[k]);
    79: V------     }
    80:           
    81:             // only calculate i and j loop
    82: +------>    for (int j=1; j<n-1; j++) {
    83: |V----->      for (int i=1; i<m-1; i++) {
    84: ||              int idx = j*m+i;
    85: ||      F       B[idx] += sum_sqrt_ck*sqrt(A[idx]);
    86: |V-----       }
    87: +------     }
    88:           
    89:           }


NEC C/C++ Compiler (3.0.6) for Vector Engine     Sat Aug 22 15:07:14 2020
FILE NAME: vec2.c

FUNCTION NAME: do_comp7
DIAGNOSTIC LIST

 LINE              DIAGNOSTIC MESSAGE

    95: vec( 101): Vectorized loop.
    95: err( 510): The number of VCOMPRESS, VEXPAND.:  0,  0.
    95: err( 504): The number of VLOAD, VSTORE.:  1,  1.
    95: err( 505): The number of VGT,   VSC.   :  0,  0.
   101: vec( 101): Vectorized loop.
   101: err( 510): The number of VCOMPRESS, VEXPAND.:  0,  0.
   101: err( 504): The number of VLOAD, VSTORE.:  3,  2.
   101: err( 505): The number of VGT,   VSC.   :  0,  0.
   104: opt(1019): Feedback of scalar value from one loop pass to another.: sqrt_v


NEC C/C++ Compiler (3.0.6) for Vector Engine     Sat Aug 22 15:07:14 2020
FILE NAME: vec2.c

FUNCTION NAME: do_comp7
FORMAT LIST

 LINE   LOOP      STATEMENT

    91:           void do_comp7 (double* A, double* B) {
    92:           
    93:             // precompute the square root for j=0
    94:             double sqrt_v[m];
    95: V------>    for (int i=0; i<m; i++) {
    96: |             sqrt_v[i] = sqrt(A[i]);
    97: V------     }
    98:           
    99:             double sqrt_old, sqrt_new;
   100: +------>    for (int j=1; j<n-1; j++) {
   101: |V----->      for (int i=0; i<m; i++) {
   102: ||              int idx = j*m+i;
   103: ||              // reuse old square root
   104: ||              sqrt_old = sqrt_v[i];
   105: ||              sqrt_new = sqrt(A[idx]);
   106: ||              B[idx] += sqrt_old+sqrt_new;
   107: ||              sqrt_v[i] = sqrt_new;
   108: |V-----       }
   109: +------     }
   110:           }


