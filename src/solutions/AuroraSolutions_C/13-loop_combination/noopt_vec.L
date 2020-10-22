NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:14:13 2019
FILE NAME: vec.c

FUNCTION NAME: do_comp
DIAGNOSTIC LIST

 LINE              DIAGNOSTIC MESSAGE

     6: vec( 101): Vectorized loop.
     6: err( 504): The number of VLOAD, VSTORE.:  2,  1.
     6: err( 505): The number of VGT,   VSC.   :  0,  0.
     8: vec( 128): Fused multiply-add operation applied.
    13: vec( 101): Vectorized loop.
    13: err( 504): The number of VLOAD, VSTORE.:  3,  1.
    13: err( 505): The number of VGT,   VSC.   :  0,  0.


NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:14:13 2019
FILE NAME: vec.c

FUNCTION NAME: do_comp
FORMAT LIST

 LINE   LOOP      STATEMENT

     3:           void do_comp(double* A, double* B) {
     4:           
     5: +------>    for (int j=0; j<n; j++) {
     6: |V----->      for (int i=0; i<m; i++) {
     7: ||              int idx = j*m+i;
     8: ||      F       B[idx] += A[idx] * A[idx];
     9: |V-----       }
    10: +------     }
    11:           
    12: +------>    for (int j=1; j<n-1; j++) {
    13: |V----->      for (int i=0; i<m; i++) {
    14: ||              int idx = j*m+i;
    15: ||              B[idx] += A[idx] + A[(j-1)*m+i];
    16: |V-----       }
    17: +------     }
    18:           
    19:           }


