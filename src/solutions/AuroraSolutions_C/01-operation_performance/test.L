NEC C/C++ Compiler (3.0.8) for Vector Engine     Thu Sep 10 19:46:13 2020
FILE NAME : test.c

  COMPILER OPTIONS : -O3 -Wobsolescent -Wextension -Wall -std=gnu11 -ftrace -p -report-all -fdiag-vector=3 -c

  PARAMETER : 

      Optimization Options : 
        -On                                      : 3
        -fargument-alias                         : enable
        -fargument-noalias                       : disable
        -fassociative-math                       : enable
        -faggressive-associative-math            : disable
        -fcse-after-vectorization                : disable
        -ffast-math                              : enable
        -fignore-volatile                        : disable
        -fivdep                                  : disable
        -floop-collapse                          : enable
        -floop-count                             : 5000
        -floop-fusion                            : enable
        -floop-interchange                       : enable
        -floop-normalize                         : enable
        -floop-split                             : disable
        -floop-strip-mine                        : enable
        -floop-unroll                            : enable
        -floop-unroll-completely                 : 4
        -floop-unroll-max-times                  : auto
        -fmatrix-multiply                        : enable
        -fmove-loop-invariants                   : enable
        -fmove-loop-invariants-if                : enable
        -fmove-loop-invariants-unsafe            : disable
        -fmove-nested-loop-invariants-outer      : enable
        -fnaked-ivdep                            : disable
        -fnamed-alias                            : disable
        -fnamed-noalias                          : enable
        -fouterloop-unroll                       : enable
        -fouterloop-unroll-max-size              : 4
        -fouterloop-unroll-max-times             : 4
        -fprecise-math                           : disable
        -freciprocal-math                        : enable
        -freplace-loop-equation                  : disable
        -fstrict-aliasing                        : enable
        -fthis-pointer-alias                     : disable
        -fthis-pointer-noalias                   : enable
        -mlist-vector                            : disable
        -mretain-all                             : enable
        -mretain-list-vector                     : disable
        -mretain-none                            : disable
        -msched-none                             : disable
        -msched-insns                            : enable
        -msched-block                            : disable
        -mvector                                 : enable
        -mvector-advance-gather                  : enable
        -mvector-advance-gather-limit            : 56
        -mvector-dependency-test                 : enable
        -mvector-floating-divide-instruction     : disable
        -mvector-fma                             : enable
        -mvector-intrinsic-check                 : disable
        -mvector-iteration                       : enable
        -mvector-iteration-unsafe                : disable
        -mvector-loop-count-test                 : disable
        -mvector-low-precise-divide-function     : disable
        -mvector-merge-conditional               : enable
        -mvector-packed                          : disable
        -mvector-power-to-explog                 : disable
        -mvector-power-to-sqrt                   : enable
        -mvector-reduction                       : enable
        -mvector-shortloop-reduction             : disable
        -mvector-sqrt-instruction                : disable
        -mvector-threshold                       : 5
        -mwork-vector-kind=none                  : disable

      Parallelization Options : 
        -fopenmp                                 : disable
        -mparallel                               : disable
        -mparallel-innerloop                     : disable
        -mparallel-omp-routine                   : enable
        -mparallel-outerloop-strip-mine          : disable
        -mparallel-sections                      : disable
        -mparallel-threshold                     : 2000
        -mschedule-dynamic                       : disable
        -mschedule-runtime                       : disable
        -mschedule-static                        : disable
        -mschedule-chunk-size                    : 0
        -pthread                                 : disable

      Inlining Options : 
        -finline                                 : enable
        -finline-copy-arguments                  : enable
        -finline-functions                       : disable
        -finline-max-depth                       : 2
        -finline-max-function-size               : 50
        -finline-max-times                       : 6

      Code Generation Options : 
        -finstrument-functions                   : disable
        -fpic | -fPIC                            : disable
        -ftrace                                  : enable
        -minit-stack                             : not specified
        -p                                       : enable

      Debugging Options : 
        -g                                       : disable
        -traceback                               : disable

      Language Options : 
        -fallow-keyword-macros                   : enable
        -fgnu89-inline                           : disable
        -frestrict                               : enable
        -fsigned-char                            : enable
        -std                                     : gnu11

      Message Options : 
        -Wall                                    : enable
        -Wcomment                                : enable
        -Werror                                  : disable
        -Wno-div-by-zero                         : disable
        -Wunknown-pragma                         : enable
        -Wunused                                 : disable
        -Wunused-but-set-parameter               : disable
        -Wunused-but-set-variable                : disable
        -Wunused-parameter                       : disable
        -Wunused-value                           : disable
        -Wunused-variable                        : enable
        -fdiag-inline                            : 1
        -fdiag-parallel                          : 1
        -fdiag-vector                            : 3
        -fdiag-system-header                     : disable
        -pedantic                                : disable
        -pedantic-errors                         : disable
        -w                                       : disable

      List Output Options : 
        -report-file                             : not specified
        -report-append-mode                      : disable
        -report-all                              : enable
        -report-diagnostics                      : enable
        -report-format                           : enable
        -report-option                           : enable

      Miscellaneous Options : 
        -v                                       : disable


NEC C/C++ Compiler (3.0.8) for Vector Engine     Thu Sep 10 19:46:13 2020
FILE NAME: test.c

FUNCTION NAME: doit
DIAGNOSTIC LIST

 LINE              DIAGNOSTIC MESSAGE

    13: vec( 101): Vectorized loop.
    13: err( 510): The number of VCOMPRESS, VEXPAND.:  0,  0.
    13: err( 504): The number of VLOAD, VSTORE.:  2,  1.
    13: err( 505): The number of VGT,   VSC.   :  0,  0.
    26: vec( 101): Vectorized loop.
    26: err( 510): The number of VCOMPRESS, VEXPAND.:  0,  0.
    26: err( 504): The number of VLOAD, VSTORE.:  2,  1.
    26: err( 505): The number of VGT,   VSC.   :  0,  0.
    39: vec( 101): Vectorized loop.
    39: err( 510): The number of VCOMPRESS, VEXPAND.:  0,  0.
    39: err( 504): The number of VLOAD, VSTORE.:  2,  1.
    39: err( 505): The number of VGT,   VSC.   :  0,  0.
    41: vec( 128): Fused multiply-add operation applied.
    51: vec( 101): Vectorized loop.
    51: err( 510): The number of VCOMPRESS, VEXPAND.:  0,  0.
    51: err( 504): The number of VLOAD, VSTORE.:  2,  1.
    51: err( 505): The number of VGT,   VSC.   :  0,  0.
    63: vec( 101): Vectorized loop.
    63: err( 510): The number of VCOMPRESS, VEXPAND.:  0,  0.
    63: err( 504): The number of VLOAD, VSTORE.:  2,  1.
    63: err( 505): The number of VGT,   VSC.   :  0,  0.
    74: vec( 101): Vectorized loop.
    74: err( 510): The number of VCOMPRESS, VEXPAND.:  0,  0.
    74: err( 504): The number of VLOAD, VSTORE.:  2,  1.
    74: err( 505): The number of VGT,   VSC.   :  0,  0.
    86: vec( 101): Vectorized loop.
    86: err( 510): The number of VCOMPRESS, VEXPAND.:  0,  0.
    86: err( 504): The number of VLOAD, VSTORE.:  2,  1.
    86: err( 505): The number of VGT,   VSC.   :  0,  0.
    95: vec( 101): Vectorized loop.
    95: err( 510): The number of VCOMPRESS, VEXPAND.:  0,  0.
    95: err( 504): The number of VLOAD, VSTORE.:  2,  1.
    95: err( 505): The number of VGT,   VSC.   :  0,  0.
   104: vec( 101): Vectorized loop.
   104: err( 510): The number of VCOMPRESS, VEXPAND.:  0,  0.
   104: err( 504): The number of VLOAD, VSTORE.:  2,  1.
   104: err( 505): The number of VGT,   VSC.   :  0,  0.
   113: vec( 101): Vectorized loop.
   113: err( 510): The number of VCOMPRESS, VEXPAND.:  0,  0.
   113: err( 504): The number of VLOAD, VSTORE.:  2,  1.
   113: err( 505): The number of VGT,   VSC.   :  0,  0.
   122: vec( 101): Vectorized loop.
   122: err( 510): The number of VCOMPRESS, VEXPAND.:  0,  0.
   122: err( 504): The number of VLOAD, VSTORE.:  2,  1.
   122: err( 505): The number of VGT,   VSC.   :  0,  0.
   131: vec( 101): Vectorized loop.
   131: err( 510): The number of VCOMPRESS, VEXPAND.:  0,  0.
   131: err( 504): The number of VLOAD, VSTORE.:  2,  1.
   131: err( 505): The number of VGT,   VSC.   :  0,  0.


NEC C/C++ Compiler (3.0.8) for Vector Engine     Thu Sep 10 19:46:13 2020
FILE NAME: test.c

FUNCTION NAME: doit
FORMAT LIST

 LINE   LOOP      STATEMENT

     5:           void doit(int m, int n, double* A, double* B) {
     6:           
     7:           
     8:           
     9:           // Addition
    10:             ftrace_region_begin("ADD");
    11:             #pragma unroll_completely
    12: +------>    for (int i=0; i<m; i++) {
    13: |V----->       for (int j=0;j<n; j++) {
    14: ||                int idx = i*m + j;
    15: ||                B[idx] += A[idx];
    16: |V-----        }
    17: +------     }
    18:             ftrace_region_end("ADD");
    19:           
    20:           
    21:           
    22:           
    23:           //Multipliccation
    24:             ftrace_region_begin("MUL");
    25: +------>    for (int i=0; i<m; i++) {
    26: |V----->       for (int j=0;j<n; j++) {
    27: ||                int idx = i*m + j;
    28: ||                B[idx] *= A[idx];
    29: |V-----        }
    30: +------     }
    31:             ftrace_region_end("MUL");
    32:           
    33:           
    34:           
    35:           
    36:           //	FMA
    37:             ftrace_region_begin("FMA");
    38: +------>    for (int i=0; i<m; i++) {
    39: |V----->       for (int j=0;j<n; j++) {
    40: ||                int idx = i*m + j;
    41: ||      F         B[idx] += A[idx]*A[idx];
    42: |V-----        }
    43: +------     }
    44:             ftrace_region_end("FMA");
    45:           
    46:           
    47:           
    48:           //DIV
    49:             ftrace_region_begin("DIV");
    50: +------>    for (int i=0; i<m; i++) {
    51: |V----->       for (int j=0;j<n; j++) {
    52: ||                int idx = i*m + j;
    53: ||                B[idx] /= A[idx];
    54: |V-----        }
    55: +------     }
    56:             ftrace_region_end("DIV");
    57:           
    58:           
    59:           
    60:           //SQRT
    61:             ftrace_region_begin("SQRT");
    62: +------>    for (int i=0; i<m; i++) {
    63: |V----->       for (int j=0;j<n; j++) {
    64: ||                int idx = i*m + j;
    65: ||                B[idx] += sqrt(A[idx]);
    66: |V-----        }
    67: +------     }
    68:             ftrace_region_end("SQRT");
    69:           
    70:           
    71:           //EXP
    72:             ftrace_region_begin("EXP");
    73: +------>    for (int i=0; i<m; i++) {
    74: |V----->       for (int j=0;j<n; j++) {
    75: ||                int idx = i*m + j;
    76: ||                B[idx] += exp(A[idx]);
    77: |V-----        }
    78: +------     }
    79:             ftrace_region_end("EXP");
    80:           
    81:           
    82:           
    83:           //LOG
    84:             ftrace_region_begin("LOG");
    85: +------>    for (int i=0; i<m; i++) {
    86: |V----->       for (int j=0;j<n; j++) {
    87: ||                int idx = i*m + j;
    88: ||                B[idx] += log(A[idx]);
    89: |V-----        }
    90: +------     }
    91:             ftrace_region_end("LOG");
    92:           
    93:             ftrace_region_begin("EXP-LOG");
    94: +------>    for (int i=0; i<m; i++) {
    95: |V----->       for (int j=0;j<n; j++) {
    96: ||                int idx = i*m + j;
    97: ||                B[idx] += exp(1.17*log(A[idx]));
    98: |V-----        }
    99: +------     }
   100:             ftrace_region_end("EXP-LOG");
   101:           
   102:             ftrace_region_begin("POW");
   103: +------>    for (int i=0; i<m; i++) {
   104: |V----->       for (int j=0;j<n; j++) {
   105: ||                int idx = i*m + j;
   106: ||                B[idx] += pow(A[idx],0.17);
   107: |V-----        }
   108: +------     }
   109:             ftrace_region_end("POW");
   110:           
   111:             ftrace_region_begin("SIN");
   112: +------>    for (int i=0; i<m; i++) {
   113: |V----->       for (int j=0;j<n; j++) {
   114: ||                int idx = i*m + j;
   115: ||                B[idx] += sin(A[idx]);
   116: |V-----        }
   117: +------     }
   118:             ftrace_region_end("SIN");
   119:           
   120:             ftrace_region_begin("COS");
   121: +------>    for (int i=0; i<m; i++) {
   122: |V----->       for (int j=0;j<n; j++) {
   123: ||                int idx = i*m + j;
   124: ||                B[idx] += cos(A[idx]);
   125: |V-----        }
   126: +------     }
   127:             ftrace_region_end("COS");
   128:           
   129:             ftrace_region_begin("TAN");
   130: +------>    for (int i=0; i<m; i++) {
   131: |V----->       for (int j=0;j<n; j++) {
   132: ||                int idx = i*m + j;
   133: ||                B[idx] += tan(A[idx]);
   134: |V-----        }
   135: +------     }
   136:             ftrace_region_end("TAN");;
   137:           }


NEC C/C++ Compiler (3.0.8) for Vector Engine     Thu Sep 10 19:46:13 2020
FILE NAME: test.c

FUNCTION NAME: main
DIAGNOSTIC LIST

 LINE              DIAGNOSTIC MESSAGE

   144: vec( 101): Vectorized loop.
   144: err( 510): The number of VCOMPRESS, VEXPAND.:  0,  0.
   144: err( 504): The number of VLOAD, VSTORE.:  0,  2.
   144: err( 505): The number of VGT,   VSC.   :  0,  0.
   145: opt(1112): Loop fused with previous loop.: i
   147: vec( 103): Unvectorized loop.
   147: vec( 110): Vectorization obstructive function reference.: doit
   148: opt(1025): Reference to this function inhibits optimization.: doit


NEC C/C++ Compiler (3.0.8) for Vector Engine     Thu Sep 10 19:46:13 2020
FILE NAME: test.c

FUNCTION NAME: main
FORMAT LIST

 LINE   LOOP      STATEMENT

   139:           int main() {
   140:           
   141:             const int m = 1000, n = 1000, iter = 1000;
   142:             double A[m*n], B[m*n];
   143:           
   144: |      >    for (int i=0; i<m*n; i++) B[i] = 0.0;
   145: V======>    for (int i=0; i<m*n; i++) A[i] = 1.1;
   146:           
   147: +------>    for (int i=0; i<iter; i++) {
   148: |             doit(m, n, A, B);
   149: +------     }
   150:           
   151:             printf("Done!\n");
   152:           
   153:           }


