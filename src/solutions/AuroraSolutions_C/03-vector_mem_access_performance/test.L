NEC C/C++ Compiler (3.0.8) for Vector Engine     Thu Sep 10 19:22:20 2020
FILE NAME : test.c

  COMPILER OPTIONS : -O3 -Wobsolescent -Wextension -Wall -std=gnu11 -ftrace -report-all -fdiag-vector=3 -mvector-packed -c

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
        -mvector-packed                          : enable
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


NEC C/C++ Compiler (3.0.8) for Vector Engine     Thu Sep 10 19:22:20 2020
FILE NAME: test.c

FUNCTION NAME: doit
DIAGNOSTIC LIST

 LINE              DIAGNOSTIC MESSAGE

    11: opt(1592): Outer loop unrolled inside inner loop.: j
    12: err( 504): The number of VLOAD, VSTORE.:  8,  4.
    12: vec( 101): Vectorized loop.
    12: err( 510): The number of VCOMPRESS, VEXPAND.:  0,  0.
    12: err( 504): The number of VLOAD, VSTORE.:  2,  1.
    12: err( 505): The number of VGT,   VSC.   :  0,  0.
    14: vec( 140): Unpacked loop.: non-target type
    21: vec( 111): "novector" is specified.
    22: vec( 101): Vectorized loop.
    22: err( 510): The number of VCOMPRESS, VEXPAND.:  0,  0.
    22: err( 504): The number of VLOAD, VSTORE.:  2,  1.
    22: err( 505): The number of VGT,   VSC.   :  0,  0.
    24: vec( 140): Unpacked loop.: non-target type
    25: vec( 140): Unpacked loop.: non-target type
    33: vec( 111): "novector" is specified.
    34: vec( 101): Vectorized loop.
    34: err( 510): The number of VCOMPRESS, VEXPAND.:  0,  0.
    34: err( 504): The number of VLOAD, VSTORE.:  2,  1.
    34: err( 505): The number of VGT,   VSC.   :  1,  0.
    36: err( 506): VGT generated
    36: vec( 140): Unpacked loop.: non-linear
    36: vec( 140): Unpacked loop.: non-target type
    43: vec( 111): "novector" is specified.
    45: vec( 101): Vectorized loop.
    45: err( 510): The number of VCOMPRESS, VEXPAND.:  0,  0.
    45: err( 504): The number of VLOAD, VSTORE.:  3,  0.
    45: err( 505): The number of VGT,   VSC.   :  0,  1.
    47: err( 507): VSC generated
    47: vec( 140): Unpacked loop.: non-linear
    47: vec( 140): Unpacked loop.: non-target type
    54: vec( 111): "novector" is specified.
    56: vec( 101): Vectorized loop.
    56: err( 510): The number of VCOMPRESS, VEXPAND.:  0,  0.
    56: err( 504): The number of VLOAD, VSTORE.:  2,  0.
    56: err( 505): The number of VGT,   VSC.   :  1,  1.
    58: err( 507): VSC generated
    58: err( 506): VGT generated
    58: vec( 140): Unpacked loop.: non-linear
    58: vec( 140): Unpacked loop.: non-target type
    65: vec( 111): "novector" is specified.
    66: vec( 101): Vectorized loop.
    66: err( 510): The number of VCOMPRESS, VEXPAND.:  0,  0.
    66: err( 504): The number of VLOAD, VSTORE.:  1,  1.
    66: err( 505): The number of VGT,   VSC.   :  0,  0.
    68: opt(1037): Feedback of array elements.: B
    68: vec( 126): Idiom detected.: Iteration
    68: vec( 140): Unpacked loop.: non-target type
    68: vec( 140): Unpacked loop.: idiom used
    76: vec( 111): "novector" is specified.
    77: vec( 101): Vectorized loop.
    77: err( 510): The number of VCOMPRESS, VEXPAND.:  0,  0.
    77: err( 504): The number of VLOAD, VSTORE.:  1,  0.
    77: err( 505): The number of VGT,   VSC.   :  0,  0.
    79: vec( 126): Idiom detected.: Sum
    79: vec( 140): Unpacked loop.: idiom used
    79: vec( 140): Unpacked loop.: non-target type


NEC C/C++ Compiler (3.0.8) for Vector Engine     Thu Sep 10 19:22:20 2020
FILE NAME: test.c

FUNCTION NAME: doit
FORMAT LIST

 LINE   LOOP      STATEMENT

     5:           void doit (int m, int n, int o, double* A, double* B, int* ind) {
     6:            
     7:             int i,j,k,idx;
     8:           
     9:             ftrace_region_begin("DIRECT");
    10:           #pragma _NEC parallel for
    11: U------>    for (j=0; j<n; j++) {
    12: |V----->      for (i=0; i<m; i++) {
    13: ||              idx = j*m+i;
    14: ||              B[idx] += A[idx];
    15: |V-----       }
    16: U------     }
    17:             ftrace_region_end("DIRECT");
    18:           
    19:             ftrace_region_begin("MASK");
    20:           #pragma _NEC novector
    21: +------>    for (j=0; j<n; j++) {
    22: |V----->      for (i=0; i<m; i++) {
    23: ||              idx = j*m+i;
    24: ||              if (A[idx] > 0.0) {
    25: ||                B[idx] += A[idx];
    26: ||              }
    27: |V-----       }
    28: +------     }
    29:             ftrace_region_end("MASK");
    30:           
    31:             ftrace_region_begin("GATHER");
    32:           #pragma _NEC novector
    33: +------>    for (j=0; j<n; j++) {
    34: |V----->      for (i=0; i<m; i++) {
    35: ||              idx = j*m+i;
    36: ||      G       B[idx] += A[j*m+ind[i]];
    37: |V-----       }
    38: +------     }
    39:             ftrace_region_end("GATHER");
    40:           
    41:             ftrace_region_begin("SCATTER");
    42:           #pragma _NEC novector
    43: +------>    for (j=0; j<n; j++) {
    44: |         #pragma _NEC ivdep
    45: |V----->      for (i=0; i<m; i++) {
    46: ||              idx = j*m+i;
    47: ||      C       B[j*m+ind[i]] = B[idx] +A[idx];
    48: |V-----       }
    49: +------     }
    50:             ftrace_region_end("SCATTER");
    51:           
    52:             ftrace_region_begin("GATHER-SCATTER");
    53:           #pragma _NEC novector
    54: +------>    for (j=0; j<n; j++) {
    55: |         #pragma _NEC ivdep
    56: |V----->      for (i=0; i<m; i++) {
    57: ||              idx = j*m+ind[i];
    58: ||      G       B[idx] += A[j*m+i];
    59: |V-----       }
    60: +------     }
    61:             ftrace_region_end("GATHER-SCATTER");
    62:           
    63:             ftrace_region_begin("FOLR");
    64:           #pragma _NEC novector
    65: +------>    for (j=0; j<n; j++) {
    66: |V----->      for (i=1; i<m; i++) {
    67: ||              idx = j*m+i;
    68: ||              B[idx] = B[j*m+i-1] +A[idx];
    69: |V-----       }
    70: +------     }
    71:             ftrace_region_end("FOLR");
    72:           
    73:             ftrace_region_begin("REDUCTION");
    74:             j = 1;
    75:           #pragma _NEC novector
    76: +------>    for (i=0; i<m; i++) {
    77: |V----->      for (k=0; k<o; k++) {
    78: ||              idx = j*m+i;
    79: ||              B[idx] += A[k*m+i];
    80: |V-----       }
    81: +------     }
    82:             ftrace_region_end("REDUCTION");
    83:           
    84:           }


NEC C/C++ Compiler (3.0.8) for Vector Engine     Thu Sep 10 19:22:20 2020
FILE NAME: test.c

FUNCTION NAME: main
DIAGNOSTIC LIST

 LINE              DIAGNOSTIC MESSAGE

    92: vec( 101): Vectorized loop.
    92: err( 510): The number of VCOMPRESS, VEXPAND.:  0,  0.
    92: err( 504): The number of VLOAD, VSTORE.:  0,  2.
    92: err( 505): The number of VGT,   VSC.   :  0,  0.
    92: vec( 140): Unpacked loop.: non-target type
    93: opt(1112): Loop fused with previous loop.: i
    93: vec( 140): Unpacked loop.: non-target type
    94: vec( 101): Vectorized loop.
    94: err( 510): The number of VCOMPRESS, VEXPAND.:  0,  0.
    94: err( 504): The number of VLOAD, VSTORE.:  0,  1.
    94: err( 505): The number of VGT,   VSC.   :  0,  0.
    94: vec( 139): Packed loop.
    96: vec( 103): Unvectorized loop.
    96: vec( 110): Vectorization obstructive function reference.: doit
    97: opt(1025): Reference to this function inhibits optimization.: doit


NEC C/C++ Compiler (3.0.8) for Vector Engine     Thu Sep 10 19:22:20 2020
FILE NAME: test.c

FUNCTION NAME: main
FORMAT LIST

 LINE   LOOP      STATEMENT

    86:           int main () {
    87:           
    88:             int const m = 1000, n = 1000, o = 1000, iter = 1000;
    89:             double A[m*n], B[m*n];
    90:             int ind[m];
    91:           
    92: |      >    for (int i=0; i<m*n; i++) B[i] = 0.0;
    93: V======>    for (int i=0; i<m*n; i++) A[i] = 1.0;
    94: V======>    for (int i=0; i<m; i++) ind[i] = m-i-1;
    95:           
    96: +------>    for (int i=0; i<iter; i++) {
    97: |             doit(m, n, o, A, B, ind);
    98: +------     }
    99:           
   100:             printf("Done!\n");
   101:           }


