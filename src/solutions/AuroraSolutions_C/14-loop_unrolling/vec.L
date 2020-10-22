NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:14:34 2019
FILE NAME: vec.c

FUNCTION NAME: do_comp1
DIAGNOSTIC LIST

 LINE              DIAGNOSTIC MESSAGE

     8: opt(1592): Outer loop unrolled inside inner loop.: j
     9: err( 504): The number of VLOAD, VSTORE.: 68, 32.
     9: vec( 101): Vectorized loop.
     9: err( 504): The number of VLOAD, VSTORE.:  4,  1.
     9: err( 505): The number of VGT,   VSC.   :  0,  0.
    10: vec( 128): Fused multiply-add operation applied.


NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:14:34 2019
FILE NAME: vec.c

FUNCTION NAME: do_comp1
FORMAT LIST

 LINE   LOOP      STATEMENT

     4:           void do_comp1(double* A, double* B) {
     5:           
     6:             // unroll the outer loop to decrease number of loads of A
     7:             #pragma _NEC outerloop_unroll(32)
     8: U------>    for (int j=1; j<n-1; j++) {
     9: |V----->      for (int i=1; i<m-1; i++) {
    10: ||      F       B[j*m+i] += A[j*m+i] * A[(j-1)*m + i] - A[(j+1)*m + i];
    11: |V-----       }
    12: U------     }
    13:           }


NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:14:34 2019
FILE NAME: vec.c

FUNCTION NAME: do_comp2
DIAGNOSTIC LIST

 LINE              DIAGNOSTIC MESSAGE

    18: opt(1592): Outer loop unrolled inside inner loop.: j
    19: err( 504): The number of VLOAD, VSTORE.: 17, 16.
    19: vec( 101): Vectorized loop.
    19: err( 504): The number of VLOAD, VSTORE.:  2,  1.
    19: err( 505): The number of VGT,   VSC.   :  0,  0.
    20: vec( 128): Fused multiply-add operation applied.


NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:14:34 2019
FILE NAME: vec.c

FUNCTION NAME: do_comp2
FORMAT LIST

 LINE   LOOP      STATEMENT

    15:           void do_comp2(double* B, double* C) {
    16:           
    17:             #pragma _NEC outerloop_unroll(16)
    18: U------>    for (int j=0; j<n; j++) {
    19: |V----->      for (int i=0; i<m; i++) {
    20: ||      F       B[j*m+i] += C[i] * C[i];
    21: |V-----       }
    22: U------     }
    23:           }


NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:14:34 2019
FILE NAME: vec.c

FUNCTION NAME: do_comp3
DIAGNOSTIC LIST

 LINE              DIAGNOSTIC MESSAGE

    28: opt(1592): Outer loop unrolled inside inner loop.: j
    29: err( 504): The number of VLOAD, VSTORE.:  8,  4.
    29: vec( 101): Vectorized loop.
    29: err( 504): The number of VLOAD, VSTORE.:  2,  1.
    29: err( 505): The number of VGT,   VSC.   :  0,  0.
    30: vec( 128): Fused multiply-add operation applied.
    38: opt(1592): Outer loop unrolled inside inner loop.: k
    40: err( 504): The number of VLOAD, VSTORE.: 10,  8.
    40: vec( 101): Vectorized loop.
    40: err( 504): The number of VLOAD, VSTORE.:  2,  1.
    40: err( 505): The number of VGT,   VSC.   :  0,  0.
    41: opt(1033): Potential multiple store conflict -- use directive if OK.: E
    41: opt(1036): Potential feedback - use directive or compiler option if OK.: E
    41: vec( 128): Fused multiply-add operation applied.
    48: opt(1592): Outer loop unrolled inside inner loop.: j
    49: err( 504): The number of VLOAD, VSTORE.:  8,  4.
    49: vec( 101): Vectorized loop.
    49: err( 504): The number of VLOAD, VSTORE.:  2,  1.
    49: err( 505): The number of VGT,   VSC.   :  0,  0.
    50: vec( 128): Fused multiply-add operation applied.
    58: opt(1592): Outer loop unrolled inside inner loop.: k
    59: opt(1409): Alternate code generated.: i
    59: err( 504): The number of VLOAD, VSTORE.:  4,  2.
    59: vec( 101): Vectorized loop.
    59: err( 504): The number of VLOAD, VSTORE.:  2,  1.
    59: err( 504): The number of VLOAD, VSTORE.:  2,  2.
    59: vec( 102): Partially vectorized loop.
    59: err( 504): The number of VLOAD, VSTORE.:  1,  1.
    59: err( 505): The number of VGT,   VSC.   :  0,  0.
    60: opt(1033): Potential multiple store conflict -- use directive if OK.: E
    60: opt(1036): Potential feedback - use directive or compiler option if OK.: E
    60: vec( 128): Fused multiply-add operation applied.
    60: vec( 122): Dependency unknown. Unvectorizable dependency is assumed.: *(E)
    67: opt(1592): Outer loop unrolled inside inner loop.: j
    68: err( 504): The number of VLOAD, VSTORE.:  4,  4.
    68: vec( 101): Vectorized loop.
    68: err( 504): The number of VLOAD, VSTORE.:  1,  1.
    68: err( 505): The number of VGT,   VSC.   :  0,  0.
    74: vec( 128): Fused multiply-add operation applied.
    74: vec( 122): Dependency unknown. Unvectorizable dependency is assumed.: *(E)


NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:14:34 2019
FILE NAME: vec.c

FUNCTION NAME: do_comp3
FORMAT LIST

 LINE   LOOP      STATEMENT

    25:           void do_comp3(double* E, double* F, double* B) {
    26:           
    27:             ftrace_region_begin("l-1");
    28: U------>    for (int j=0; j<n; j++) {
    29: |V----->      for (int i=0; i<m; i++) {
    30: ||      F       E[0*n*m+j*m+i] -= B[j*m+i]*B[j*m+i];
    31: |V-----       }
    32: U------     }
    33:             ftrace_region_end("l-1");
    34:           
    35:             ftrace_region_begin("l-2");
    36: +------>    for (int j=0; j<n; j++) {
    37: |             #pragma _NEC outerloop_unroll(8)
    38: |U----->      for (int k=1; k<o; k++) {
    39: ||              #pragma _NEC ivdep
    40: ||V---->        for (int i=0; i<m; i++) {
    41: |||     F         E[k*n*m+j*m+i] = E[(k-1)*n*m+j*m+i] - F[k*n*m+j*m+i]*F[k*n*m+j*m+i];
    42: ||V----         }
    43: |U-----       }
    44: +------     }
    45:             ftrace_region_end("l-2");
    46:           
    47:             ftrace_region_begin("l-3");
    48: U------>    for (int j=0; j<n; j++) {
    49: |V----->      for (int i=0; i<m; i++) {
    50: ||      F       E[(o-1)*n*m+j*m+i] += B[j*m+i] * B[j*m+i];
    51: |V-----       }
    52: U------     }
    53:             ftrace_region_end("l-3");
    54:           
    55:             ftrace_region_begin("l-4");
    56: +------>    for (int j=0; j<n; j++) {
    57: |             #pragma _NEC outerloop_unroll(2)
    58: |U----->      for (int k=o-2; k>=0; k--) {
    59: ||C---->        for (int i=0; i<m; i++) {
    60: |||     F         E[k*n*m+j*m+i] = E[(k+1)*n*m+j*m+i] - F[k*n*m+j*m+i]*F[k*n*m+j*m+i];
    61: ||C----         }
    62: |U-----       }
    63: +------     }
    64:             ftrace_region_end("l-4");
    65:           
    66:             ftrace_region_begin("l-5");
    67: U------>    for (int j=0; j<n; j++) {
    68: |V----->      for (int i=0; i<m; i++) {
    69: ||              B[j*m+i] = E[0*n*m+j*m+i];
    70: |V-----       }
    71: U------     }
    72:             ftrace_region_end("l-5");
    73:           
    74:         F }


