NEC C/C++ Compiler (3.0.8) for Vector Engine     Thu Oct 22 15:13:54 2020
FILE NAME : test.c

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
FILE NAME: test.c

FUNCTION NAME: main
DIAGNOSTIC LIST

 LINE              DIAGNOSTIC MESSAGE

    10: vec( 101): Vectorized loop.
    10: err( 510): The number of VCOMPRESS, VEXPAND.:  0,  0.
    10: err( 504): The number of VLOAD, VSTORE.:  0,  2.
    10: err( 505): The number of VGT,   VSC.   :  0,  0.
    11: opt(1112): Loop fused with previous loop.: i
    12: vec( 101): Vectorized loop.
    12: err( 510): The number of VCOMPRESS, VEXPAND.:  0,  0.
    12: err( 504): The number of VLOAD, VSTORE.:  0,  2.
    12: err( 505): The number of VGT,   VSC.   :  0,  0.
    13: opt(1112): Loop fused with previous loop.: i
    14: vec( 101): Vectorized loop.
    14: err( 510): The number of VCOMPRESS, VEXPAND.:  0,  0.
    14: err( 504): The number of VLOAD, VSTORE.:  0,  1.
    14: err( 505): The number of VGT,   VSC.   :  0,  0.
    16: vec( 103): Unvectorized loop.
    16: vec( 110): Vectorization obstructive function reference.: do_loop
    18: opt(1025): Reference to this function inhibits optimization.: do_loop
    25: vec( 101): Vectorized loop.
    25: err( 510): The number of VCOMPRESS, VEXPAND.:  0,  0.
    25: err( 504): The number of VLOAD, VSTORE.:  1,  0.
    25: err( 505): The number of VGT,   VSC.   :  0,  0.
    27: vec( 126): Idiom detected.: Max/Min
    30: vec( 126): Idiom detected.: Max/Min
    32: vec( 126): Idiom detected.: Sum


NEC C/C++ Compiler (3.0.8) for Vector Engine     Thu Oct 22 15:13:54 2020
FILE NAME: test.c

FUNCTION NAME: main
FORMAT LIST

 LINE   LOOP      STATEMENT

     6:           int main () {
     7:             double A[m*n], B[m*n], C[m], D[m], L[o];
     8:             int today;
     9:           
    10: |      >    for (int i=0; i<n*m; i++) A[i] = 0.0;
    11: V======>    for (int i=0; i<n*m; i++) B[i] = 1.0;
    12: |      >    for (int i=0; i<m; i++) C[i] = 2.0;
    13: V======>    for (int i=0; i<m; i++) D[i] = 3.0;
    14: V======>    for (int i=0; i<o; i++) L[i] = sqrt((double)(i+1)) + 1.0;
    15:           
    16: +------>    for (int i=0; i<iter; i++) {
    17: |             today = (i+1)%7;
    18: |             do_loop(A, B, C, D, L, today);
    19: +------     }
    20:           
    21:           
    22:             double minval = A[0];
    23:             double maxval = A[0];
    24:             double sum = A[0];
    25: V------>    for (int i=1; i<m*n; i++) {
    26: |             if (A[i] < minval) {
    27: |               minval = A[i];
    28: |             }
    29: |             if (A[i] > maxval) {
    30: |               maxval = A[i];
    31: |             }
    32: |             sum += A[i];
    33: V------     }
    34:             printf("MIN: %20.16e\n", minval);
    35:             printf("MAX: %20.16e\n", maxval);
    36:             printf("AVG: %20.16e\n", sum/(m*n));
    37:           
    38:             return 0;
    39:           }


