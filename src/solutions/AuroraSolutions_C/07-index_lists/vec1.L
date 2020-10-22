NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:10:42 2019
FILE NAME: vec1.c

FUNCTION NAME: do_comp
DIAGNOSTIC LIST

 LINE              DIAGNOSTIC MESSAGE

    16: vec( 101): Vectorized loop.
    16: err( 504): The number of VLOAD, VSTORE.:  1,  1.
    16: err( 505): The number of VGT,   VSC.   :  0,  0.
    19: opt(1036): Potential feedback - use directive or compiler option if OK.: idxlist
    19: opt(1033): Potential multiple store conflict -- use directive if OK.: idxlist
    19: opt(1019): Feedback of scalar value from one loop pass to another.: midx
    27: vec( 101): Vectorized loop.
    27: err( 504): The number of VLOAD, VSTORE.:  1,  0.
    27: err( 505): The number of VGT,   VSC.   :  2,  1.
    31: opt(1036): Potential feedback - use directive or compiler option if OK.: B
    31: err( 507): VSC generated
    31: err( 506): VGT generated


NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:10:42 2019
FILE NAME: vec1.c

FUNCTION NAME: do_comp
FORMAT LIST

 LINE   LOOP      STATEMENT

     4:           void do_comp(double* A,double* B) {
     5:           
     6:             const double barr = 0.01;
     7:             const double maxibarr = barr*maxi;
     8:             // introduce index list for i of length n
     9:             int midx ;
    10:             int idxlist[m];
    11:            
    12:           
    13: +------>    for (int j=0; j<n; j++) {
    14: |             // build first index list for i
    15: |             midx = 0;
    16: |V----->      for (int i=0; i<m; i++) {
    17: ||              // build index list for everything that meets the condition
    18: ||              if (A[j*m+i] < maxibarr) {
    19: ||                idxlist[midx++] = i;
    20: ||              }
    21: |V-----       }
    22: |         
    23: |             // apply the conditional operation via index listing
    24: |             // directive to tell compiler that an index does not appear twice
    25: |             // (injective list)
    26: |             #pragma _NEC ivdep
    27: |V----->      for (int lidx=0; lidx<midx; lidx++) {
    28: ||              int i = idxlist[lidx];
    29: ||              int idx = j*m+i;
    30: ||              // apply complicated operation
    31: ||      G       B[idx] += A[idx]*(B[idx]+1.0)/(A[idx] + B[idx] + 1.0);
    32: |V-----       }
    33: +------     }
    34:           
    35:           }


