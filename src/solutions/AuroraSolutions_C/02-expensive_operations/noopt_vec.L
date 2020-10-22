NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:09:04 2019
FILE NAME: vec.c

FUNCTION NAME: do_comp1
DIAGNOSTIC LIST

 LINE              DIAGNOSTIC MESSAGE

     7: vec( 101): Vectorized loop.
     7: err( 504): The number of VLOAD, VSTORE.:  2,  1.
     7: err( 505): The number of VGT,   VSC.   :  0,  0.
     9: vec( 128): Fused multiply-add operation applied.


NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:09:04 2019
FILE NAME: vec.c

FUNCTION NAME: do_comp1
FORMAT LIST

 LINE   LOOP      STATEMENT

     4:           void do_comp1 (double* A, double* B) {
     5:           
     6: +------>    for (int j=1; j<n-1; j++) {
     7: |V----->      for (int i=1; i<m-1; i++) {
     8: ||              int idx = j*m+i;
     9: ||      F       B[idx] += pow(A[idx],3.0);
    10: |V-----       }
    11: +------     }
    12:           }


NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:09:04 2019
FILE NAME: vec.c

FUNCTION NAME: do_comp2
DIAGNOSTIC LIST

 LINE              DIAGNOSTIC MESSAGE

    17: vec( 101): Vectorized loop.
    17: err( 504): The number of VLOAD, VSTORE.:  2,  1.
    17: err( 505): The number of VGT,   VSC.   :  0,  0.


NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:09:04 2019
FILE NAME: vec.c

FUNCTION NAME: do_comp2
FORMAT LIST

 LINE   LOOP      STATEMENT

    14:           void do_comp2 (double* A, double* B) {
    15:           
    16: +------>    for (int j=1; j<n-1; j++) {
    17: |V----->      for (int i=1; i<m-1; i++) {
    18: ||              int idx = j*m+i;
    19: ||              B[idx] += pow(A[idx],0.5);
    20: |V-----       }
    21: +------     }
    22:           }


NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:09:04 2019
FILE NAME: vec.c

FUNCTION NAME: do_comp3
DIAGNOSTIC LIST

 LINE              DIAGNOSTIC MESSAGE

    27: vec( 101): Vectorized loop.
    27: err( 504): The number of VLOAD, VSTORE.:  2,  1.
    27: err( 505): The number of VGT,   VSC.   :  0,  0.


NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:09:04 2019
FILE NAME: vec.c

FUNCTION NAME: do_comp3
FORMAT LIST

 LINE   LOOP      STATEMENT

    24:           void do_comp3 (double* A, double* B) {
    25:           
    26: +------>    for (int j=1; j<n-1; j++) {
    27: |V----->      for (int i=1; i<m-1; i++) {
    28: ||              int idx = j*m+i;
    29: ||              B[idx] += pow(A[idx],-1.5);
    30: |V-----       }
    31: +------     }
    32:           }


NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:09:04 2019
FILE NAME: vec.c

FUNCTION NAME: do_comp4
DIAGNOSTIC LIST

 LINE              DIAGNOSTIC MESSAGE

    39: vec( 101): Vectorized loop.
    39: err( 504): The number of VLOAD, VSTORE.:  2,  1.
    39: err( 505): The number of VGT,   VSC.   :  0,  0.


NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:09:04 2019
FILE NAME: vec.c

FUNCTION NAME: do_comp4
FORMAT LIST

 LINE   LOOP      STATEMENT

    34:           void do_comp4 (double* A, double* B) {
    35:           
    36:             double const pi=2.0*acos(0.0);
    37:           
    38: +------>    for (int j=1; j<n-1; j++) {
    39: |V----->      for (int i=1; i<m-1; i++) {
    40: ||              int idx = j*m+i;
    41: ||              B[idx] += sqrt(sqrt(A[idx])*pi);
    42: |V-----       }
    43: +------     }
    44:           }


NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:09:04 2019
FILE NAME: vec.c

FUNCTION NAME: do_comp5
DIAGNOSTIC LIST

 LINE              DIAGNOSTIC MESSAGE

    49: vec( 101): Vectorized loop.
    49: err( 504): The number of VLOAD, VSTORE.:  2,  1.
    49: err( 505): The number of VGT,   VSC.   :  0,  0.
    56: vec( 101): Vectorized loop.
    56: err( 504): The number of VLOAD, VSTORE.:  2,  1.
    56: err( 505): The number of VGT,   VSC.   :  0,  0.


NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:09:04 2019
FILE NAME: vec.c

FUNCTION NAME: do_comp5
FORMAT LIST

 LINE   LOOP      STATEMENT

    46:           void do_comp5 (double* A, double* B) {
    47:           
    48: +------>    for (int j=0; j<n; j++) {
    49: |V----->      for (int i=0; i<m; i++) {
    50: ||              int idx = j*m+i;
    51: ||              B[idx] += pow(A[idx],0.834);
    52: |V-----       }
    53: +------     }
    54:           
    55: +------>    for (int j=1; j<n; j++) {
    56: |V----->      for (int i=0; i<m; i++) {
    57: ||              int idx = j*m+i;
    58: ||              B[idx] += 1.0/(1.0+pow(A[idx],0.834));
    59: |V-----       }
    60: +------     }
    61:           }


NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:09:04 2019
FILE NAME: vec.c

FUNCTION NAME: do_comp6
DIAGNOSTIC LIST

 LINE              DIAGNOSTIC MESSAGE

    66: opt(1589): Outer loop moved inside inner loop(s).: i
    66: vec( 101): Vectorized loop.
    66: err( 504): The number of VLOAD, VSTORE.:  2,  1.
    66: err( 505): The number of VGT,   VSC.   :  0,  0.


NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:09:04 2019
FILE NAME: vec.c

FUNCTION NAME: do_comp6
FORMAT LIST

 LINE   LOOP      STATEMENT

    63:           void do_comp6 (double* A, double* B, double* C) {
    64:           
    65: +------>    for (int j=1; j<n-1; j++) {
    66: |X----->      for (int i=1; i<m-1; i++) {
    67: ||*---->        for (int k=0; k<o; k++) {
    68: |||               int idx = j*m+i;
    69: |||               B[idx] += sqrt(C[k]*A[idx]);
    70: ||*----         }
    71: |X-----       }
    72: +------     }
    73:           }


NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:09:04 2019
FILE NAME: vec.c

FUNCTION NAME: do_comp7
DIAGNOSTIC LIST

 LINE              DIAGNOSTIC MESSAGE

    78: vec( 101): Vectorized loop.
    78: err( 504): The number of VLOAD, VSTORE.:  3,  1.
    78: err( 505): The number of VGT,   VSC.   :  0,  0.


NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:09:04 2019
FILE NAME: vec.c

FUNCTION NAME: do_comp7
FORMAT LIST

 LINE   LOOP      STATEMENT

    75:           void do_comp7 (double* A, double* B) {
    76:           
    77: +------>    for (int j=1; j<n-1; j++) {
    78: |V----->      for (int i=0; i<m; i++) {
    79: ||              int idx = j*m+i;
    80: ||              B[idx] += sqrt(A[idx]) + sqrt(A[idx-m]);
    81: |V-----       }
    82: +------     }
    83:           }


