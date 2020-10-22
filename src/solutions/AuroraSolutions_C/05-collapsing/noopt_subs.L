NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:09:42 2019
FILE NAME: subs.c

FUNCTION NAME: init
DIAGNOSTIC LIST

 LINE              DIAGNOSTIC MESSAGE

     8: vec( 101): Vectorized loop.
     8: err( 504): The number of VLOAD, VSTORE.:  0,  1.
     8: err( 505): The number of VGT,   VSC.   :  0,  0.
     9: vec( 101): Vectorized loop.
     9: err( 504): The number of VLOAD, VSTORE.:  0,  1.
     9: err( 505): The number of VGT,   VSC.   :  0,  0.


NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:09:42 2019
FILE NAME: subs.c

FUNCTION NAME: init
FORMAT LIST

 LINE   LOOP      STATEMENT

     5:           void init(double* a) {
     6:            
     7: +------>    for (int k=0; k<n; k++) {
     8: |V----->      for (int j=0; j<m; j++) {
     9: ||V---->        for (int i=0; i<l; i++) {
    10: |||               int idx = k*m*l+j*l+i;
    11: |||               a[idx] = (i+1.)/(j+1.)*(k+1.);
    12: ||V----         }
    13: |V-----       }
    14: +------     }
    15:           
    16:           }


NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:09:42 2019
FILE NAME: subs.c

FUNCTION NAME: sub1
DIAGNOSTIC LIST

 LINE              DIAGNOSTIC MESSAGE

    22: vec( 101): Vectorized loop.
    22: err( 504): The number of VLOAD, VSTORE.:  2,  1.
    22: err( 505): The number of VGT,   VSC.   :  0,  0.
    24: vec( 128): Fused multiply-add operation applied.


NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:09:42 2019
FILE NAME: subs.c

FUNCTION NAME: sub1
FORMAT LIST

 LINE   LOOP      STATEMENT

    18:           void sub1(double* a, double* b) {
    19:            
    20: +------>    for (int k=0; k<n; k++) {
    21: |+----->      for (int j=0; j<m; j++) {
    22: ||V---->        for (int i=0; i<l; i++) {
    23: |||               int idx = k*m*l+j*l+i;
    24: |||     F         b[idx] = 0.99*b[idx]+a[idx];
    25: ||V----         }
    26: |+-----       }
    27: +------     }
    28:           
    29:           }


NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:09:42 2019
FILE NAME: subs.c

FUNCTION NAME: sub2
DIAGNOSTIC LIST

 LINE              DIAGNOSTIC MESSAGE

    35: vec( 101): Vectorized loop.
    35: err( 504): The number of VLOAD, VSTORE.:  2,  1.
    35: err( 505): The number of VGT,   VSC.   :  0,  0.


NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:09:42 2019
FILE NAME: subs.c

FUNCTION NAME: sub2
FORMAT LIST

 LINE   LOOP      STATEMENT

    31:           void sub2(double* a, double* b, int imax, int jmax, int kmax) {
    32:           
    33: +------>    for (int k=0; k<kmax; k++) {
    34: |+----->      for (int j=0; j<jmax; j++) {
    35: ||V---->        for (int i=0; i<imax; i++) {
    36: |||               int idx = k*m*l+j*l+i;
    37: |||               b[idx]=0.5*(b[idx]+a[idx]);
    38: ||V----         }
    39: |+-----       }
    40: +------     }
    41:           
    42:           }


NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:09:42 2019
FILE NAME: subs.c

FUNCTION NAME: sub3
DIAGNOSTIC LIST

 LINE              DIAGNOSTIC MESSAGE

    48: vec( 101): Vectorized loop.
    48: err( 504): The number of VLOAD, VSTORE.:  2,  1.
    48: err( 505): The number of VGT,   VSC.   :  0,  0.
    50: vec( 128): Fused multiply-add operation applied.


NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:09:42 2019
FILE NAME: subs.c

FUNCTION NAME: sub3
FORMAT LIST

 LINE   LOOP      STATEMENT

    44:           void sub3(double* a, double* b, int imax, int jmax, int kmax) {
    45:           
    46: +------>    for (int k=0; k<kmax; k++) {
    47: |+----->      for (int j=0; j<jmax; j++) {
    48: ||V---->        for (int i=0; i<imax; i++) {
    49: |||               int idx = k*m*l+j*l+i;
    50: |||     F         b[idx]=(sqrt(fabs(b[idx]))+a[idx]*a[idx]);
    51: ||V----         }
    52: |+-----       }
    53: +------     }
    54:           
    55:           }


NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:09:42 2019
FILE NAME: subs.c

FUNCTION NAME: sub4
DIAGNOSTIC LIST

 LINE              DIAGNOSTIC MESSAGE

    62: vec( 101): Vectorized loop.
    62: err( 504): The number of VLOAD, VSTORE.:  2,  1.
    62: err( 505): The number of VGT,   VSC.   :  0,  0.
    64: vec( 128): Fused multiply-add operation applied.


NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:09:42 2019
FILE NAME: subs.c

FUNCTION NAME: sub4
FORMAT LIST

 LINE   LOOP      STATEMENT

    58:           void sub4(double* a, double* b) {
    59:            
    60: +------>    for (int k=1; k<n-1; k++) {
    61: |+----->      for (int j=1; j<m-1; j++) {
    62: ||V---->        for (int i=1; i<l-1; i++) {
    63: |||               int idx = k*m*l+j*l+i;
    64: |||     F         b[idx] = b[idx]*b[idx]+a[idx]*a[idx];
    65: ||V----         }
    66: |+-----       }
    67: +------     }
    68:           
    69:           }


