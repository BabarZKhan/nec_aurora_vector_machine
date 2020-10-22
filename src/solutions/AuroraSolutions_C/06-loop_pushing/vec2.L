NEC C/C++ Compiler (3.0.8) for Vector Engine     Thu Oct 22 15:13:54 2020
FILE NAME : vec2.c

  COMPILER OPTIONS : -O3 -Wobsolescent -Wextension -Wall -std=gnu11 -ftrace -report-all -fdiag-vector=3 -fno-outerloop-unroll -c

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
        -fouterloop-unroll                       : disable
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
        -p                                       : disable

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


NEC C/C++ Compiler (3.0.8) for Vector Engine     Thu Oct 22 15:13:54 2020
FILE NAME: vec2.c

FUNCTION NAME: do_loop
DIAGNOSTIC LIST

 LINE              DIAGNOSTIC MESSAGE

    22: vec( 101): Vectorized loop.
    22: err( 510): The number of VCOMPRESS, VEXPAND.:  0,  0.
    22: err( 504): The number of VLOAD, VSTORE.:  1,  1.
    22: err( 505): The number of VGT,   VSC.   :  0,  0.
    30: vec( 101): Vectorized loop.
    30: err( 510): The number of VCOMPRESS, VEXPAND.:  0,  0.
    30: err( 504): The number of VLOAD, VSTORE.:  1,  1.
    30: err( 505): The number of VGT,   VSC.   :  0,  0.
    38: vec( 101): Vectorized loop.
    38: err( 510): The number of VCOMPRESS, VEXPAND.:  0,  0.
    38: err( 504): The number of VLOAD, VSTORE.:  0,  1.
    38: err( 505): The number of VGT,   VSC.   :  0,  0.
    46: vec( 101): Vectorized loop.
    46: err( 510): The number of VCOMPRESS, VEXPAND.:  0,  0.
    46: err( 504): The number of VLOAD, VSTORE.:  0,  1.
    46: err( 505): The number of VGT,   VSC.   :  0,  0.
    54: vec( 101): Vectorized loop.
    54: err( 510): The number of VCOMPRESS, VEXPAND.:  0,  0.
    54: err( 504): The number of VLOAD, VSTORE.:  0,  1.
    54: err( 505): The number of VGT,   VSC.   :  0,  0.
    62: vec( 101): Vectorized loop.
    62: err( 510): The number of VCOMPRESS, VEXPAND.:  0,  0.
    62: err( 504): The number of VLOAD, VSTORE.:  0,  1.
    62: err( 505): The number of VGT,   VSC.   :  0,  0.
    70: vec( 101): Vectorized loop.
    70: err( 510): The number of VCOMPRESS, VEXPAND.:  0,  0.
    70: err( 504): The number of VLOAD, VSTORE.:  0,  1.
    70: err( 505): The number of VGT,   VSC.   :  0,  0.
    79: opt(1589): Outer loop moved inside inner loop(s).: i
    79: vec( 101): Vectorized loop.
    79: err( 510): The number of VCOMPRESS, VEXPAND.:  0,  0.
    79: err( 504): The number of VLOAD, VSTORE.:  3,  2.
    79: err( 505): The number of VGT,   VSC.   :  0,  0.
    81: vec( 128): Fused multiply-add operation applied.
    83: vec( 101): Vectorized loop.
    83: err( 510): The number of VCOMPRESS, VEXPAND.:  0,  0.
    83: err( 504): The number of VLOAD, VSTORE.:  2,  1.
    83: err( 505): The number of VGT,   VSC.   :  0,  0.
    90: vec( 103): Unvectorized loop.
    90: vec( 110): Vectorization obstructive function reference.: printf
    90: vec( 110): Vectorization obstructive function reference.: exit
   100: vec( 101): Vectorized loop.
   100: err( 510): The number of VCOMPRESS, VEXPAND.:  0,  0.
   100: err( 504): The number of VLOAD, VSTORE.:  3,  1.
   100: err( 505): The number of VGT,   VSC.   :  0,  0.
   102: vec( 128): Fused multiply-add operation applied.
   107: vec( 103): Unvectorized loop.
   107: vec( 110): Vectorization obstructive function reference.: add_term
   109: opt(1025): Reference to this function inhibits optimization.: add_term


NEC C/C++ Compiler (3.0.8) for Vector Engine     Thu Oct 22 15:13:54 2020
FILE NAME: vec2.c

FUNCTION NAME: do_loop
FORMAT LIST

 LINE   LOOP      STATEMENT

    10:           void do_loop(double* A, double* B, double* C, double* D, double* L,
    11:                        int today) {
    12:             // promote the scalar variable tmp and tmp_old to the same size as A and B
    13:             double tmp[m*n], tmp_old[m*n];
    14:             double const max_tmp = 1000000.0;
    15:             int idx;
    16:           
    17:             // split the loop to isolate the different computations
    18:             // push the loops in each case block
    19:             switch (today) {
    20:               case (MONDAY):
    21: +------>        for (int j=0; j<n; j++) {
    22: |V----->          for (int i=0; i<m; i++) {
    23: ||                  idx = j*m+i;
    24: ||                  tmp[idx] = B[idx]+2;
    25: |V-----           }
    26: +------         }
    27:                 break;
    28:               case (TUESDAY):
    29: +------>        for (int j=0; j<n; j++) {
    30: |V----->          for (int i=0; i<m; i++) {
    31: ||                  idx = j*m+i;
    32: ||                  tmp[idx] = B[idx]-2;
    33: |V-----           }
    34: +------         }
    35:                 break;
    36:               case (WEDNESDAY):
    37: +------>        for (int j=0; j<n; j++) {
    38: |V----->          for (int i=0; i<m; i++) {
    39: ||                  idx = j*m+i;
    40: ||                  tmp[idx] = ((double)(i+1))/((double)(j+1));
    41: |V-----           }
    42: +------         }
    43:                 break;
    44:               case (THURSDAY):
    45: +------>        for (int j=0; j<n; j++) {
    46: |V----->          for (int i=0; i<m; i++) {
    47: ||                  idx = j*m+i;
    48: ||                  tmp[idx] = (i+1)/(j+1)+1;
    49: |V-----           }
    50: +------         }
    51:                 break;
    52:               case (FRIDAY):
    53: +------>        for (int j=0; j<n; j++) {
    54: |V----->          for (int i=0; i<m; i++) {
    55: ||                  idx = j*m+i;
    56: ||                  tmp[idx] = ((double)(i+1))*((double)(j+1));
    57: |V-----           }
    58: +------         }
    59:                 break;
    60:               case (SATURDAY):
    61: +------>        for (int j=0; j<n; j++) {
    62: |V----->          for (int i=0; i<m; i++) {
    63: ||                  idx = j*m+i;
    64: ||                  tmp[idx] = 0.5*(double)((i+1)/(j+1));
    65: |V-----           }
    66: +------         }
    67:                 break;
    68:               case (SUNDAY):
    69: +------>        for (int j=0; j<n; j++) {
    70: |V----->          for (int i=0; i<m; i++) {
    71: ||                  idx = j*m+i;
    72: ||                  tmp[idx] = (i+1)/((double)(j+1+2));
    73: |V-----           }
    74: +------         }
    75:                 break;
    76:             }
    77:           
    78: +------>    for (int j=0; j<n; j++) {
    79: |X----->      for (int i=0; i<m; i++) {
    80: ||              idx = j*m+i;
    81: ||      F       A[idx] += sqrt(fabs(tmp[idx])+1) * exp(B[idx]);
    82: ||              tmp_old[idx] = tmp[idx];
    83: ||V---->        for (int k=0; k<o; k++) {
    84: |||               tmp[idx] += exp(B[idx] * L[k]);
    85: ||V----         }
    86: |X-----       }
    87: +------     }
    88:           
    89: +------>    for (int j=0; j<n; j++) {
    90: |+----->      for (int i=0; i<m; i++) {
    91: ||              idx = j*m+i;
    92: ||              if (tmp[idx] > max_tmp) {
    93: ||                printf("TMP greater MAX_TMP -> STOP\n");
    94: ||                exit(0);
    95: ||              }
    96: |+-----       }
    97: +------     }
    98:           
    99: +------>    for (int j=0; j<n; j++) {
   100: |V----->      for (int i=0; i<m; i++) {
   101: ||              idx = j*m+i;
   102: ||      F       A[idx] += tmp[idx] / sqrt(fabs(tmp_old[idx])+1);
   103: |V-----       }
   104: +------     }
   105:           
   106: +------>    for (int j=0; j<n; j++) {
   107: |+----->      for (int i=0; i<m; i++) {
   108: ||              idx = j*m+i;
   109: ||              add_term(j, A+idx, C[i], D[i], L);
   110: ||        
   111: |+-----       }
   112: +------     }
   113:           
   114:           }


NEC C/C++ Compiler (3.0.8) for Vector Engine     Thu Oct 22 15:13:54 2020
FILE NAME: vec2.c

FUNCTION NAME: add_term
DIAGNOSTIC LIST

 LINE              DIAGNOSTIC MESSAGE

  No diagnostic message.


NEC C/C++ Compiler (3.0.8) for Vector Engine     Thu Oct 22 15:13:54 2020
FILE NAME: vec2.c

FUNCTION NAME: add_term
FORMAT LIST

 LINE   LOOP      STATEMENT

   116:           void add_term(int j, double* A, double C, double D, double* L) {
   117:           
   118:             if (j >= 90) {
   119:               add_C(A, C);
   120:             } else if (j >= 0) {
   121:               add_D(A, D, L);
   122:             } else {
   123:               printf("A = 0.0 -> STOP\n");
   124:               exit(0);
   125:             }
   126:           
   127:           }


NEC C/C++ Compiler (3.0.8) for Vector Engine     Thu Oct 22 15:13:54 2020
FILE NAME: vec2.c

FUNCTION NAME: add_C
DIAGNOSTIC LIST

 LINE              DIAGNOSTIC MESSAGE

  No diagnostic message.


NEC C/C++ Compiler (3.0.8) for Vector Engine     Thu Oct 22 15:13:54 2020
FILE NAME: vec2.c

FUNCTION NAME: add_C
FORMAT LIST

 LINE   LOOP      STATEMENT

   129:           void add_C(double* A, double C) {
   130:             *A += sqrt(C);
   131:           }


NEC C/C++ Compiler (3.0.8) for Vector Engine     Thu Oct 22 15:13:54 2020
FILE NAME: vec2.c

FUNCTION NAME: add_D
DIAGNOSTIC LIST

 LINE              DIAGNOSTIC MESSAGE

   135: vec( 101): Vectorized loop.
   135: err( 510): The number of VCOMPRESS, VEXPAND.:  0,  0.
   135: err( 504): The number of VLOAD, VSTORE.:  1,  0.
   135: err( 505): The number of VGT,   VSC.   :  0,  0.
   136: vec( 126): Idiom detected.: Sum


NEC C/C++ Compiler (3.0.8) for Vector Engine     Thu Oct 22 15:13:54 2020
FILE NAME: vec2.c

FUNCTION NAME: add_D
FORMAT LIST

 LINE   LOOP      STATEMENT

   133:           void add_D(double* A, double D, double* L) {
   134:            
   135: V------>    for (int k=0; k<o; k++) {
   136: |             *A += sqrt(D * L[k]);
   137: V------     }
   138:           
   139:           }


