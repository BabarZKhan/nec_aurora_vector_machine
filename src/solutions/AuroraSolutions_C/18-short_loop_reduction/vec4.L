NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:16:14 2019
FILE NAME: vec4.c

FUNCTION NAME: do_comp
DIAGNOSTIC LIST

 LINE              DIAGNOSTIC MESSAGE

     3: vec( 130): Vector register is assigned.: s
    13: err( 508): Replaced with vector register.: s
    13: vec( 101): Vectorized loop.
    13: err( 504): The number of VLOAD, VSTORE.:  0,  1.
    13: err( 505): The number of VGT,   VSC.   :  0,  0.
    15: vec( 111): "novector" is specified.
    17: vec( 101): Vectorized loop.
    17: err( 504): The number of VLOAD, VSTORE.:  2,  1.
    17: err( 505): The number of VGT,   VSC.   :  0,  0.
    18: err( 508): Replaced with vector register.: s
    23: vec( 101): Vectorized loop.
    23: err( 504): The number of VLOAD, VSTORE.:  2,  1.
    23: err( 505): The number of VGT,   VSC.   :  0,  0.
    24: err( 508): Replaced with vector register.: s


NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:16:14 2019
FILE NAME: vec4.c

FUNCTION NAME: do_comp
FORMAT LIST

 LINE   LOOP      STATEMENT

     3:           void do_comp(int m, int n, int o, double* A, double* B) {
     4:            
     5:             // assign s to the vector registers
     6:             double s[vreg_len];
     7:             #pragma _NEC vreg(s)
     8:           
     9: +------>    for (int j=0; j<n; j++) {
    10: |             // utilize the shortloop directive to help the compiler
    11: |             // optimize the vector register loops in this short case
    12: |             #pragma _NEC shortloop
    13: |V=====>V     for (int i=0; i<m; i++) s[i] = 0.0;
    14: |             #pragma _NEC novector
    15: |+----->      for (int k=0; k<o; k++) {
    16: ||              #pragma _NEC shortloop
    17: ||V---->        for (int i=0; i<m; i++) {
    18: |||     V         s[i] += A[j*m*o+i*o+k];
    19: ||V----         }
    20: |+-----       }
    21: |             // sum up B
    22: |             #pragma _NEC shortloop
    23: |V----->      for (int i=0; i<m; i++) {
    24: ||      V       B[j*m+i] += s[i];
    25: |V-----       }
    26: +------     }
    27:           }


NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:16:14 2019
FILE NAME: vec4.c

FUNCTION NAME: do_comp_general
DIAGNOSTIC LIST

 LINE              DIAGNOSTIC MESSAGE

    29: vec( 130): Vector register is assigned.: s
    41: err( 508): Replaced with vector register.: s
    41: vec( 101): Vectorized loop.
    41: err( 504): The number of VLOAD, VSTORE.:  0,  1.
    41: err( 505): The number of VGT,   VSC.   :  0,  0.
    43: vec( 111): "novector" is specified.
    45: vec( 101): Vectorized loop.
    45: err( 504): The number of VLOAD, VSTORE.:  2,  1.
    45: err( 505): The number of VGT,   VSC.   :  0,  0.
    46: err( 508): Replaced with vector register.: s
    51: vec( 101): Vectorized loop.
    51: err( 504): The number of VLOAD, VSTORE.:  2,  1.
    51: err( 505): The number of VGT,   VSC.   :  0,  0.
    52: err( 508): Replaced with vector register.: s


NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:16:14 2019
FILE NAME: vec4.c

FUNCTION NAME: do_comp_general
FORMAT LIST

 LINE   LOOP      STATEMENT

    29:           void do_comp_general(int m, int n, int o, double* A, double* B) {
    30:            
    31:             // assign s to the vector registers
    32:             double s[vreg_len];
    33:             #pragma _NEC vreg(s)
    34:           
    35: +------>    for (int is=0; is<n; is+=vreg_len) {
    36: |             int ie = (is+vreg_len<n)?is+vreg_len:n;
    37: |+----->      for (int j=0; j<n; j++) {
    38: ||              // utilize the shortloop directive to help the compiler
    39: ||              // optimize the vector register loops in this short case
    40: ||              #pragma _NEC shortloop
    41: ||V====>V       for (int i=is; i<ie; i++) s[i-is] = 0.0;
    42: ||              #pragma _NEC novector
    43: ||+---->        for (int k=0; k<o; k++) {
    44: |||               #pragma _NEC shortloop
    45: |||V--->          for (int i=is; i<ie; i++) {
    46: ||||    V           s[i-is] += A[j*m*o+i*o+k];
    47: |||V---           }
    48: ||+----         }
    49: ||              // sum up B
    50: ||              #pragma _NEC shortloop
    51: ||V---->        for (int i=is; i<ie; i++) {
    52: |||     V         B[j*m+i] += s[i-is];
    53: ||V----         }
    54: |+-----       }
    55: +------     }
    56:           }


