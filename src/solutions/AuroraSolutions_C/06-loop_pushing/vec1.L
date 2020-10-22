NEC C/C++ Compiler (3.0.8) for Vector Engine     Thu Oct 22 15:13:54 2020
FILE NAME : vec1.c

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
FILE NAME: vec1.c

FUNCTION NAME: do_loop
DIAGNOSTIC LIST

 LINE              DIAGNOSTIC MESSAGE

    18: vec( 110): Vectorization obstructive function reference.: printf
    18: vec( 110): Vectorization obstructive function reference.: add_term
    18: vec( 110): Vectorization obstructive function reference.: exit
    47: vec( 101): Vectorized loop.
    47: err( 510): The number of VCOMPRESS, VEXPAND.:  0,  0.
    47: err( 504): The number of VLOAD, VSTORE.:  1,  0.
    47: err( 505): The number of VGT,   VSC.   :  0,  0.
    48: vec( 126): Idiom detected.: Sum


NEC C/C++ Compiler (3.0.8) for Vector Engine     Thu Oct 22 15:13:54 2020
FILE NAME: vec1.c

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
    17: +------>    for (int j=0; j<n; j++) {
    18: |+----->      for (int i=0; i<m; i++) {
    19: ||              idx = j*m+i;
    20: ||              switch (today) {
    21: ||                case (MONDAY):
    22: ||                  tmp[idx] = B[idx]+2;
    23: ||                  break;
    24: ||                case (TUESDAY):
    25: ||                  tmp[idx] = B[idx]-2;
    26: ||                  break;
    27: ||                case (WEDNESDAY):
    28: ||                  tmp[idx] = ((double)(i+1))/((double)(j+1));
    29: ||                  break;
    30: ||                case (THURSDAY):
    31: ||                  tmp[idx] = (i+1)/(j+1)+1;
    32: ||                  break;
    33: ||                case (FRIDAY):
    34: ||                  tmp[idx] = ((double)(i+1))*((double)(j+1));
    35: ||                  break;
    36: ||                case (SATURDAY):
    37: ||                  tmp[idx] = 0.5*(double)((i+1)/(j+1));
    38: ||                  break;
    39: ||                case (SUNDAY):
    40: ||                  tmp[idx] = (i+1)/((double)(j+1+2));
    41: ||                  break;
    42: ||              }
    43: ||        
    44: ||              A[idx] += sqrt(fabs(tmp[idx])+1) * exp(B[idx]);
    45: ||              tmp_old[idx] = tmp[idx];
    46: ||        
    47: ||V---->        for (int k=0; k<o; k++) {
    48: |||               tmp[idx] += exp(B[idx] * L[k]);
    49: ||V----         }
    50: ||        
    51: ||              if (tmp[idx] > max_tmp) {
    52: ||                printf("TMP greater MAX_TMP -> STOP\n");
    53: ||                exit(0);
    54: ||              }
    55: ||        
    56: ||              A[idx] += tmp[idx] / sqrt(fabs(tmp_old[idx])+1);
    57: ||        
    58: ||              add_term(j, A+idx, C[i], D[i], L);
    59: ||        
    60: |+-----       }
    61: +------     }
    62:           
    63:           }


NEC C/C++ Compiler (3.0.8) for Vector Engine     Thu Oct 22 15:13:54 2020
FILE NAME: vec1.c

FUNCTION NAME: add_term
DIAGNOSTIC LIST

 LINE              DIAGNOSTIC MESSAGE

  No diagnostic message.


NEC C/C++ Compiler (3.0.8) for Vector Engine     Thu Oct 22 15:13:54 2020
FILE NAME: vec1.c

FUNCTION NAME: add_term
FORMAT LIST

 LINE   LOOP      STATEMENT

    65:           void add_term(int j, double* A, double C, double D, double* L) {
    66:           
    67:             if (j >= 90) {
    68:               add_C(A, C);
    69:             } else if (j >= 0) {
    70:               add_D(A, D, L);
    71:             } else {
    72:               printf("A = 0.0 -> STOP\n");
    73:               exit(0);
    74:             }
    75:           
    76:           }


NEC C/C++ Compiler (3.0.8) for Vector Engine     Thu Oct 22 15:13:54 2020
FILE NAME: vec1.c

FUNCTION NAME: add_C
DIAGNOSTIC LIST

 LINE              DIAGNOSTIC MESSAGE

  No diagnostic message.


NEC C/C++ Compiler (3.0.8) for Vector Engine     Thu Oct 22 15:13:54 2020
FILE NAME: vec1.c

FUNCTION NAME: add_C
FORMAT LIST

 LINE   LOOP      STATEMENT

    78:           void add_C(double* A, double C) {
    79:             *A += sqrt(C);
    80:           }


NEC C/C++ Compiler (3.0.8) for Vector Engine     Thu Oct 22 15:13:54 2020
FILE NAME: vec1.c

FUNCTION NAME: add_D
DIAGNOSTIC LIST

 LINE              DIAGNOSTIC MESSAGE

    84: vec( 101): Vectorized loop.
    84: err( 510): The number of VCOMPRESS, VEXPAND.:  0,  0.
    84: err( 504): The number of VLOAD, VSTORE.:  1,  0.
    84: err( 505): The number of VGT,   VSC.   :  0,  0.
    85: vec( 126): Idiom detected.: Sum


NEC C/C++ Compiler (3.0.8) for Vector Engine     Thu Oct 22 15:13:54 2020
FILE NAME: vec1.c

FUNCTION NAME: add_D
FORMAT LIST

 LINE   LOOP      STATEMENT

    82:           void add_D(double* A, double D, double* L) {
    83:            
    84: V------>    for (int k=0; k<o; k++) {
    85: |             *A += sqrt(D * L[k]);
    86: V------     }
    87:           
    88:           }


