NEC C/C++ Compiler (3.0.8) for Vector Engine     Thu Oct 22 15:13:55 2020
FILE NAME : vec6.c

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
FILE NAME: vec6.c

FUNCTION NAME: do_loop
DIAGNOSTIC LIST

 LINE              DIAGNOSTIC MESSAGE

    30: vec( 101): Vectorized loop.
    30: err( 510): The number of VCOMPRESS, VEXPAND.:  0,  0.
    30: err( 504): The number of VLOAD, VSTORE.:  1,  1.
    30: err( 505): The number of VGT,   VSC.   :  0,  0.
    38: vec( 101): Vectorized loop.
    38: err( 510): The number of VCOMPRESS, VEXPAND.:  0,  0.
    38: err( 504): The number of VLOAD, VSTORE.:  1,  1.
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
    78: vec( 101): Vectorized loop.
    78: err( 510): The number of VCOMPRESS, VEXPAND.:  0,  0.
    78: err( 504): The number of VLOAD, VSTORE.:  0,  1.
    78: err( 505): The number of VGT,   VSC.   :  0,  0.
    88: vec( 101): Vectorized loop.
    88: err( 510): The number of VCOMPRESS, VEXPAND.:  0,  0.
    88: err( 504): The number of VLOAD, VSTORE.:  1,  1.
    88: err( 505): The number of VGT,   VSC.   :  0,  0.
    97: vec( 101): Vectorized loop.
    97: err( 510): The number of VCOMPRESS, VEXPAND.:  0,  0.
    97: err( 504): The number of VLOAD, VSTORE.:  2,  1.
    97: err( 505): The number of VGT,   VSC.   :  0,  0.
   107: vec( 103): Unvectorized loop.
   107: vec( 113): Overhead of loop division is too large.
   120: vec( 101): Vectorized loop.
   120: err( 510): The number of VCOMPRESS, VEXPAND.:  0,  0.
   120: err( 504): The number of VLOAD, VSTORE.:  4,  1.
   120: err( 505): The number of VGT,   VSC.   :  0,  0.
   122: vec( 128): Fused multiply-add operation applied.


NEC C/C++ Compiler (3.0.8) for Vector Engine     Thu Oct 22 15:13:55 2020
FILE NAME: vec6.c

FUNCTION NAME: do_loop
FORMAT LIST

 LINE   LOOP      STATEMENT

    14:           void do_loop(double* A, double* B, double* C, double* D, double* L,
    15:                        int today) {
    16:             // promote the scalar variable tmp to the same size as A and B
    17:             double tmp[m*n];
    18:             // array to precompute square root
    19:             double sqrttmp[m*n];
    20:             double const max_tmp = 1000000.0;
    21:             int idx;
    22:             // introduce boolen for error stop
    23:             bool errorstop;
    24:           
    25:             // split the loop to isolate the different computations
    26:             // push the loop in each case block
    27:             switch (today) {
    28:               case (MONDAY):
    29: +------>        for (int j=0; j<n; j++) {
    30: |V----->          for (int i=0; i<m; i++) {
    31: ||                  idx = j*m+i;
    32: ||                  tmp[idx] = B[idx]+2;
    33: |V-----           }
    34: +------         }
    35:                 break;
    36:               case (TUESDAY):
    37: +------>        for (int j=0; j<n; j++) {
    38: |V----->          for (int i=0; i<m; i++) {
    39: ||                  idx = j*m+i;
    40: ||                  tmp[idx] = B[idx]-2;
    41: |V-----           }
    42: +------         }
    43:                 break;
    44:               case (WEDNESDAY):
    45: +------>        for (int j=0; j<n; j++) {
    46: |V----->          for (int i=0; i<m; i++) {
    47: ||                  idx = j*m+i;
    48: ||                  tmp[idx] = ((double)(i+1))/((double)(j+1));
    49: |V-----           }
    50: +------         }
    51:                 break;
    52:               case (THURSDAY):
    53: +------>        for (int j=0; j<n; j++) {
    54: |V----->          for (int i=0; i<m; i++) {
    55: ||                  idx = j*m+i;
    56: ||                  tmp[idx] = (i+1)/(j+1)+1;
    57: |V-----           }
    58: +------         }
    59:                 break;
    60:               case (FRIDAY):
    61: +------>        for (int j=0; j<n; j++) {
    62: |V----->          for (int i=0; i<m; i++) {
    63: ||                  idx = j*m+i;
    64: ||                  tmp[idx] = ((double)(i+1))*((double)(j+1));
    65: |V-----           }
    66: +------         }
    67:                 break;
    68:               case (SATURDAY):
    69: +------>        for (int j=0; j<n; j++) {
    70: |V----->          for (int i=0; i<m; i++) {
    71: ||                  idx = j*m+i;
    72: ||                  tmp[idx] = 0.5*(double)((i+1)/(j+1));
    73: |V-----           }
    74: +------         }
    75:                 break;
    76:               case (SUNDAY):
    77: +------>        for (int j=0; j<n; j++) {
    78: |V----->          for (int i=0; i<m; i++) {
    79: ||                  idx = j*m+i;
    80: ||                  tmp[idx] = (i+1)/((double)(j+1+2));
    81: |V-----           }
    82: +------         }
    83:                 break;
    84:             }
    85:           
    86:             // precompute square root as it is needed twice
    87: +------>    for (int j=0; j<n; j++) {
    88: |V----->      for (int i=0; i<m; i++) {
    89: ||              idx = j*m+i;
    90: ||              sqrttmp[idx] = sqrt(fabs(tmp[idx])+1);
    91: |V-----       }
    92: +------     }
    93:           
    94:             // compute tmp and reorder loops such that the longest loop is inside and vectorizable
    95: +------>    for (int k=0; k<o; k++) {
    96: |+----->      for (int j=0; j<n; j++) {
    97: ||V---->        for (int i=0; i<m; i++) {
    98: |||               idx = j*m+i;
    99: |||               tmp[idx] += exp(B[idx] * L[k]);
   100: ||V----         }
   101: |+-----       }
   102: +------     }
   103:            
   104:             // do error checking
   105:             errorstop = false;
   106: +------>    for (int j=0; j<n; j++) {
   107: |+----->      for (int i=0; i<m; i++) {
   108: ||              idx = j*m+i;
   109: ||              if (tmp[idx] > max_tmp) errorstop = true;
   110: |+-----       }
   111: +------     }
   112:           
   113:             if (errorstop) {
   114:               printf("TMP greater MAX_TMP -> STOP\n");
   115:               exit(0);
   116:             }
   117:           
   118:             // combine loops for computing A
   119: +------>    for (int j=0; j<n; j++) {
   120: |V----->      for (int i=0; i<m; i++) {
   121: ||              idx = j*m+i;
   122: ||      F       A[idx] += sqrttmp[idx] * exp(B[idx]);
   123: ||              A[idx] += tmp[idx] / sqrttmp[idx];
   124: |V-----       }
   125: +------     }
   126:           
   127:             //create a new version of add_term and push in the loops
   128:             add_term_vec(A, C, D, L);
   129:           }


NEC C/C++ Compiler (3.0.8) for Vector Engine     Thu Oct 22 15:13:55 2020
FILE NAME: vec6.c

FUNCTION NAME: add_term_vec
DIAGNOSTIC LIST

 LINE              DIAGNOSTIC MESSAGE

  No diagnostic message.


NEC C/C++ Compiler (3.0.8) for Vector Engine     Thu Oct 22 15:13:55 2020
FILE NAME: vec6.c

FUNCTION NAME: add_term_vec
FORMAT LIST

 LINE   LOOP      STATEMENT

   131:           void add_term_vec(double* A, double* C, double* D, double* L) {
   132:           
   133:             // The loop parameters are known, therefore the if construct can be eliminated
   134:             // and replaced by explicit looping
   135:             // The stop can never happen with these loop parameters
   136:             add_D_vec(A, D, L);
   137:             add_C_vec(A, C);
   138:           }


NEC C/C++ Compiler (3.0.8) for Vector Engine     Thu Oct 22 15:13:55 2020
FILE NAME: vec6.c

FUNCTION NAME: add_term
DIAGNOSTIC LIST

 LINE              DIAGNOSTIC MESSAGE

  No diagnostic message.


NEC C/C++ Compiler (3.0.8) for Vector Engine     Thu Oct 22 15:13:55 2020
FILE NAME: vec6.c

FUNCTION NAME: add_term
FORMAT LIST

 LINE   LOOP      STATEMENT

   139:           void add_term(int j, double* A, double C, double D, double* L) {
   140:           
   141:             if (j >= 90) {
   142:               add_C(A, C);
   143:             } else if (j >= 0) {
   144:               add_D(A, D, L);
   145:             } else {
   146:               printf("A = 0.0 -> STOP\n");
   147:               exit(0);
   148:             }
   149:           
   150:           }


NEC C/C++ Compiler (3.0.8) for Vector Engine     Thu Oct 22 15:13:55 2020
FILE NAME: vec6.c

FUNCTION NAME: add_C_vec
DIAGNOSTIC LIST

 LINE              DIAGNOSTIC MESSAGE

   156: opt(1395): Inner loop stripped and strip loop moved outside outer loop.: i
   156: vec( 101): Vectorized loop.
   156: err( 510): The number of VCOMPRESS, VEXPAND.:  0,  0.
   156: err( 504): The number of VLOAD, VSTORE.:  2,  1.
   156: err( 505): The number of VGT,   VSC.   :  0,  0.


NEC C/C++ Compiler (3.0.8) for Vector Engine     Thu Oct 22 15:13:55 2020
FILE NAME: vec6.c

FUNCTION NAME: add_C_vec
FORMAT LIST

 LINE   LOOP      STATEMENT

   152:           void add_C_vec(double* A, double* C) {
   153:             // push in loops from outside and order such that inner loop is largest to be
   154:             // vectorized
   155: +------>    for (int j=90; j<n; j++) {
   156: |V----->      for (int i=0; i<m; i++) {
   157: ||              int idx = j*m+i;
   158: ||              A[idx] = A[idx] + sqrt(C[i]);
   159: |V-----       }
   160: +------     }
   161:           }


NEC C/C++ Compiler (3.0.8) for Vector Engine     Thu Oct 22 15:13:55 2020
FILE NAME: vec6.c

FUNCTION NAME: add_C
DIAGNOSTIC LIST

 LINE              DIAGNOSTIC MESSAGE

  No diagnostic message.


NEC C/C++ Compiler (3.0.8) for Vector Engine     Thu Oct 22 15:13:55 2020
FILE NAME: vec6.c

FUNCTION NAME: add_C
FORMAT LIST

 LINE   LOOP      STATEMENT

   162:           void add_C(double* A, double C) {
   163:             *A += sqrt(C);
   164:           }


NEC C/C++ Compiler (3.0.8) for Vector Engine     Thu Oct 22 15:13:55 2020
FILE NAME: vec6.c

FUNCTION NAME: add_D_vec
DIAGNOSTIC LIST

 LINE              DIAGNOSTIC MESSAGE

   170: opt(1590): Inner loop moved outside outer loop(s).: j
   171: opt(1395): Inner loop stripped and strip loop moved outside outer loop.: i
   171: vec( 101): Vectorized loop.
   171: err( 510): The number of VCOMPRESS, VEXPAND.:  0,  0.
   171: err( 504): The number of VLOAD, VSTORE.:  2,  1.
   171: err( 505): The number of VGT,   VSC.   :  0,  0.


NEC C/C++ Compiler (3.0.8) for Vector Engine     Thu Oct 22 15:13:55 2020
FILE NAME: vec6.c

FUNCTION NAME: add_D_vec
FORMAT LIST

 LINE   LOOP      STATEMENT

   166:           void add_D_vec(double* A, double* D, double* L) {
   167:             // push in loops from outside and order such that inner loop is largest to be
   168:             // vectorized
   169: +------>    for (int k=0; k<o; k++) {
   170: |+----->      for (int j=0; j<90; j++) {
   171: ||V---->        for (int i=0; i<m; i++) {
   172: |||               int idx = j*m+i;
   173: |||               A[idx] += sqrt(D[i] * L[k]);
   174: ||V----         }
   175: |+-----       }
   176: +------     }
   177:           }


NEC C/C++ Compiler (3.0.8) for Vector Engine     Thu Oct 22 15:13:55 2020
FILE NAME: vec6.c

FUNCTION NAME: add_D
DIAGNOSTIC LIST

 LINE              DIAGNOSTIC MESSAGE

   181: vec( 101): Vectorized loop.
   181: err( 510): The number of VCOMPRESS, VEXPAND.:  0,  0.
   181: err( 504): The number of VLOAD, VSTORE.:  1,  0.
   181: err( 505): The number of VGT,   VSC.   :  0,  0.
   182: vec( 126): Idiom detected.: Sum


NEC C/C++ Compiler (3.0.8) for Vector Engine     Thu Oct 22 15:13:55 2020
FILE NAME: vec6.c

FUNCTION NAME: add_D
FORMAT LIST

 LINE   LOOP      STATEMENT

   179:           void add_D(double* A, double D, double* L) {
   180:            
   181: V------>    for (int k=0; k<o; k++) {
   182: |             *A += sqrt(D * L[k]);
   183: V------     }
   184:           
   185:           }


