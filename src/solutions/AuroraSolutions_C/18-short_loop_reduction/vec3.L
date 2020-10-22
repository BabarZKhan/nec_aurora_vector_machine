NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:16:14 2019
FILE NAME: vec3.c

FUNCTION NAME: do_comp
DIAGNOSTIC LIST

 LINE              DIAGNOSTIC MESSAGE

     5: opt(1097): This statement prevents loop optimization.
     6: vec( 101): Vectorized loop.
     6: err( 504): The number of VLOAD, VSTORE.:  0,  1.
     6: err( 505): The number of VGT,   VSC.   :  0,  0.
     8: opt(1592): Outer loop unrolled inside inner loop.: k
     9: err( 504): The number of VLOAD, VSTORE.: 17,  1.
     9: vec( 101): Vectorized loop.
     9: err( 504): The number of VLOAD, VSTORE.:  2,  1.
     9: err( 505): The number of VGT,   VSC.   :  0,  0.
    14: vec( 101): Vectorized loop.
    14: err( 504): The number of VLOAD, VSTORE.:  2,  1.
    14: err( 505): The number of VGT,   VSC.   :  0,  0.


NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:16:14 2019
FILE NAME: vec3.c

FUNCTION NAME: do_comp
FORMAT LIST

 LINE   LOOP      STATEMENT

     1:           void do_comp(int m, int n, int o, double* A, double* B) {
     2:            
     3: +------>    for (int j=0; j<n; j++) {
     4: |             // set up a 1-D array
     5: |             double s[m];
     6: |V=====>      for (int i=0; i<m; i++) s[i] = 0.0;
     7: |             #pragma _NEC outerloop_unroll(16)
     8: |U----->      for (int k=0; k<o; k++) {
     9: ||V---->        for (int i=0; i<m; i++) {
    10: |||               s[i] += A[j*m*o+i*o+k];
    11: ||V----         }
    12: |U-----       }
    13: |             // sum up B
    14: |V----->      for (int i=0; i<m; i++) {
    15: ||              B[j*m+i] += s[i];
    16: |V-----       }
    17: +------     }
    18:           }


