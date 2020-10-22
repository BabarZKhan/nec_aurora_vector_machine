NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:11:31 2019
FILE NAME: vec.c

FUNCTION NAME: do_comp
DIAGNOSTIC LIST

 LINE              DIAGNOSTIC MESSAGE

    14: vec( 101): Vectorized loop.
    14: err( 504): The number of VLOAD, VSTORE.:  1,  2.
    14: err( 505): The number of VGT,   VSC.   :  0,  0.
    17: opt(1019): Feedback of scalar value from one loop pass to another.: midx
    26: vec( 103): Unvectorized loop.
    26: vec( 110): Vectorization obstructive function reference.: printf
    30: opt(1118): This I/O statement inhibits optimization of loop.
    38: vec( 101): Vectorized loop.
    38: err( 504): The number of VLOAD, VSTORE.:  3,  1.
    38: err( 505): The number of VGT,   VSC.   :  0,  0.


NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:11:31 2019
FILE NAME: vec.c

FUNCTION NAME: do_comp
FORMAT LIST

 LINE   LOOP      STATEMENT

     5:           void do_comp(double* A, double* B, double* C, double* D) {
     6:             double static const eps = 0.001;
     7:           
     8: +------>    for (int k=0; k<o; k++) {
     9: |             // build index list for special cases (e.g. warnings)
    10: |             int midx = 0;
    11: |             double idxlist[n*m], jdxlist[n*m];
    12: |+----->      for (int j=0; j<n; j++) {
    13: ||              #pragma _NEC ivdep
    14: ||V---->        for (int i=0; i<m; i++) {
    15: |||               int idx=j*m+i;
    16: |||               if (fabs(C[k] - D[idx]) < eps) {
    17: |||                 idxlist[midx] = i;
    18: |||                 jdxlist[midx] = j;
    19: |||                 midx++;
    20: |||               }
    21: ||V----         }
    22: |+-----       }
    23: |         
    24: |             // write warnings
    25: |             // still a scalar operation
    26: |+----->      for (int lidx=0; lidx<midx; lidx++) {
    27: ||              int i = idxlist[midx];
    28: ||              int j = jdxlist[midx];
    29: ||              int idx=j*m+i;
    30: ||              printf("WARNING: |C(k) - D(i,j)| < eps\n"
    31: ||                     "for i=%d,j=%d,k=%d\n"
    32: ||                     "and C[k] = %16.12f, D[j*m+i] = %16.12f\n", i, j, k, C[k], D[idx]);
    33: |+-----       }
    34: |         
    35: |             // execute operation utilizing a boolean mask
    36: |+----->      for (int j=0; j<n; j++) {
    37: ||              #pragma _NEC ivdep
    38: ||V---->        for (int i=0; i<m; i++) {
    39: |||               int idx=j*m+i;
    40: |||               // invert warning condition to execute computation
    41: |||               if (fabs(C[k] - D[idx]) >= eps) {
    42: |||                 B[idx] += A[idx] / (C[k] - D[idx]);
    43: |||               }
    44: ||V----         }
    45: |+-----       }
    46: +------     }
    47:           }


