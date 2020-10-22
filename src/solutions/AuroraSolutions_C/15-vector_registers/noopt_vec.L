NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:14:49 2019
FILE NAME: vec.c

FUNCTION NAME: do_comp1
DIAGNOSTIC LIST

 LINE              DIAGNOSTIC MESSAGE

     7: opt(1395): Inner loop stripped and strip loop moved outside outer loop.: i
     7: vec( 101): Vectorized loop.
     7: err( 504): The number of VLOAD, VSTORE.:  2,  1.
     7: err( 505): The number of VGT,   VSC.   :  0,  0.
     9: vec( 128): Fused multiply-add operation applied.


NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:14:49 2019
FILE NAME: vec.c

FUNCTION NAME: do_comp1
FORMAT LIST

 LINE   LOOP      STATEMENT

     4:           void do_comp1(double* A, double* C) {
     5:            
     6: +------>    for (int j=0; j<n; j++) {
     7: |V----->      for (int i=0; i<m; i++) {
     8: ||              int idx = j*m+i;
     9: ||      F       C[i] += A[idx] * A[idx];
    10: |V-----       }
    11: +------     }
    12:           
    13:           }


NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:14:49 2019
FILE NAME: vec.c

FUNCTION NAME: do_comp2
DIAGNOSTIC LIST

 LINE              DIAGNOSTIC MESSAGE

    18: opt(1395): Inner loop stripped and strip loop moved outside outer loop.: i
    18: vec( 101): Vectorized loop.
    18: err( 504): The number of VLOAD, VSTORE.:  2,  1.
    18: err( 505): The number of VGT,   VSC.   :  0,  0.
    20: vec( 128): Fused multiply-add operation applied.


NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:14:49 2019
FILE NAME: vec.c

FUNCTION NAME: do_comp2
FORMAT LIST

 LINE   LOOP      STATEMENT

    15:           void do_comp2(double* B,double* C) {
    16:           
    17: +------>    for (int j=0; j<n; j++) {
    18: |V----->      for (int i=0; i<m; i++) {
    19: ||              int idx = j*m+i;
    20: ||      F       B[idx] += C[i] * C[i];
    21: |V-----       }
    22: +------     }
    23:           
    24:           }


NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:14:49 2019
FILE NAME: vec.c

FUNCTION NAME: do_comp3
DIAGNOSTIC LIST

 LINE              DIAGNOSTIC MESSAGE

    31: vec( 101): Vectorized loop.
    31: err( 504): The number of VLOAD, VSTORE.:  2,  1.
    31: err( 505): The number of VGT,   VSC.   :  0,  0.
    33: vec( 128): Fused multiply-add operation applied.
    41: opt(1409): Alternate code generated.: i
    41: vec( 101): Vectorized loop.
    41: err( 504): The number of VLOAD, VSTORE.:  2,  1.
    41: vec( 102): Partially vectorized loop.
    41: err( 504): The number of VLOAD, VSTORE.:  1,  1.
    41: err( 505): The number of VGT,   VSC.   :  0,  0.
    43: opt(1036): Potential feedback - use directive or compiler option if OK.: E
    43: vec( 128): Fused multiply-add operation applied.
    43: vec( 122): Dependency unknown. Unvectorizable dependency is assumed.: *(E)
    52: vec( 101): Vectorized loop.
    52: err( 504): The number of VLOAD, VSTORE.:  2,  1.
    52: err( 505): The number of VGT,   VSC.   :  0,  0.
    54: vec( 128): Fused multiply-add operation applied.
    62: opt(1409): Alternate code generated.: i
    62: vec( 101): Vectorized loop.
    62: err( 504): The number of VLOAD, VSTORE.:  2,  1.
    62: vec( 102): Partially vectorized loop.
    62: err( 504): The number of VLOAD, VSTORE.:  1,  1.
    62: err( 505): The number of VGT,   VSC.   :  0,  0.
    64: opt(1036): Potential feedback - use directive or compiler option if OK.: E
    64: vec( 128): Fused multiply-add operation applied.
    64: vec( 122): Dependency unknown. Unvectorizable dependency is assumed.: *(E)
    73: vec( 101): Vectorized loop.
    73: err( 504): The number of VLOAD, VSTORE.:  1,  1.
    73: err( 505): The number of VGT,   VSC.   :  0,  0.


NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:14:49 2019
FILE NAME: vec.c

FUNCTION NAME: do_comp3
FORMAT LIST

 LINE   LOOP      STATEMENT

    26:           void do_comp3(double* E, double* F, double* B) {
    27:            
    28:             ftrace_region_begin("l-1");
    29:             int k1=0;
    30: +------>    for (int j=0; j<n; j++) {
    31: |V----->      for (int i=0; i<m; i++) {
    32: ||              int idx=j*m+i;
    33: ||      F       E[k1*m*n+idx] -= B[idx] * B[idx];
    34: |V-----       }
    35: +------     }
    36:             ftrace_region_end("l-1");
    37:           
    38:             ftrace_region_begin("l-2");
    39: +------>    for (int k=1; k<o; k++) {
    40: |+----->      for (int j=0; j<n; j++) {
    41: ||C---->        for (int i=0; i<m; i++) {
    42: |||               int idx=j*m+i;
    43: |||     F         E[k*m*n+idx] = E[(k-1)*m*n+idx] - F[k*m*n+idx] * F[k*m*n+idx];
    44: ||C----         }
    45: |+-----       }
    46: +------     }
    47:             ftrace_region_end("l-2");
    48:           
    49:             ftrace_region_begin("l-3");
    50:             int k2=o-1;
    51: +------>    for (int j=0; j<n; j++) {
    52: |V----->      for (int i=0; i<m; i++) {
    53: ||              int idx=j*m+i;
    54: ||      F       E[k2*n*m+idx] += B[idx] * B[idx];
    55: |V-----       }
    56: +------     }
    57:             ftrace_region_end("l-3");
    58:           
    59:             ftrace_region_begin("l-4");
    60: +------>    for (int k=o-2; k>=0; k--) {
    61: |+----->      for (int j=0; j<n; j++) {
    62: ||C---->        for (int i=0; i<m; i++) {
    63: |||               int idx=j*m+i;
    64: |||     F         E[k*m*n+idx] = E[(k+1)*m*n+idx] - F[k*m*n+idx] * F[k*m*n+idx];
    65: ||C----         }
    66: |+-----       }
    67: +------     }
    68:             ftrace_region_end("l-4");
    69:           
    70:             ftrace_region_begin("l-5");
    71:             int k3=0;
    72: +------>    for (int j=0; j<n; j++) {
    73: |V----->      for (int i=0; i<m; i++) {
    74: ||              int idx=j*m+i;
    75: ||              B[idx] = E[k3*m*n+idx];
    76: |V-----       }
    77: +------     }
    78:             ftrace_region_end("l-5");
    79:           
    80:           }


NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:14:49 2019
FILE NAME: vec.c

FUNCTION NAME: do_comp4
DIAGNOSTIC LIST

 LINE              DIAGNOSTIC MESSAGE

    85: vec( 101): Vectorized loop.
    85: err( 504): The number of VLOAD, VSTORE.:  4,  1.
    85: err( 505): The number of VGT,   VSC.   :  0,  0.
    87: vec( 128): Fused multiply-add operation applied.


NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:14:49 2019
FILE NAME: vec.c

FUNCTION NAME: do_comp4
FORMAT LIST

 LINE   LOOP      STATEMENT

    82:           void do_comp4(double* A, double* B) {
    83:           
    84: +------>    for (int j=1; j<n-1; j++) {
    85: |V----->      for (int i=1; i<m-1; i++) {
    86: ||              int idx=j*m+i;
    87: ||      F       B[idx] += A[idx] * A[(j-1)*m+i] - A[(j+1)*m+i];
    88: |V-----       }
    89: +------     }
    90:           
    91:           }


