NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:14:16 2019
FILE NAME: vec.c

FUNCTION NAME: do_comp1
DIAGNOSTIC LIST

 LINE              DIAGNOSTIC MESSAGE

     7: vec( 101): Vectorized loop.
     7: err( 504): The number of VLOAD, VSTORE.:  4,  1.
     7: err( 505): The number of VGT,   VSC.   :  0,  0.
     8: vec( 128): Fused multiply-add operation applied.


NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:14:16 2019
FILE NAME: vec.c

FUNCTION NAME: do_comp1
FORMAT LIST

 LINE   LOOP      STATEMENT

     4:           void do_comp1(double* A, double* B) {
     5:           
     6: +------>    for (int j=1; j<n-1; j++) {
     7: |V----->      for (int i=1; i<m-1; i++) {
     8: ||      F       B[j*m+i] += A[j*m+i] * A[(j-1)*m + i] - A[(j+1)*m + i];
     9: |V-----       }
    10: +------     }
    11:           }


NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:14:16 2019
FILE NAME: vec.c

FUNCTION NAME: do_comp2
DIAGNOSTIC LIST

 LINE              DIAGNOSTIC MESSAGE

    16: opt(1395): Inner loop stripped and strip loop moved outside outer loop.: i
    16: vec( 101): Vectorized loop.
    16: err( 504): The number of VLOAD, VSTORE.:  2,  1.
    16: err( 505): The number of VGT,   VSC.   :  0,  0.
    17: vec( 128): Fused multiply-add operation applied.


NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:14:16 2019
FILE NAME: vec.c

FUNCTION NAME: do_comp2
FORMAT LIST

 LINE   LOOP      STATEMENT

    13:           void do_comp2(double* B, double* C) {
    14:           
    15: +------>    for (int j=0; j<n; j++) {
    16: |V----->      for (int i=0; i<m; i++) {
    17: ||      F       B[j*m+i] += C[i] * C[i];
    18: |V-----       }
    19: +------     }
    20:           }


NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:14:17 2019
FILE NAME: vec.c

FUNCTION NAME: do_comp3
DIAGNOSTIC LIST

 LINE              DIAGNOSTIC MESSAGE

    26: vec( 101): Vectorized loop.
    26: err( 504): The number of VLOAD, VSTORE.:  2,  1.
    26: err( 505): The number of VGT,   VSC.   :  0,  0.
    27: vec( 128): Fused multiply-add operation applied.
    35: opt(1409): Alternate code generated.: i
    35: vec( 101): Vectorized loop.
    35: err( 504): The number of VLOAD, VSTORE.:  2,  1.
    35: vec( 102): Partially vectorized loop.
    35: err( 504): The number of VLOAD, VSTORE.:  1,  1.
    35: err( 505): The number of VGT,   VSC.   :  0,  0.
    36: opt(1036): Potential feedback - use directive or compiler option if OK.: E
    36: vec( 128): Fused multiply-add operation applied.
    36: vec( 122): Dependency unknown. Unvectorizable dependency is assumed.: *(E)
    44: vec( 101): Vectorized loop.
    44: err( 504): The number of VLOAD, VSTORE.:  2,  1.
    44: err( 505): The number of VGT,   VSC.   :  0,  0.
    45: vec( 128): Fused multiply-add operation applied.
    53: opt(1409): Alternate code generated.: i
    53: vec( 101): Vectorized loop.
    53: err( 504): The number of VLOAD, VSTORE.:  2,  1.
    53: vec( 102): Partially vectorized loop.
    53: err( 504): The number of VLOAD, VSTORE.:  1,  1.
    53: err( 505): The number of VGT,   VSC.   :  0,  0.
    54: opt(1036): Potential feedback - use directive or compiler option if OK.: E
    54: vec( 128): Fused multiply-add operation applied.
    54: vec( 122): Dependency unknown. Unvectorizable dependency is assumed.: *(E)
    62: vec( 101): Vectorized loop.
    62: err( 504): The number of VLOAD, VSTORE.:  1,  1.
    62: err( 505): The number of VGT,   VSC.   :  0,  0.


NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:14:17 2019
FILE NAME: vec.c

FUNCTION NAME: do_comp3
FORMAT LIST

 LINE   LOOP      STATEMENT

    22:           void do_comp3(double* E, double* F, double* B) {
    23:           
    24:             ftrace_region_begin("l-1");
    25: +------>    for (int j=0; j<n; j++) {
    26: |V----->      for (int i=0; i<m; i++) {
    27: ||      F       E[0*n*m+j*m+i] -= B[j*m+i]*B[j*m+i];
    28: |V-----       }
    29: +------     }
    30:             ftrace_region_end("l-1");
    31:           
    32:             ftrace_region_begin("l-2");
    33: +------>    for (int k=1; k<o; k++) {
    34: |+----->      for (int j=0; j<n; j++) {
    35: ||C---->        for (int i=0; i<m; i++) {
    36: |||     F         E[k*n*m+j*m+i] = E[(k-1)*n*m+j*m+i] - F[k*n*m+j*m+i]*F[k*n*m+j*m+i];
    37: ||C----         }
    38: |+-----       }
    39: +------     }
    40:             ftrace_region_end("l-2");
    41:           
    42:             ftrace_region_begin("l-3");
    43: +------>    for (int j=0; j<n; j++) {
    44: |V----->      for (int i=0; i<m; i++) {
    45: ||      F       E[(o-1)*n*m+j*m+i] += B[j*m+i] * B[j*m+i];
    46: |V-----       }
    47: +------     }
    48:             ftrace_region_end("l-3");
    49:           
    50:             ftrace_region_begin("l-4");
    51: +------>    for (int k=o-2; k>=0; k--) {
    52: |+----->      for (int j=0; j<n; j++) {
    53: ||C---->        for (int i=0; i<m; i++) {
    54: |||     F         E[k*n*m+j*m+i] = E[(k+1)*n*m+j*m+i] - F[k*n*m+j*m+i]*F[k*n*m+j*m+i];
    55: ||C----         }
    56: |+-----       }
    57: +------     }
    58:             ftrace_region_end("l-4");
    59:           
    60:             ftrace_region_begin("l-5");
    61: +------>    for (int j=0; j<n; j++) {
    62: |V----->      for (int i=0; i<m; i++) {
    63: ||              B[j*m+i] = E[0*n*m+j*m+i];
    64: |V-----       }
    65: +------     }
    66:             ftrace_region_end("l-5");
    67:           
    68:           }


