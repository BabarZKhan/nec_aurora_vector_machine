NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:09:43 2019
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


NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:09:43 2019
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


NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:09:43 2019
FILE NAME: subs.c

FUNCTION NAME: sub1
DIAGNOSTIC LIST

 LINE              DIAGNOSTIC MESSAGE

    22: vec( 101): Vectorized loop.
    22: err( 504): The number of VLOAD, VSTORE.:  2,  1.
    22: err( 505): The number of VGT,   VSC.   :  0,  0.
    23: vec( 128): Fused multiply-add operation applied.


NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:09:43 2019
FILE NAME: subs.c

FUNCTION NAME: sub1
FORMAT LIST

 LINE   LOOP      STATEMENT

    18:           void sub1(double* a, double* b) {
    19:            
    20:             // collapsing is always possible
    21:             // as i,j,k go from 0 to the size of the array minus one
    22: V------>    for (int i=0; i<l*n*m; i++) {
    23: |       F     b[i] = 0.99*b[i]+a[i];
    24: V------     }
    25:           }


NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:09:43 2019
FILE NAME: subs.c

FUNCTION NAME: sub2
DIAGNOSTIC LIST

 LINE              DIAGNOSTIC MESSAGE

    34: vec( 101): Vectorized loop.
    34: err( 504): The number of VLOAD, VSTORE.:  2,  1.
    34: err( 505): The number of VGT,   VSC.   :  0,  0.


NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:09:43 2019
FILE NAME: subs.c

FUNCTION NAME: sub2
FORMAT LIST

 LINE   LOOP      STATEMENT

    27:           void sub2(double* a, double* b, int imax, int jmax, int kmax) {
    28:           
    29:             // collapsing is not always possible!
    30:             // the values imax, jmax, and kmax might not span the complete array
    31:             // thus leaving holes
    32:             // as this routine is only used with known input parameters it is safe (in this
    33:             // case) to collapse the loop as shown above
    34: V------>    for (int i=0; i<imax*jmax*kmax; i++) {
    35: |             b[i]=0.5*(b[i]+a[i]);
    36: V------     }
    37:           
    38:           }


NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:09:43 2019
FILE NAME: subs.c

FUNCTION NAME: sub3
DIAGNOSTIC LIST

 LINE              DIAGNOSTIC MESSAGE

    48: vec( 101): Vectorized loop.
    48: err( 504): The number of VLOAD, VSTORE.:  2,  1.
    48: err( 505): The number of VGT,   VSC.   :  0,  0.
    50: vec( 128): Fused multiply-add operation applied.


NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:09:43 2019
FILE NAME: subs.c

FUNCTION NAME: sub3
FORMAT LIST

 LINE   LOOP      STATEMENT

    40:           void sub3(double* a, double* b, int imax, int jmax, int kmax) {
    41:           
    42:             // collapsing is not always possible!
    43:             // the values imax, jmax, and kmax might not span the complete array
    44:             // thus leaving holes
    45:             // Note that jmax is not equal to the size of the second dimension.
    46:             // this allows (in this case) only for a partial collapse
    47: +------>    for (int k=0; k<kmax; k++) {
    48: |V----->      for (int i=0; i<imax*jmax; i++) {
    49: ||              int idx = k*m*l+i;
    50: ||      F       b[idx]=(sqrt(fabs(b[idx]))+a[idx]*a[idx]);
    51: |V-----       }
    52: +------     }
    53:           
    54:           }


NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:09:43 2019
FILE NAME: subs.c

FUNCTION NAME: sub4
DIAGNOSTIC LIST

 LINE              DIAGNOSTIC MESSAGE

    64: vec( 101): Vectorized loop.
    64: err( 504): The number of VLOAD, VSTORE.:  2,  1.
    64: err( 505): The number of VGT,   VSC.   :  0,  0.
    66: vec( 128): Fused multiply-add operation applied.


NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:09:43 2019
FILE NAME: subs.c

FUNCTION NAME: sub4
FORMAT LIST

 LINE   LOOP      STATEMENT

    57:           void sub4(double* a, double* b) {
    58:            
    59:             // collapsing is not possible in any case
    60:             // from the usage of the array size
    61:             // it is known that there are holes between the different chunks of data
    62: +------>    for (int k=1; k<n-1; k++) {
    63: |+----->      for (int j=1; j<m-1; j++) {
    64: ||V---->        for (int i=1; i<l-1; i++) {
    65: |||               int idx = k*m*l+j*l+i;
    66: |||     F         b[idx] = b[idx]*b[idx]+a[idx]*a[idx];
    67: ||V----         }
    68: |+-----       }
    69: +------     }
    70:           
    71:           }


