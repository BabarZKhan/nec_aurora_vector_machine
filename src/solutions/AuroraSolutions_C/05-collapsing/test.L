NEC C/C++ Compiler (3.0.8) for Vector Engine     Tue Sep 22 12:54:39 2020
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


NEC C/C++ Compiler (3.0.8) for Vector Engine     Tue Sep 22 12:54:39 2020
FILE NAME: test.c

FUNCTION NAME: main
DIAGNOSTIC LIST

 LINE              DIAGNOSTIC MESSAGE

    13: opt(1592): Outer loop unrolled inside inner loop.: j
    14: err( 504): The number of VLOAD, VSTORE.:  4,  4.
    14: vec( 101): Vectorized loop.
    14: err( 510): The number of VCOMPRESS, VEXPAND.:  0,  0.
    14: err( 504): The number of VLOAD, VSTORE.:  1,  1.
    14: err( 505): The number of VGT,   VSC.   :  0,  0.
    21: vec( 103): Unvectorized loop.
    21: vec( 110): Vectorization obstructive function reference.: sub2
    21: vec( 110): Vectorization obstructive function reference.: sub3
    21: vec( 110): Vectorization obstructive function reference.: sub4
    21: vec( 110): Vectorization obstructive function reference.: sub1
    22: opt(1025): Reference to this function inhibits optimization.: sub1
    32: opt(1592): Outer loop unrolled inside inner loop.: j
    33: err( 504): The number of VLOAD, VSTORE.:  8,  0.
    33: vec( 101): Vectorized loop.
    33: err( 510): The number of VCOMPRESS, VEXPAND.:  0,  0.
    33: err( 504): The number of VLOAD, VSTORE.:  2,  0.
    33: err( 505): The number of VGT,   VSC.   :  0,  0.
    36: vec( 126): Idiom detected.: Max/Min
    39: vec( 126): Idiom detected.: Max/Min
    41: vec( 126): Idiom detected.: Sum


NEC C/C++ Compiler (3.0.8) for Vector Engine     Tue Sep 22 12:54:39 2020
FILE NAME: test.c

FUNCTION NAME: main
FORMAT LIST

 LINE   LOOP      STATEMENT

     5:           int main () {
     6:            
     7:             double a[l*m*n], b[l*m*n];
     8:             int idx;
     9:            
    10:             init(a);
    11:           
    12: +------>    for (int k=0; k<n; k++) {
    13: |U----->      for (int j=0; j<m; j++) {
    14: ||V---->        for (int i=0; i<l; i++) {
    15: |||               idx = k*m*l+j*l+i;
    16: |||               b[idx] = a[idx]/3.0;
    17: ||V----         }
    18: |U-----       }
    19: +------     }
    20:           
    21: +------>    for (int p=1; p<=10000; p++) {
    22: |             sub1(a, b);
    23: |             sub2(a, b, l, m, n);
    24: |             sub3(a, b, l, m-1, n);
    25: |             sub4(a, b);
    26: +------     }
    27:            
    28:             double minval = a[0]+b[0];
    29:             double maxval = a[0]+b[0];
    30:             double sum = 0;
    31: +------>    for (int k=0; k<n; k++) {
    32: |U----->      for (int j=0; j<m; j++) {
    33: ||V---->        for (int i=0; i<l; i++) {
    34: |||               idx = k*m*l+j*l+i;
    35: |||               if (a[idx]+b[idx] < minval) {
    36: |||                 minval = a[idx]+b[idx];
    37: |||               }
    38: |||               if (a[idx]+b[idx] > maxval) {
    39: |||                 maxval = a[idx]+b[idx];
    40: |||               }
    41: |||               sum += a[idx]+b[idx];
    42: ||V----         }
    43: |U-----       }
    44: +------     }
    45:             printf("MIN: %20.16e\n", minval);
    46:             printf("MAX: %20.16e\n", maxval);
    47:             printf("AVG: %20.16e\n", sum/(2.0*l*m*n));
    48:            
    49:             return 0;
    50:           }


