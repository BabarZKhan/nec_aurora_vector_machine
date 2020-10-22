NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:16:01 2019
FILE NAME: vec.c

FUNCTION NAME: do_comp
DIAGNOSTIC LIST

 LINE              DIAGNOSTIC MESSAGE

     4: opt(1592): Outer loop unrolled inside inner loop.: i
     5: err( 504): The number of VLOAD, VSTORE.:  4,  0.
     5: vec( 101): Vectorized loop.
     5: err( 504): The number of VLOAD, VSTORE.:  1,  0.
     5: err( 505): The number of VGT,   VSC.   :  0,  0.
     6: vec( 126): Idiom detected.: Sum


NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:16:01 2019
FILE NAME: vec.c

FUNCTION NAME: do_comp
FORMAT LIST

 LINE   LOOP      STATEMENT

     1:           void do_comp(int m, int n, int o, double* A, double* B) {
     2:            
     3: +------>    for (int j=0; j<n; j++) {
     4: |U----->      for (int i=0; i<m; i++) {
     5: ||V---->        for (int k=0; k<o; k++) {
     6: |||               B[j*m+i] += A[j*m*o+i*o+k];
     7: ||V----         }
     8: |U-----       }
     9: +------     }
    10:           }


