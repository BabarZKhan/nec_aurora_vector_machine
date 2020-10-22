NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:10:42 2019
FILE NAME: vec4.c

FUNCTION NAME: do_comp
DIAGNOSTIC LIST

 LINE              DIAGNOSTIC MESSAGE

    20: vec( 101): Vectorized loop.
    20: err( 504): The number of VLOAD, VSTORE.:  1,  1.
    20: err( 505): The number of VGT,   VSC.   :  0,  0.
    23: opt(1019): Feedback of scalar value from one loop pass to another.: midx
    32: vec( 101): Vectorized loop.
    32: err( 504): The number of VLOAD, VSTORE.:  1,  0.
    32: err( 505): The number of VGT,   VSC.   :  2,  1.
    35: err( 507): VSC generated
    35: err( 506): VGT generated


NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:10:42 2019
FILE NAME: vec4.c

FUNCTION NAME: do_comp
FORMAT LIST

 LINE   LOOP      STATEMENT

     6:           void do_comp(double* A,double* B) {
     7:           
     8:             const double barr = 0.01;
     9:             const double maxibarr = barr*maxi;
    10:             // introduce static collapsed index list for i and j
    11:             // as it only depends on A and A does not change
    12:             static int midx ;
    13:             static int* idxlist = NULL;
    14:             static bool needlist = true;
    15:           
    16:             if (needlist) {
    17:               needlist = false;
    18:               idxlist = (int*) malloc(n*m*sizeof(int));
    19:               midx = 0;
    20: V------>      for (int i=0; i<m*n; i++) {
    21: |               //build index list for everything that meets the condition
    22: |               if (A[i] < maxibarr) {
    23: |                 idxlist[midx++] = i;
    24: |               }
    25: V------       }
    26:             }
    27:            
    28:             // apply the conditional operation via index listing
    29:             // Directive to tell compiler that an index does not appear twice
    30:             // (injective list)
    31:             #pragma _NEC ivdep
    32: V------>    for (int lidx=0; lidx<midx; lidx++) {
    33: |             int idx = idxlist[lidx];
    34: |             // apply complicated operation
    35: |       G     B[idx] += A[idx]*(B[idx]+1.0)/(A[idx] + B[idx] + 1.0);
    36: V------     }
    37:           
    38:           }


