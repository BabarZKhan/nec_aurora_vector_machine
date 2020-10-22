NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:16:14 2019
FILE NAME: vec1.c

FUNCTION NAME: do_comp
DIAGNOSTIC LIST

 LINE              DIAGNOSTIC MESSAGE

     4: opt(1592): Outer loop unrolled inside inner loop.: i
     9: err( 504): The number of VLOAD, VSTORE.:  4,  0.
     9: vec( 101): Vectorized loop.
     9: err( 504): The number of VLOAD, VSTORE.:  1,  0.
     9: err( 505): The number of VGT,   VSC.   :  0,  0.
    10: vec( 126): Idiom detected.: Sum


NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:16:14 2019
FILE NAME: vec1.c

FUNCTION NAME: do_comp
FORMAT LIST

 LINE   LOOP      STATEMENT

     1:           void do_comp(int m, int n, int o, double* A, double* B) {
     2:            
     3: +------>    for (int j=0; j<n; j++) {
     4: |U----->      for (int i=0; i<m; i++) {
     5: ||              // use the shortloop compiler directive to inform the compiler
     6: ||              // that the next loop is shorter than 256 such that it can generate the appropriate
     7: ||              // reduction instructions
     8: ||              #pragma _NEC shortloop
     9: ||V---->        for (int k=0; k<o; k++) {
    10: |||               B[j*m+i] += A[j*m*o+i*o+k];
    11: ||V----         }
    12: |U-----       }
    13: +------     }
    14:           }


