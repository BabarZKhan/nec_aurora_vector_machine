NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:11:45 2019
FILE NAME: vec.c

FUNCTION NAME: do_comp
DIAGNOSTIC LIST

 LINE              DIAGNOSTIC MESSAGE

     7: vec( 103): Unvectorized loop.
     7: vec( 113): Overhead of loop division is too large.
     9: opt(1082): Backward transfers inhibit loop optimization.
     9: vec( 103): Unvectorized loop.
     9: vec( 108): Unvectorizable loop structure.


NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:11:45 2019
FILE NAME: vec.c

FUNCTION NAME: do_comp
FORMAT LIST

 LINE   LOOP      STATEMENT

     3:           void do_comp(double* A, double* B) {
     4:             double static const max_val = 1000.0;
     5:           
     6: +------>    for (int j=0; j<n; j++) {
     7: |+----->      for (int i=0; i<m; i++) {
     8: ||              int idx = m*j+i;
     9: ||+---->        while (B[idx] < max_val){
    10: |||               B[idx] += A[idx];
    11: ||+----         }
    12: |+-----       }
    13: +------     }
    14:           }


