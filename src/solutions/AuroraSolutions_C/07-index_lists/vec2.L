NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:10:42 2019
FILE NAME: vec2.c

FUNCTION NAME: do_comp
DIAGNOSTIC LIST

 LINE              DIAGNOSTIC MESSAGE

    17: vec( 101): Vectorized loop.
    17: err( 504): The number of VLOAD, VSTORE.:  1,  2.
    17: err( 505): The number of VGT,   VSC.   :  0,  0.
    20: opt(1019): Feedback of scalar value from one loop pass to another.: midx
    31: vec( 101): Vectorized loop.
    31: err( 504): The number of VLOAD, VSTORE.:  2,  0.
    31: err( 505): The number of VGT,   VSC.   :  2,  1.
    36: err( 507): VSC generated
    36: err( 506): VGT generated


NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:10:42 2019
FILE NAME: vec2.c

FUNCTION NAME: do_comp
FORMAT LIST

 LINE   LOOP      STATEMENT

     4:           void do_comp(double* A,double* B) {
     5:           
     6:             const double barr = 0.01;
     7:             const double maxibarr = barr*maxi;
     8:             // introduce index list for i and j
     9:             int midx ;
    10:             int idxlist[m*n];
    11:             int jdxlist[m*n];
    12:            
    13:           
    14:             midx = 0;
    15: +------>    for (int j=0; j<n; j++) {
    16: |             #pragma _NEC ivdep
    17: |V----->      for (int i=0; i<m; i++) {
    18: ||              //build index list for everything that meets the condition
    19: ||              if (A[j*m+i] < maxibarr) {
    20: ||                idxlist[midx] = i;
    21: ||                jdxlist[midx] = j;
    22: ||                midx++;
    23: ||              }
    24: |V-----       }
    25: +------     }
    26:            
    27:             // apply the conditional operation via index listing
    28:             // Directive to tell compiler that an index does not appear twice
    29:             // (injective list)
    30:             #pragma _NEC ivdep
    31: V------>    for (int lidx=0; lidx<midx; lidx++) {
    32: |             int i = idxlist[lidx];
    33: |             int j = jdxlist[lidx];
    34: |             int idx = j*m+i;
    35: |             // apply complicated operation
    36: |       G     B[idx] += A[idx]*(B[idx]+1.0)/(A[idx] + B[idx] + 1.0);
    37: V------     }
    38:           
    39:           }


