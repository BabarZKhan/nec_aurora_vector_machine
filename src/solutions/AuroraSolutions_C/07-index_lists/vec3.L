NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:10:42 2019
FILE NAME: vec3.c

FUNCTION NAME: do_comp
DIAGNOSTIC LIST

 LINE              DIAGNOSTIC MESSAGE

    23: vec( 101): Vectorized loop.
    23: err( 504): The number of VLOAD, VSTORE.:  1,  2.
    23: err( 505): The number of VGT,   VSC.   :  0,  0.
    26: opt(1019): Feedback of scalar value from one loop pass to another.: midx
    38: vec( 101): Vectorized loop.
    38: err( 504): The number of VLOAD, VSTORE.:  2,  0.
    38: err( 505): The number of VGT,   VSC.   :  2,  1.
    43: err( 507): VSC generated
    43: err( 506): VGT generated


NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:10:42 2019
FILE NAME: vec3.c

FUNCTION NAME: do_comp
FORMAT LIST

 LINE   LOOP      STATEMENT

     6:           void do_comp(double* A,double* B) {
     7:           
     8:             const double barr = 0.01;
     9:             const double maxibarr = barr*maxi;
    10:             // introduce static index list for i and j as it only depends on A and A does not change
    11:             static int midx ;
    12:             static int* idxlist = NULL;
    13:             static int* jdxlist = NULL;
    14:             static bool needlist = true;
    15:           
    16:             if (needlist) {
    17:               needlist = false;
    18:               idxlist = (int*) malloc(n*m*sizeof(int));
    19:               jdxlist = (int*) malloc(n*m*sizeof(int));
    20:               midx = 0;
    21: +------>      for (int j=0; j<n; j++) {
    22: |               #pragma _NEC ivdep
    23: |V----->        for (int i=0; i<m; i++) {
    24: ||                //build index list for everything that meets the condition
    25: ||                if (A[j*m+i] < maxibarr) {
    26: ||                  idxlist[midx] = i;
    27: ||                  jdxlist[midx] = j;
    28: ||                  midx++;
    29: ||                }
    30: |V-----         }
    31: +------       }
    32:             }
    33:            
    34:             // apply the conditional operation via index listing
    35:             // Directive to tell compiler that an index does not appear twice
    36:             // (injective list)
    37:             #pragma _NEC ivdep
    38: V------>    for (int lidx=0; lidx<midx; lidx++) {
    39: |             int i = idxlist[lidx];
    40: |             int j = jdxlist[lidx];
    41: |             int idx = j*m+i;
    42: |             // apply complicated operation
    43: |       G     B[idx] += A[idx]*(B[idx]+1.0)/(A[idx] + B[idx] + 1.0);
    44: V------     }
    45:           
    46:           }


