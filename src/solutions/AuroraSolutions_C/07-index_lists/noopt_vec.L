NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:10:39 2019
FILE NAME: vec.c

FUNCTION NAME: do_comp
DIAGNOSTIC LIST

 LINE              DIAGNOSTIC MESSAGE

    10: vec( 101): Vectorized loop.
    10: err( 504): The number of VLOAD, VSTORE.:  2,  1.
    10: err( 505): The number of VGT,   VSC.   :  0,  0.


NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:10:39 2019
FILE NAME: vec.c

FUNCTION NAME: do_comp
FORMAT LIST

 LINE   LOOP      STATEMENT

     4:           void do_comp(double* A,double* B) {
     5:           
     6:             const double barr = 0.01;
     7:             const double maxibarr = maxi*barr;
     8:           
     9: +------>    for (int j=0; j<n; j++) {
    10: |V----->      for (int i=0; i<m; i++) {
    11: ||              int idx = j*m+i;
    12: ||              if (A[idx] < maxibarr) {
    13: ||                B[idx] += A[idx]*(B[idx]+1.0)/(A[idx] + B[idx] + 1.0);
    14: ||              }
    15: |V-----       }
    16: +------     }
    17:           
    18:           }


