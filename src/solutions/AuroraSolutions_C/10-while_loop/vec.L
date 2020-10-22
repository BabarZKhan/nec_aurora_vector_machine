NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:12:01 2019
FILE NAME: vec.c

FUNCTION NAME: do_comp_boolmask
DIAGNOSTIC LIST

 LINE              DIAGNOSTIC MESSAGE

    13: vec( 101): Vectorized loop.
    13: err( 504): The number of VLOAD, VSTORE.:  2,  1.
    13: err( 505): The number of VGT,   VSC.   :  0,  0.


NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:12:01 2019
FILE NAME: vec.c

FUNCTION NAME: do_comp_boolmask
FORMAT LIST

 LINE   LOOP      STATEMENT

     3:           void do_comp_boolmask(double* A, double* B) {
     4:             double static const max_val = 1000.0;
     5:            
     6:             // create a todo counter initialized to something >= 1
     7:             int todo = 1;
     8:             // pull out while loop
     9: +------>    while (todo > 0) {
    10: |             // reset counter for remaining tasks
    11: |             todo = 0;
    12: |+----->      for (int j=0; j<n; j++) {
    13: ||V---->        for (int i=0; i<m; i++) {
    14: |||               int idx = m*j+i;
    15: |||               // build a boolean mask and execute
    16: |||               if (B[idx] < max_val) {
    17: |||                 B[idx] += A[idx];
    18: |||                 // take note of how many operations got performed
    19: |||                 // and might need to be performed again
    20: |||                 todo++;
    21: |||               }
    22: ||V----         }
    23: |+-----       }
    24: +------     }
    25:           }


NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:12:01 2019
FILE NAME: vec.c

FUNCTION NAME: do_comp_idxlist
DIAGNOSTIC LIST

 LINE              DIAGNOSTIC MESSAGE

    33: vec( 101): Vectorized loop.
    33: err( 504): The number of VLOAD, VSTORE.:  1,  1.
    33: err( 505): The number of VGT,   VSC.   :  0,  0.
    35: opt(1019): Feedback of scalar value from one loop pass to another.: midx
    48: vec( 101): Vectorized loop.
    48: err( 504): The number of VLOAD, VSTORE.:  1,  1.
    48: err( 505): The number of VGT,   VSC.   :  2,  1.
    51: err( 507): VSC generated
    51: err( 506): VGT generated
    57: opt(1019): Feedback of scalar value from one loop pass to another.: midx_new


NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:12:01 2019
FILE NAME: vec.c

FUNCTION NAME: do_comp_idxlist
FORMAT LIST

 LINE   LOOP      STATEMENT

    27:           void do_comp_idxlist(double* A, double* B) {
    28:             double static const max_val = 1000.0;
    29:            
    30:             // create an intial collapsed index list
    31:             int midx = 0;
    32:             int idxlist[m*n];
    33: V------>    for (int i=0; i<n*m; i++) {
    34: |             if (B[i] < max_val) {
    35: |               idxlist[midx++] = i;
    36: |             }
    37: V------     }
    38:           
    39:             // pull out the while loop
    40: +------>    while (midx > 0) {
    41: |             // counter to keep track of how many operations were performed
    42: |             int midx_new = 0;
    43: |             // directive to tell the compiler that every element occurs only once in the
    44: |             // index list (injective)
    45: |             #pragma _NEC ivdep
    46: |             // directive to allow checking the loop size before vectorizing
    47: |             #pragma _NEC loop_count_test
    48: |V----->      for (int lidx=0; lidx<midx; lidx++) {
    49: ||              int i = idxlist[lidx];
    50: ||              // perform the operation
    51: ||      G       B[i] += A[i];
    52: ||              // check weather the operation needs to be applied in the next iteration
    53: ||              if (B[i] < max_val) {
    54: ||                // create new index list
    55: ||                // note that the elements are replaced, which is valid, as the number of
    56: ||                // accessed indices shrinks
    57: ||                idxlist[midx_new++] = i;
    58: ||              }
    59: |V-----       }
    60: |             // transfer counter
    61: |             midx = midx_new;
    62: +------     }
    63:           }


