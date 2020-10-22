NEC C/C++ Compiler (3.0.8) for Vector Engine     Thu Oct 22 15:13:55 2020
FILE NAME : vec5.c

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


NEC C/C++ Compiler (3.0.8) for Vector Engine     Thu Oct 22 15:13:55 2020
FILE NAME: vec5.c

FUNCTION NAME: do_loop
DIAGNOSTIC LIST

 LINE              DIAGNOSTIC MESSAGE

    25: vec( 101): Vectorized loop.
    25: err( 510): The number of VCOMPRESS, VEXPAND.:  0,  0.
    25: err( 504): The number of VLOAD, VSTORE.:  1,  1.
    25: err( 505): The number of VGT,   VSC.   :  0,  0.
    33: vec( 101): Vectorized loop.
    33: err( 510): The number of VCOMPRESS, VEXPAND.:  0,  0.
    33: err( 504): The number of VLOAD, VSTORE.:  1,  1.
    33: err( 505): The number of VGT,   VSC.   :  0,  0.
    41: vec( 101): Vectorized loop.
    41: err( 510): The number of VCOMPRESS, VEXPAND.:  0,  0.
    41: err( 504): The number of VLOAD, VSTORE.:  0,  1.
    41: err( 505): The number of VGT,   VSC.   :  0,  0.
    49: vec( 101): Vectorized loop.
    49: err( 510): The number of VCOMPRESS, VEXPAND.:  0,  0.
    49: err( 504): The number of VLOAD, VSTORE.:  0,  1.
    49: err( 505): The number of VGT,   VSC.   :  0,  0.
    57: vec( 101): Vectorized loop.
    57: err( 510): The number of VCOMPRESS, VEXPAND.:  0,  0.
    57: err( 504): The number of VLOAD, VSTORE.:  0,  1.
    57: err( 505): The number of VGT,   VSC.   :  0,  0.
    65: vec( 101): Vectorized loop.
    65: err( 510): The number of VCOMPRESS, VEXPAND.:  0,  0.
    65: err( 504): The number of VLOAD, VSTORE.:  0,  1.
    65: err( 505): The number of VGT,   VSC.   :  0,  0.
    73: vec( 101): Vectorized loop.
    73: err( 510): The number of VCOMPRESS, VEXPAND.:  0,  0.
    73: err( 504): The number of VLOAD, VSTORE.:  0,  1.
    73: err( 505): The number of VGT,   VSC.   :  0,  0.
    82: opt(1589): Outer loop moved inside inner loop(s).: i
    82: vec( 101): Vectorized loop.
    82: err( 510): The number of VCOMPRESS, VEXPAND.:  0,  0.
    82: err( 504): The number of VLOAD, VSTORE.:  3,  2.
    82: err( 505): The number of VGT,   VSC.   :  0,  0.
    84: vec( 128): Fused multiply-add operation applied.
    86: vec( 101): Vectorized loop.
    86: err( 510): The number of VCOMPRESS, VEXPAND.:  0,  0.
    86: err( 504): The number of VLOAD, VSTORE.:  2,  1.
    86: err( 505): The number of VGT,   VSC.   :  0,  0.
    93: vec( 103): Unvectorized loop.
    93: vec( 110): Vectorization obstructive function reference.: printf
    93: vec( 110): Vectorization obstructive function reference.: exit
   103: vec( 101): Vectorized loop.
   103: err( 510): The number of VCOMPRESS, VEXPAND.:  0,  0.
   103: err( 504): The number of VLOAD, VSTORE.:  3,  1.
   103: err( 505): The number of VGT,   VSC.   :  0,  0.
   105: vec( 128): Fused multiply-add operation applied.


NEC C/C++ Compiler (3.0.8) for Vector Engine     Thu Oct 22 15:13:55 2020
FILE NAME: vec5.c

FUNCTION NAME: do_loop
FORMAT LIST

 LINE   LOOP      STATEMENT

    13:           void do_loop(double* A, double* B, double* C, double* D, double* L,
    14:                        int today) {
    15:             // promote the scalar variable tmp and tmp_old to the same size as A and B
    16:             double tmp[m*n], tmp_old[m*n];
    17:             double const max_tmp = 1000000.0;
    18:             int idx;
    19:           
    20:             // split the loop to isolate the different computations
    21:             // push the loop in each case block
    22:             switch (today) {
    23:               case (MONDAY):
    24: +------>        for (int j=0; j<n; j++) {
    25: |V----->          for (int i=0; i<m; i++) {
    26: ||                  idx = j*m+i;
    27: ||                  tmp[idx] = B[idx]+2;
    28: |V-----           }
    29: +------         }
    30:                 break;
    31:               case (TUESDAY):
    32: +------>        for (int j=0; j<n; j++) {
    33: |V----->          for (int i=0; i<m; i++) {
    34: ||                  idx = j*m+i;
    35: ||                  tmp[idx] = B[idx]-2;
    36: |V-----           }
    37: +------         }
    38:                 break;
    39:               case (WEDNESDAY):
    40: +------>        for (int j=0; j<n; j++) {
    41: |V----->          for (int i=0; i<m; i++) {
    42: ||                  idx = j*m+i;
    43: ||                  tmp[idx] = ((double)(i+1))/((double)(j+1));
    44: |V-----           }
    45: +------         }
    46:                 break;
    47:               case (THURSDAY):
    48: +------>        for (int j=0; j<n; j++) {
    49: |V----->          for (int i=0; i<m; i++) {
    50: ||                  idx = j*m+i;
    51: ||                  tmp[idx] = (i+1)/(j+1)+1;
    52: |V-----           }
    53: +------         }
    54:                 break;
    55:               case (FRIDAY):
    56: +------>        for (int j=0; j<n; j++) {
    57: |V----->          for (int i=0; i<m; i++) {
    58: ||                  idx = j*m+i;
    59: ||                  tmp[idx] = ((double)(i+1))*((double)(j+1));
    60: |V-----           }
    61: +------         }
    62:                 break;
    63:               case (SATURDAY):
    64: +------>        for (int j=0; j<n; j++) {
    65: |V----->          for (int i=0; i<m; i++) {
    66: ||                  idx = j*m+i;
    67: ||                  tmp[idx] = 0.5*(double)((i+1)/(j+1));
    68: |V-----           }
    69: +------         }
    70:                 break;
    71:               case (SUNDAY):
    72: +------>        for (int j=0; j<n; j++) {
    73: |V----->          for (int i=0; i<m; i++) {
    74: ||                  idx = j*m+i;
    75: ||                  tmp[idx] = (i+1)/((double)(j+1+2));
    76: |V-----           }
    77: +------         }
    78:                 break;
    79:             }
    80:           
    81: +------>    for (int j=0; j<n; j++) {
    82: |X----->      for (int i=0; i<m; i++) {
    83: ||              idx = j*m+i;
    84: ||      F       A[idx] += sqrt(fabs(tmp[idx])+1) * exp(B[idx]);
    85: ||              tmp_old[idx] = tmp[idx];
    86: ||V---->        for (int k=0; k<o; k++) {
    87: |||               tmp[idx] += exp(B[idx] * L[k]);
    88: ||V----         }
    89: |X-----       }
    90: +------     }
    91:           
    92: +------>    for (int j=0; j<n; j++) {
    93: |+----->      for (int i=0; i<m; i++) {
    94: ||              idx = j*m+i;
    95: ||              if (tmp[idx] > max_tmp) {
    96: ||                printf("TMP greater MAX_TMP -> STOP\n");
    97: ||                exit(0);
    98: ||              }
    99: |+-----       }
   100: +------     }
   101:           
   102: +------>    for (int j=0; j<n; j++) {
   103: |V----->      for (int i=0; i<m; i++) {
   104: ||              idx = j*m+i;
   105: ||      F       A[idx] += tmp[idx] / sqrt(fabs(tmp_old[idx])+1);
   106: |V-----       }
   107: +------     }
   108:           
   109:             //create a new version of add_term and push in the loops
   110:             add_term_vec(A, C, D, L);
   111:           }


NEC C/C++ Compiler (3.0.8) for Vector Engine     Thu Oct 22 15:13:55 2020
FILE NAME: vec5.c

FUNCTION NAME: add_term_vec
DIAGNOSTIC LIST

 LINE              DIAGNOSTIC MESSAGE

  No diagnostic message.


NEC C/C++ Compiler (3.0.8) for Vector Engine     Thu Oct 22 15:13:55 2020
FILE NAME: vec5.c

FUNCTION NAME: add_term_vec
FORMAT LIST

 LINE   LOOP      STATEMENT

   113:           void add_term_vec(double* A, double* C, double* D, double* L) {
   114:           
   115:             // The loop parameters are known, therefore the if construct can be eliminated
   116:             // and replaced by explicit looping
   117:             // The stop can never happen with these loop parameters
   118:             add_D_vec(A, D, L);
   119:             add_C_vec(A, C);
   120:           }


NEC C/C++ Compiler (3.0.8) for Vector Engine     Thu Oct 22 15:13:55 2020
FILE NAME: vec5.c

FUNCTION NAME: add_term
DIAGNOSTIC LIST

 LINE              DIAGNOSTIC MESSAGE

  No diagnostic message.


NEC C/C++ Compiler (3.0.8) for Vector Engine     Thu Oct 22 15:13:55 2020
FILE NAME: vec5.c

FUNCTION NAME: add_term
FORMAT LIST

 LINE   LOOP      STATEMENT

   121:           void add_term(int j, double* A, double C, double D, double* L) {
   122:           
   123:             if (j >= 90) {
   124:               add_C(A, C);
   125:             } else if (j >= 0) {
   126:               add_D(A, D, L);
   127:             } else {
   128:               printf("A = 0.0 -> STOP\n");
   129:               exit(0);
   130:             }
   131:           
   132:           }


NEC C/C++ Compiler (3.0.8) for Vector Engine     Thu Oct 22 15:13:55 2020
FILE NAME: vec5.c

FUNCTION NAME: add_C_vec
DIAGNOSTIC LIST

 LINE              DIAGNOSTIC MESSAGE

   138: opt(1395): Inner loop stripped and strip loop moved outside outer loop.: i
   138: vec( 101): Vectorized loop.
   138: err( 510): The number of VCOMPRESS, VEXPAND.:  0,  0.
   138: err( 504): The number of VLOAD, VSTORE.:  2,  1.
   138: err( 505): The number of VGT,   VSC.   :  0,  0.


NEC C/C++ Compiler (3.0.8) for Vector Engine     Thu Oct 22 15:13:55 2020
FILE NAME: vec5.c

FUNCTION NAME: add_C_vec
FORMAT LIST

 LINE   LOOP      STATEMENT

   134:           void add_C_vec(double* A, double* C) {
   135:             // push in loops from outside and order such that inner loop is largest to be
   136:             // vectorized
   137: +------>    for (int j=90; j<n; j++) {
   138: |V----->      for (int i=0; i<m; i++) {
   139: ||              int idx = j*m+i;
   140: ||              A[idx] = A[idx] + sqrt(C[i]);
   141: |V-----       }
   142: +------     }
   143:           }


NEC C/C++ Compiler (3.0.8) for Vector Engine     Thu Oct 22 15:13:55 2020
FILE NAME: vec5.c

FUNCTION NAME: add_C
DIAGNOSTIC LIST

 LINE              DIAGNOSTIC MESSAGE

  No diagnostic message.


NEC C/C++ Compiler (3.0.8) for Vector Engine     Thu Oct 22 15:13:55 2020
FILE NAME: vec5.c

FUNCTION NAME: add_C
FORMAT LIST

 LINE   LOOP      STATEMENT

   144:           void add_C(double* A, double C) {
   145:             *A += sqrt(C);
   146:           }


NEC C/C++ Compiler (3.0.8) for Vector Engine     Thu Oct 22 15:13:55 2020
FILE NAME: vec5.c

FUNCTION NAME: add_D_vec
DIAGNOSTIC LIST

 LINE              DIAGNOSTIC MESSAGE

   152: opt(1590): Inner loop moved outside outer loop(s).: j
   153: opt(1395): Inner loop stripped and strip loop moved outside outer loop.: i
   153: vec( 101): Vectorized loop.
   153: err( 510): The number of VCOMPRESS, VEXPAND.:  0,  0.
   153: err( 504): The number of VLOAD, VSTORE.:  2,  1.
   153: err( 505): The number of VGT,   VSC.   :  0,  0.


NEC C/C++ Compiler (3.0.8) for Vector Engine     Thu Oct 22 15:13:55 2020
FILE NAME: vec5.c

FUNCTION NAME: add_D_vec
FORMAT LIST

 LINE   LOOP      STATEMENT

   148:           void add_D_vec(double* A, double* D, double* L) {
   149:             // push in loops from outside and order such that inner loop is largest to be
   150:             // vectorized
   151: +------>    for (int k=0; k<o; k++) {
   152: |+----->      for (int j=0; j<90; j++) {
   153: ||V---->        for (int i=0; i<m; i++) {
   154: |||               int idx = j*m+i;
   155: |||               A[idx] += sqrt(D[i] * L[k]);
   156: ||V----         }
   157: |+-----       }
   158: +------     }
   159:           }


NEC C/C++ Compiler (3.0.8) for Vector Engine     Thu Oct 22 15:13:55 2020
FILE NAME: vec5.c

FUNCTION NAME: add_D
DIAGNOSTIC LIST

 LINE              DIAGNOSTIC MESSAGE

   163: vec( 101): Vectorized loop.
   163: err( 510): The number of VCOMPRESS, VEXPAND.:  0,  0.
   163: err( 504): The number of VLOAD, VSTORE.:  1,  0.
   163: err( 505): The number of VGT,   VSC.   :  0,  0.
   164: vec( 126): Idiom detected.: Sum


NEC C/C++ Compiler (3.0.8) for Vector Engine     Thu Oct 22 15:13:55 2020
FILE NAME: vec5.c

FUNCTION NAME: add_D
FORMAT LIST

 LINE   LOOP      STATEMENT

   161:           void add_D(double* A, double D, double* L) {
   162:            
   163: V------>    for (int k=0; k<o; k++) {
   164: |             *A += sqrt(D * L[k]);
   165: V------     }
   166:           
   167:           }


