NEC C/C++ Compiler (3.0.8) for Vector Engine     Tue Sep 22 13:45:00 2020
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


NEC C/C++ Compiler (3.0.8) for Vector Engine     Tue Sep 22 13:45:00 2020
FILE NAME: test.c

FUNCTION NAME: libkernel2
DIAGNOSTIC LIST

 LINE              DIAGNOSTIC MESSAGE

    51: vec( 102): Partially vectorized loop.
    51: err( 510): The number of VCOMPRESS, VEXPAND.:  0,  0.
    51: err( 504): The number of VLOAD, VSTORE.:  2,  1.
    51: err( 505): The number of VGT,   VSC.   :  0,  0.
    65: vec( 101): Vectorized loop.
    65: err( 510): The number of VCOMPRESS, VEXPAND.:  0,  0.
    65: err( 504): The number of VLOAD, VSTORE.:  0,  0.
    65: err( 505): The number of VGT,   VSC.   :  0,  1.
    68: opt(1037): Feedback of array elements.: partsum_evals
    68: err( 507): VSC generated
    82: vec( 102): Partially vectorized loop.
    82: vec( 113): Overhead of loop division is too large.
    82: err( 510): The number of VCOMPRESS, VEXPAND.:  0,  0.
    82: err( 504): The number of VLOAD, VSTORE.:  1,  3.
    82: err( 505): The number of VGT,   VSC.   :  0,  0.
    86: opt(1037): Feedback of array elements.: partsum_evals
    86: opt(1036): Potential feedback - use directive or compiler option if OK.: partsum_evals
    86: vec( 122): Dependency unknown. Unvectorizable dependency is assumed.: partsum_evals
   103: vec( 101): Vectorized loop.
   103: err( 510): The number of VCOMPRESS, VEXPAND.:  0,  0.
   103: err( 504): The number of VLOAD, VSTORE.:  1,  0.
   103: err( 505): The number of VGT,   VSC.   :  0,  0.
   106: vec( 126): Idiom detected.: Sum


NEC C/C++ Compiler (3.0.8) for Vector Engine     Tue Sep 22 13:45:00 2020
FILE NAME: test.c

FUNCTION NAME: libkernel2
FORMAT LIST

 LINE   LOOP      STATEMENT

    21:           uint64_t libkernel2( unsigned int  pop_size,
    22:                                int64_t       VEMVA_dockpars_evals_of_new_entities,
    23:                                int64_t       VEMVA_evals_of_runs,
    24:                                int           num_wg)
    25:           
    26:           
    27:           
    28:           
    29:           
    30:           
    31:           {
    32:             #ifdef PRINT_ALL_KRNL
    33:             printf("Starting libkernel2 ... \n");
    34:             #endif
    35:           
    36:             int* dockpars_evals_of_new_entities = (int*) VEMVA_dockpars_evals_of_new_entities;
    37:            
    38:             int* evals_of_runs                  = (int*) VEMVA_evals_of_runs;
    39:           
    40:           
    41:           
    42:           
    43:             unsigned int j;
    44:           
    45:           
    46:           
    47:           
    48:           
    49:           
    50:             #pragma _NEC ivdep
    51: S------>    for (j = 0; j < num_wg; j++)
    52: |         
    53: |           { // Iterate over individuals (work-groups)
    54: |          
    55: |             int                entity_counter;
    56: |             int                sum_evals;
    57: |             int                partsum_evals[NUM_OF_THREADS_PER_BLOCK];
    58: |             unsigned int       i;
    59: |         
    60: |             #if defined (ENABLE_TRACE)
    61: |             ftrace_region_begin("KERNEL2_INNER_LOOP_1");
    62: |             #endif
    63: |          
    64: |         
    65: |V----->   for (i = 0; i < NUM_OF_THREADS_PER_BLOCK; i++)
    66: ||        
    67: ||          {
    68: ||      C       partsum_evals[i] = 0;
    69: |V-----     }
    70: |          
    71: |             #if defined (ENABLE_TRACE)
    72: |             ftrace_region_end("KERNEL2_INNER_LOOP_1");
    73: |             #endif
    74: |         
    75: |             #if defined (ENABLE_TRACE)
    76: |             ftrace_region_begin("KERNEL2_INNER_LOOP_2");
    77: |             #endif
    78: |          
    79: |         
    80: |         
    81: |         
    82: |S----->  for (entity_counter = 0; entity_counter < pop_size; entity_counter++)
    83: ||        
    84: ||         {
    85: ||           unsigned int local_id    = entity_counter % NUM_OF_THREADS_PER_BLOCK;
    86: ||           partsum_evals[local_id] += dockpars_evals_of_new_entities[j * pop_size +       entity_counter];
    87: ||         
    88: |S-----    }
    89: |             #if defined (ENABLE_TRACE)
    90: |             ftrace_region_end("KERNEL2_INNER_LOOP_2");
    91: |             #endif
    92: |         
    93: |             sum_evals = partsum_evals[0];
    94: |         
    95: |             #if defined (ENABLE_TRACE)
    96: |             ftrace_region_begin("KERNEL2_INNER_LOOP_3");
    97: |             #endif
    98: |          
    99: |         
   100: |         
   101: |         
   102: |         
   103: |V----->  for (entity_counter = 1; entity_counter < NUM_OF_THREADS_PER_BLOCK; entity_counter++)
   104: ||        
   105: ||         {
   106: ||              sum_evals += partsum_evals[entity_counter];
   107: ||         
   108: |V-----    }
   109: |             #if defined (ENABLE_TRACE)
   110: |             ftrace_region_end("KERNEL2_INNER_LOOP_3");
   111: |             #endif
   112: |         
   113: |             evals_of_runs[j] += sum_evals;
   114: S------     }
   115:           
   116:             #ifdef PRINT_ALL_KRNL
   117:             printf("\tFinishing libkernel2\n");
   118:             #endif
   119:             return 0;
   120:           }


NEC C/C++ Compiler (3.0.8) for Vector Engine     Tue Sep 22 13:45:00 2020
FILE NAME: test.c

FUNCTION NAME: main
DIAGNOSTIC LIST

 LINE              DIAGNOSTIC MESSAGE

  No diagnostic message.


NEC C/C++ Compiler (3.0.8) for Vector Engine     Tue Sep 22 13:45:00 2020
FILE NAME: test.c

FUNCTION NAME: main
FORMAT LIST

 LINE   LOOP      STATEMENT

   126:           int main()
   127:           
   128:           {
   129:            
   130:              uint64_t libkernel2( unsigned int  pop_size,
   131:                                   int64_t       VEMVA_dockpars_evals_of_new_entities,
   132:                                   int64_t       VEMVA_evals_of_runs,
   133:                                   int           num_wg );
   134:            
   135:           
   136:             printf("Done!\n");
   137:           
   138:           }


