NEC C/C++ Compiler (3.0.8) for Vector Engine     Thu Oct 22 15:13:54 2020
FILE NAME : vec3.c

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
FILE NAME: vec3.c

FUNCTION NAME: do_loop
DIAGNOSTIC LIST

 LINE              DIAGNOSTIC MESSAGE

    23: vec( 101): Vectorized loop.
    23: err( 510): The number of VCOMPRESS, VEXPAND.:  0,  0.
    23: err( 504): The number of VLOAD, VSTORE.:  1,  1.
    23: err( 505): The number of VGT,   VSC.   :  0,  0.
    31: vec( 101): Vectorized loop.
    31: err( 510): The number of VCOMPRESS, VEXPAND.:  0,  0.
    31: err( 504): The number of VLOAD, VSTORE.:  1,  1.
    31: err( 505): The number of VGT,   VSC.   :  0,  0.
    39: vec( 101): Vectorized loop.
    39: err( 510): The number of VCOMPRESS, VEXPAND.:  0,  0.
    39: err( 504): The number of VLOAD, VSTORE.:  0,  1.
    39: err( 505): The number of VGT,   VSC.   :  0,  0.
    47: vec( 101): Vectorized loop.
    47: err( 510): The number of VCOMPRESS, VEXPAND.:  0,  0.
    47: err( 504): The number of VLOAD, VSTORE.:  0,  1.
    47: err( 505): The number of VGT,   VSC.   :  0,  0.
    55: vec( 101): Vectorized loop.
    55: err( 510): The number of VCOMPRESS, VEXPAND.:  0,  0.
    55: err( 504): The number of VLOAD, VSTORE.:  0,  1.
    55: err( 505): The number of VGT,   VSC.   :  0,  0.
    63: vec( 101): Vectorized loop.
    63: err( 510): The number of VCOMPRESS, VEXPAND.:  0,  0.
    63: err( 504): The number of VLOAD, VSTORE.:  0,  1.
    63: err( 505): The number of VGT,   VSC.   :  0,  0.
    71: vec( 101): Vectorized loop.
    71: err( 510): The number of VCOMPRESS, VEXPAND.:  0,  0.
    71: err( 504): The number of VLOAD, VSTORE.:  0,  1.
    71: err( 505): The number of VGT,   VSC.   :  0,  0.
    80: opt(1589): Outer loop moved inside inner loop(s).: i
    80: vec( 101): Vectorized loop.
    80: err( 510): The number of VCOMPRESS, VEXPAND.:  0,  0.
    80: err( 504): The number of VLOAD, VSTORE.:  3,  2.
    80: err( 505): The number of VGT,   VSC.   :  0,  0.
    82: vec( 128): Fused multiply-add operation applied.
    84: vec( 101): Vectorized loop.
    84: err( 510): The number of VCOMPRESS, VEXPAND.:  0,  0.
    84: err( 504): The number of VLOAD, VSTORE.:  2,  1.
    84: err( 505): The number of VGT,   VSC.   :  0,  0.
    91: vec( 103): Unvectorized loop.
    91: vec( 110): Vectorization obstructive function reference.: printf
    91: vec( 110): Vectorization obstructive function reference.: exit
   101: vec( 101): Vectorized loop.
   101: err( 510): The number of VCOMPRESS, VEXPAND.:  0,  0.
   101: err( 504): The number of VLOAD, VSTORE.:  3,  1.
   101: err( 505): The number of VGT,   VSC.   :  0,  0.
   103: vec( 128): Fused multiply-add operation applied.


NEC C/C++ Compiler (3.0.8) for Vector Engine     Thu Oct 22 15:13:54 2020
FILE NAME: vec3.c

FUNCTION NAME: do_loop
FORMAT LIST

 LINE   LOOP      STATEMENT

    11:           void do_loop(double* A, double* B, double* C, double* D, double* L,
    12:                        int today) {
    13:             // promote the scalar variable tmp and tmp_old to the same size as A and B
    14:             double tmp[m*n], tmp_old[m*n];
    15:             double const max_tmp = 1000000.0;
    16:             int idx;
    17:           
    18:             // split the loop to isolate the different computations
    19:             // push the loops in each case block
    20:             switch (today) {
    21:               case (MONDAY):
    22: +------>        for (int j=0; j<n; j++) {
    23: |V----->          for (int i=0; i<m; i++) {
    24: ||                  idx = j*m+i;
    25: ||                  tmp[idx] = B[idx]+2;
    26: |V-----           }
    27: +------         }
    28:                 break;
    29:               case (TUESDAY):
    30: +------>        for (int j=0; j<n; j++) {
    31: |V----->          for (int i=0; i<m; i++) {
    32: ||                  idx = j*m+i;
    33: ||                  tmp[idx] = B[idx]-2;
    34: |V-----           }
    35: +------         }
    36:                 break;
    37:               case (WEDNESDAY):
    38: +------>        for (int j=0; j<n; j++) {
    39: |V----->          for (int i=0; i<m; i++) {
    40: ||                  idx = j*m+i;
    41: ||                  tmp[idx] = ((double)(i+1))/((double)(j+1));
    42: |V-----           }
    43: +------         }
    44:                 break;
    45:               case (THURSDAY):
    46: +------>        for (int j=0; j<n; j++) {
    47: |V----->          for (int i=0; i<m; i++) {
    48: ||                  idx = j*m+i;
    49: ||                  tmp[idx] = (i+1)/(j+1)+1;
    50: |V-----           }
    51: +------         }
    52:                 break;
    53:               case (FRIDAY):
    54: +------>        for (int j=0; j<n; j++) {
    55: |V----->          for (int i=0; i<m; i++) {
    56: ||                  idx = j*m+i;
    57: ||                  tmp[idx] = ((double)(i+1))*((double)(j+1));
    58: |V-----           }
    59: +------         }
    60:                 break;
    61:               case (SATURDAY):
    62: +------>        for (int j=0; j<n; j++) {
    63: |V----->          for (int i=0; i<m; i++) {
    64: ||                  idx = j*m+i;
    65: ||                  tmp[idx] = 0.5*(double)((i+1)/(j+1));
    66: |V-----           }
    67: +------         }
    68:                 break;
    69:               case (SUNDAY):
    70: +------>        for (int j=0; j<n; j++) {
    71: |V----->          for (int i=0; i<m; i++) {
    72: ||                  idx = j*m+i;
    73: ||                  tmp[idx] = (i+1)/((double)(j+1+2));
    74: |V-----           }
    75: +------         }
    76:                 break;
    77:             }
    78:           
    79: +------>    for (int j=0; j<n; j++) {
    80: |X----->      for (int i=0; i<m; i++) {
    81: ||              idx = j*m+i;
    82: ||      F       A[idx] += sqrt(fabs(tmp[idx])+1) * exp(B[idx]);
    83: ||              tmp_old[idx] = tmp[idx];
    84: ||V---->        for (int k=0; k<o; k++) {
    85: |||               tmp[idx] += exp(B[idx] * L[k]);
    86: ||V----         }
    87: |X-----       }
    88: +------     }
    89:           
    90: +------>    for (int j=0; j<n; j++) {
    91: |+----->      for (int i=0; i<m; i++) {
    92: ||              idx = j*m+i;
    93: ||              if (tmp[idx] > max_tmp) {
    94: ||                printf("TMP greater MAX_TMP -> STOP\n");
    95: ||                exit(0);
    96: ||              }
    97: |+-----       }
    98: +------     }
    99:           
   100: +------>    for (int j=0; j<n; j++) {
   101: |V----->      for (int i=0; i<m; i++) {
   102: ||              idx = j*m+i;
   103: ||      F       A[idx] += tmp[idx] / sqrt(fabs(tmp_old[idx])+1);
   104: |V-----       }
   105: +------     }
   106:           
   107:             //create a new version of add_term and push in the loops
   108:             add_term_vec(A, C, D, L);
   109:           }


NEC C/C++ Compiler (3.0.8) for Vector Engine     Thu Oct 22 15:13:54 2020
FILE NAME: vec3.c

FUNCTION NAME: add_term_vec
DIAGNOSTIC LIST

 LINE              DIAGNOSTIC MESSAGE

   113: vec( 103): Unvectorized loop.
   113: vec( 110): Vectorization obstructive function reference.: exit
   113: vec( 110): Vectorization obstructive function reference.: printf
   113: vec( 110): Vectorization obstructive function reference.: add_D
   113: vec( 110): Vectorization obstructive function reference.: add_C
   116: opt(1025): Reference to this function inhibits optimization.: add_C


NEC C/C++ Compiler (3.0.8) for Vector Engine     Thu Oct 22 15:13:54 2020
FILE NAME: vec3.c

FUNCTION NAME: add_term_vec
FORMAT LIST

 LINE   LOOP      STATEMENT

   111:           void add_term_vec(double* A, double* C, double* D, double* L) {
   112: +------>    for (int j=0; j<n; j++) {
   113: |+----->      for (int i=0; i<m; i++) {
   114: ||              int idx = j*m+i;
   115: ||              if (j >= 90) {
   116: ||                add_C(A+idx, C[i]);
   117: ||              } else if (j >= 0) {
   118: ||                add_D(A+idx, D[i], L);
   119: ||              } else {
   120: ||                printf("A = 0.0 -> STOP\n");
   121: ||                exit(0);
   122: ||              }
   123: |+-----       }
   124: +------     }
   125:           }


NEC C/C++ Compiler (3.0.8) for Vector Engine     Thu Oct 22 15:13:54 2020
FILE NAME: vec3.c

FUNCTION NAME: add_term
DIAGNOSTIC LIST

 LINE              DIAGNOSTIC MESSAGE

  No diagnostic message.


NEC C/C++ Compiler (3.0.8) for Vector Engine     Thu Oct 22 15:13:54 2020
FILE NAME: vec3.c

FUNCTION NAME: add_term
FORMAT LIST

 LINE   LOOP      STATEMENT

   126:           void add_term(int j, double* A, double C, double D, double* L) {
   127:           
   128:             if (j >= 90) {
   129:               add_C(A, C);
   130:             } else if (j >= 0) {
   131:               add_D(A, D, L);
   132:             } else {
   133:               printf("A = 0.0 -> STOP\n");
   134:               exit(0);
   135:             }
   136:           
   137:           }


NEC C/C++ Compiler (3.0.8) for Vector Engine     Thu Oct 22 15:13:54 2020
FILE NAME: vec3.c

FUNCTION NAME: add_C
DIAGNOSTIC LIST

 LINE              DIAGNOSTIC MESSAGE

  No diagnostic message.


NEC C/C++ Compiler (3.0.8) for Vector Engine     Thu Oct 22 15:13:54 2020
FILE NAME: vec3.c

FUNCTION NAME: add_C
FORMAT LIST

 LINE   LOOP      STATEMENT

   139:           void add_C(double* A, double C) {
   140:             *A += sqrt(C);
   141:           }


NEC C/C++ Compiler (3.0.8) for Vector Engine     Thu Oct 22 15:13:54 2020
FILE NAME: vec3.c

FUNCTION NAME: add_D
DIAGNOSTIC LIST

 LINE              DIAGNOSTIC MESSAGE

   145: vec( 101): Vectorized loop.
   145: err( 510): The number of VCOMPRESS, VEXPAND.:  0,  0.
   145: err( 504): The number of VLOAD, VSTORE.:  1,  0.
   145: err( 505): The number of VGT,   VSC.   :  0,  0.
   146: vec( 126): Idiom detected.: Sum


NEC C/C++ Compiler (3.0.8) for Vector Engine     Thu Oct 22 15:13:54 2020
FILE NAME: vec3.c

FUNCTION NAME: add_D
FORMAT LIST

 LINE   LOOP      STATEMENT

   143:           void add_D(double* A, double D, double* L) {
   144:            
   145: V------>    for (int k=0; k<o; k++) {
   146: |             *A += sqrt(D * L[k]);
   147: V------     }
   148:           
   149:           }


