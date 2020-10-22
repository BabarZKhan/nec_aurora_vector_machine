NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:11:32 2019
FILE NAME: vec.c

FUNCTION NAME: do_comp
DIAGNOSTIC LIST

 LINE              DIAGNOSTIC MESSAGE

     5: opt(1589): Outer loop moved inside inner loop(s).: j
     5: vec( 101): Vectorized loop.
     5: err( 504): The number of VLOAD, VSTORE.:  2,  1.
     5: err( 505): The number of VGT,   VSC.   :  0,  0.
     6: vec( 103): Unvectorized loop.
     6: vec( 113): Overhead of loop division is too large.
     8: opt(1036): Potential feedback - use directive or compiler option if OK.: B
    12: opt(1589): Outer loop moved inside inner loop(s).: j
    12: vec( 101): Vectorized loop.
    12: err( 504): The number of VLOAD, VSTORE.:  2,  1.
    12: err( 505): The number of VGT,   VSC.   :  0,  0.
    13: vec( 103): Unvectorized loop.
    13: vec( 113): Overhead of loop division is too large.
    15: opt(1036): Potential feedback - use directive or compiler option if OK.: B


NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:11:32 2019
FILE NAME: vec.c

FUNCTION NAME: do_comp
FORMAT LIST

 LINE   LOOP      STATEMENT

     3:           void do_comp(double* A, double* B, int* ind1, int* ind2) {
     4:           
     5: X------>    for (int j=0; j<n; j++) {
     6: |*----->      for (int i=0; i<m; i++) {
     7: ||              int idx = j*m+i;
     8: ||              B[j*m+ind1[i]] += A[idx];
     9: |*-----       }
    10: X------     }
    11:            
    12: X------>    for (int j=0; j<n; j++) {
    13: |*----->      for (int i=0; i<m; i++) {
    14: ||              int idx = j*m+i;
    15: ||              B[j*m+ind2[i]] += A[idx];
    16: |*-----       }
    17: X------     }
    18:           
    19:           }


