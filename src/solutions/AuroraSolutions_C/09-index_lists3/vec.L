NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:11:44 2019
FILE NAME: vec.c

FUNCTION NAME: do_comp
DIAGNOSTIC LIST

 LINE              DIAGNOSTIC MESSAGE

     6: vec( 101): Vectorized loop.
     6: err( 504): The number of VLOAD, VSTORE.:  2,  1.
     6: err( 505): The number of VGT,   VSC.   :  0,  0.
    15: vec( 111): "novector" is specified.
    19: vec( 101): Vectorized loop.
    19: err( 504): The number of VLOAD, VSTORE.:  1,  0.
    19: err( 505): The number of VGT,   VSC.   :  0,  0.
    20: vec( 126): Idiom detected.: Sum


NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:11:44 2019
FILE NAME: vec.c

FUNCTION NAME: do_comp
FORMAT LIST

 LINE   LOOP      STATEMENT

     3:           void do_comp(double* A, double* B, int* ind1, int* ind2) {
     4:           
     5: +------>    for (int j=0; j<n; j++) {
     6: |V----->      for (int i=0; i<m; i++) {
     7: ||              // replace index list by direct indexing
     8: ||              int k = m-i-1;
     9: ||              B[j*m+k] += A[j*m+i];
    10: |V-----       }
    11: +------     }
    12:            
    13:             // prevent compiler from applying optimizations to the outermost loop
    14:             #pragma _NEC novector
    15: +------>    for (int j=0; j<n; j++) {
    16: |             // define a starting point for the innermost loop
    17: |+----->      for (int k=0; k<l; k++) {
    18: ||              // loop over everything l times, with stepwidth l and starting point k
    19: ||V---->        for (int i=k; i<m; i+=l) {
    20: |||               B[j*m+k] += A[j*m+i];
    21: ||V----         }
    22: |+-----       }
    23: +------     }
    24:           
    25:           }


