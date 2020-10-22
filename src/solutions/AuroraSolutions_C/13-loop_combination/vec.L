NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:14:15 2019
FILE NAME: vec.c

FUNCTION NAME: do_comp
DIAGNOSTIC LIST

 LINE              DIAGNOSTIC MESSAGE

     6: vec( 101): Vectorized loop.
     6: err( 504): The number of VLOAD, VSTORE.:  2,  1.
     6: err( 505): The number of VGT,   VSC.   :  0,  0.
     8: vec( 128): Fused multiply-add operation applied.
    12: opt(1592): Outer loop unrolled inside inner loop.: j
    13: err( 504): The number of VLOAD, VSTORE.: 10,  4.
    13: vec( 101): Vectorized loop.
    13: err( 504): The number of VLOAD, VSTORE.:  3,  1.
    13: err( 505): The number of VGT,   VSC.   :  0,  0.
    15: vec( 128): Fused multiply-add operation applied.
    20: vec( 101): Vectorized loop.
    20: err( 504): The number of VLOAD, VSTORE.:  2,  1.
    20: err( 505): The number of VGT,   VSC.   :  0,  0.
    22: vec( 128): Fused multiply-add operation applied.


NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:14:15 2019
FILE NAME: vec.c

FUNCTION NAME: do_comp
FORMAT LIST

 LINE   LOOP      STATEMENT

     3:           void do_comp(double* A, double* B) {
     4:           
     5:             // separate the operations which are performed in only one of the loops
     6: V------>    for (int i=0; i<m; i++) {
     7: |             int idx = 0*m+i;
     8: |       F     B[idx] += A[idx] * A[idx];
     9: V------     }
    10:           
    11:             // combine the two loops and merge their operations
    12: U------>    for (int j=1; j<n-1; j++) {
    13: |V----->      for (int i=0; i<m; i++) {
    14: ||              int idx = j*m+i;
    15: ||      F       B[idx] += A[idx] * A[idx] + A[idx] + A[(j-1)*m+i];
    16: |V-----       }
    17: U------     }
    18:           
    19:             // separate the operations which are performed in only one of the loops
    20: V------>    for (int i=0; i<m; i++) {
    21: |             int idx = (n-1)*m+i;
    22: |       F     B[idx] += A[idx] * A[idx];
    23: V------     }
    24:           
    25:           }


