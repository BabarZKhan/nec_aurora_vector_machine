NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:08:55 2019
FILE NAME: test.c

FUNCTION NAME: doit
DIAGNOSTIC LIST

 LINE              DIAGNOSTIC MESSAGE

     9: vec( 101): Vectorized loop.
     9: err( 504): The number of VLOAD, VSTORE.:  2,  1.
     9: err( 505): The number of VGT,   VSC.   :  0,  0.
    18: vec( 101): Vectorized loop.
    18: err( 504): The number of VLOAD, VSTORE.:  2,  1.
    18: err( 505): The number of VGT,   VSC.   :  0,  0.
    27: vec( 101): Vectorized loop.
    27: err( 504): The number of VLOAD, VSTORE.:  2,  1.
    27: err( 505): The number of VGT,   VSC.   :  0,  0.
    29: vec( 128): Fused multiply-add operation applied.
    36: vec( 101): Vectorized loop.
    36: err( 504): The number of VLOAD, VSTORE.:  2,  1.
    36: err( 505): The number of VGT,   VSC.   :  0,  0.
    45: vec( 101): Vectorized loop.
    45: err( 504): The number of VLOAD, VSTORE.:  2,  1.
    45: err( 505): The number of VGT,   VSC.   :  0,  0.
    54: vec( 101): Vectorized loop.
    54: err( 504): The number of VLOAD, VSTORE.:  2,  1.
    54: err( 505): The number of VGT,   VSC.   :  0,  0.
    63: vec( 101): Vectorized loop.
    63: err( 504): The number of VLOAD, VSTORE.:  2,  1.
    63: err( 505): The number of VGT,   VSC.   :  0,  0.
    72: vec( 101): Vectorized loop.
    72: err( 504): The number of VLOAD, VSTORE.:  2,  1.
    72: err( 505): The number of VGT,   VSC.   :  0,  0.
    81: vec( 101): Vectorized loop.
    81: err( 504): The number of VLOAD, VSTORE.:  2,  1.
    81: err( 505): The number of VGT,   VSC.   :  0,  0.
    90: vec( 101): Vectorized loop.
    90: err( 504): The number of VLOAD, VSTORE.:  2,  1.
    90: err( 505): The number of VGT,   VSC.   :  0,  0.
    99: vec( 101): Vectorized loop.
    99: err( 504): The number of VLOAD, VSTORE.:  2,  1.
    99: err( 505): The number of VGT,   VSC.   :  0,  0.
   108: vec( 101): Vectorized loop.
   108: err( 504): The number of VLOAD, VSTORE.:  2,  1.
   108: err( 505): The number of VGT,   VSC.   :  0,  0.


NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:08:55 2019
FILE NAME: test.c

FUNCTION NAME: doit
FORMAT LIST

 LINE   LOOP      STATEMENT

     5:           void doit(int m, int n, double* A, double* B) {
     6:            
     7:             ftrace_region_begin("ADD");
     8: +------>    for (int i=0; i<m; i++) {
     9: |V----->       for (int j=0;j<n; j++) {
    10: ||                int idx = i*m + j;
    11: ||                B[idx] += A[idx];
    12: |V-----        }
    13: +------     }
    14:             ftrace_region_end("ADD");
    15:           
    16:             ftrace_region_begin("MUL");
    17: +------>    for (int i=0; i<m; i++) {
    18: |V----->       for (int j=0;j<n; j++) {
    19: ||                int idx = i*m + j;
    20: ||                B[idx] *= A[idx];
    21: |V-----        }
    22: +------     }
    23:             ftrace_region_end("MUL");
    24:           
    25:             ftrace_region_begin("FMA");
    26: +------>    for (int i=0; i<m; i++) {
    27: |V----->       for (int j=0;j<n; j++) {
    28: ||                int idx = i*m + j;
    29: ||      F         B[idx] += A[idx]*A[idx];
    30: |V-----        }
    31: +------     }
    32:             ftrace_region_end("FMA");
    33:           
    34:             ftrace_region_begin("DIV");
    35: +------>    for (int i=0; i<m; i++) {
    36: |V----->       for (int j=0;j<n; j++) {
    37: ||                int idx = i*m + j;
    38: ||                B[idx] /= A[idx];
    39: |V-----        }
    40: +------     }
    41:             ftrace_region_end("DIV");
    42:           
    43:             ftrace_region_begin("SQRT");
    44: +------>    for (int i=0; i<m; i++) {
    45: |V----->       for (int j=0;j<n; j++) {
    46: ||                int idx = i*m + j;
    47: ||                B[idx] += sqrt(A[idx]);
    48: |V-----        }
    49: +------     }
    50:             ftrace_region_end("SQRT");
    51:           
    52:             ftrace_region_begin("EXP");
    53: +------>    for (int i=0; i<m; i++) {
    54: |V----->       for (int j=0;j<n; j++) {
    55: ||                int idx = i*m + j;
    56: ||                B[idx] += exp(A[idx]);
    57: |V-----        }
    58: +------     }
    59:             ftrace_region_end("EXP");
    60:           
    61:             ftrace_region_begin("LOG");
    62: +------>    for (int i=0; i<m; i++) {
    63: |V----->       for (int j=0;j<n; j++) {
    64: ||                int idx = i*m + j;
    65: ||                B[idx] += log(A[idx]);
    66: |V-----        }
    67: +------     }
    68:             ftrace_region_end("LOG");
    69:           
    70:             ftrace_region_begin("EXP-LOG");
    71: +------>    for (int i=0; i<m; i++) {
    72: |V----->       for (int j=0;j<n; j++) {
    73: ||                int idx = i*m + j;
    74: ||                B[idx] += exp(1.17*log(A[idx]));
    75: |V-----        }
    76: +------     }
    77:             ftrace_region_end("EXP-LOG");
    78:           
    79:             ftrace_region_begin("POW");
    80: +------>    for (int i=0; i<m; i++) {
    81: |V----->       for (int j=0;j<n; j++) {
    82: ||                int idx = i*m + j;
    83: ||                B[idx] += pow(A[idx],0.17);
    84: |V-----        }
    85: +------     }
    86:             ftrace_region_end("POW");
    87:           
    88:             ftrace_region_begin("SIN");
    89: +------>    for (int i=0; i<m; i++) {
    90: |V----->       for (int j=0;j<n; j++) {
    91: ||                int idx = i*m + j;
    92: ||                B[idx] += sin(A[idx]);
    93: |V-----        }
    94: +------     }
    95:             ftrace_region_end("SIN");
    96:           
    97:             ftrace_region_begin("COS");
    98: +------>    for (int i=0; i<m; i++) {
    99: |V----->       for (int j=0;j<n; j++) {
   100: ||                int idx = i*m + j;
   101: ||                B[idx] += cos(A[idx]);
   102: |V-----        }
   103: +------     }
   104:             ftrace_region_end("COS");
   105:           
   106:             ftrace_region_begin("TAN");
   107: +------>    for (int i=0; i<m; i++) {
   108: |V----->       for (int j=0;j<n; j++) {
   109: ||                int idx = i*m + j;
   110: ||                B[idx] += tan(A[idx]);
   111: |V-----        }
   112: +------     }
   113:             ftrace_region_end("TAN");;
   114:           }


NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:08:55 2019
FILE NAME: test.c

FUNCTION NAME: main
DIAGNOSTIC LIST

 LINE              DIAGNOSTIC MESSAGE

   121: vec( 101): Vectorized loop.
   121: err( 504): The number of VLOAD, VSTORE.:  0,  2.
   121: err( 505): The number of VGT,   VSC.   :  0,  0.
   122: opt(1112): Loop fused with previous loop.: i
   124: vec( 103): Unvectorized loop.
   124: vec( 110): Vectorization obstructive function reference.: doit
   125: opt(1025): Reference to this function inhibits optimization.: doit


NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:08:55 2019
FILE NAME: test.c

FUNCTION NAME: main
FORMAT LIST

 LINE   LOOP      STATEMENT

   116:           int main() {
   117:           
   118:             const int m = 1000, n = 1000, iter = 1000;
   119:             double A[m*n], B[m*n];
   120:           
   121: |      >    for (int i=0; i<m*n; i++) B[i] = 0.0;
   122: V======>    for (int i=0; i<m*n; i++) A[i] = 1.1;
   123:           
   124: +------>    for (int i=0; i<iter; i++) {
   125: |             doit(m, n, A, B);
   126: +------     }
   127:           
   128:             printf("Done!\n");
   129:           
   130:           }


