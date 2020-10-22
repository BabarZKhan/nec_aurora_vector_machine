NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:16:14 2019
FILE NAME: vec2.c

FUNCTION NAME: do_comp
DIAGNOSTIC LIST

 LINE              DIAGNOSTIC MESSAGE

     7: opt(1592): Outer loop unrolled inside inner loop.: k
     8: opt(1395): Inner loop stripped and strip loop moved outside outer loop.: i
     8: err( 504): The number of VLOAD, VSTORE.: 17,  1.
     8: vec( 101): Vectorized loop.
     8: err( 504): The number of VLOAD, VSTORE.:  2,  1.
     8: err( 505): The number of VGT,   VSC.   :  0,  0.


NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:16:14 2019
FILE NAME: vec2.c

FUNCTION NAME: do_comp
FORMAT LIST

 LINE   LOOP      STATEMENT

     1:           void do_comp(int m, int n, int o, double* A, double* B) {
     2:            
     3: +------>    for (int j=0; j<n; j++) {
     4: |             // interchange the i and k loop to prevent a reduction for the k loop
     5: |             // increase the unrolling (default 4) to something larger
     6: |             #pragma _NEC outerloop_unroll(16)
     7: |U----->      for (int k=0; k<o; k++) {
     8: ||V---->        for (int i=0; i<m; i++) {
     9: |||               B[j*m+i] += A[j*m*o+i*o+k];
    10: ||V----         }
    11: |U-----       }
    12: +------     }
    13:           }


