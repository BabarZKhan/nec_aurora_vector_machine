NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:14:01 2019
FILE NAME: vec.c

FUNCTION NAME: do_comp_extensive
DIAGNOSTIC LIST

 LINE              DIAGNOSTIC MESSAGE

     6: vec( 101): Vectorized loop.
     6: err( 504): The number of VLOAD, VSTORE.:  2,  1.
     6: err( 505): The number of VGT,   VSC.   :  0,  0.
     8: vec( 101): Vectorized loop.
     8: err( 504): The number of VLOAD, VSTORE.:  1,  0.
     8: err( 505): The number of VGT,   VSC.   :  0,  0.
     9: vec( 126): Idiom detected.: Max/Min


NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:14:01 2019
FILE NAME: vec.c

FUNCTION NAME: do_comp_extensive
FORMAT LIST

 LINE   LOOP      STATEMENT

     3:           void do_comp_extensive(double* A, double* B) {
     4:           
     5: +------>    for (int j=0; j<n; j++) {
     6: |V----->      for (int i=0; i<m; i++) {
     7: ||              double a_s = A[j*m*o+i*o];
     8: ||V---->        for (int k=1; k<o; k++) {
     9: |||               if (A[j*o*m+i*o+k] > a_s) a_s = A[j*o*m+i*o+k];
    10: ||V----         }
    11: ||              B[j*m+i] -= a_s;
    12: |V-----       }
    13: +------     }
    14:           }


NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:14:01 2019
FILE NAME: vec.c

FUNCTION NAME: do_comp_boolmask
DIAGNOSTIC LIST

 LINE              DIAGNOSTIC MESSAGE

    20: vec( 101): Vectorized loop.
    20: err( 504): The number of VLOAD, VSTORE.:  2,  1.
    20: err( 505): The number of VGT,   VSC.   :  1,  0.
    22: vec( 101): Vectorized loop.
    22: err( 504): The number of VLOAD, VSTORE.:  1,  0.
    22: err( 505): The number of VGT,   VSC.   :  0,  0.
    24: vec( 126): Idiom detected.: Search
    29: err( 506): VGT generated


NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:14:01 2019
FILE NAME: vec.c

FUNCTION NAME: do_comp_boolmask
FORMAT LIST

 LINE   LOOP      STATEMENT

    16:           void do_comp_boolmask(double* A, double* B, double* C, double* L) {
    17:           
    18: +------>    for (int j=0; j<n; j++) {
    19: |             int k_s;
    20: |V----->      for (int i=0; i<m; i++) {
    21: ||              k_s = o-1;
    22: ||V---->        for (int k=0; k<o; k++) {
    23: |||               int idx = j*m+i;
    24: |||               if (C[idx] > L[k]) {
    25: |||                 k_s = k;
    26: |||                 break;
    27: |||               }
    28: ||V----         }
    29: ||      G       B[j*m+i] += A[j*o*m+i*o+k_s];
    30: |V-----       }
    31: +------     }
    32:           }


NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:14:01 2019
FILE NAME: vec.c

FUNCTION NAME: do_comp_indexlist
DIAGNOSTIC LIST

 LINE              DIAGNOSTIC MESSAGE

    38: vec( 101): Vectorized loop.
    38: err( 504): The number of VLOAD, VSTORE.:  2,  1.
    38: err( 505): The number of VGT,   VSC.   :  1,  0.
    40: vec( 101): Vectorized loop.
    40: err( 504): The number of VLOAD, VSTORE.:  1,  0.
    40: err( 505): The number of VGT,   VSC.   :  0,  0.
    42: vec( 126): Idiom detected.: Search
    47: err( 506): VGT generated


NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:14:01 2019
FILE NAME: vec.c

FUNCTION NAME: do_comp_indexlist
FORMAT LIST

 LINE   LOOP      STATEMENT

    34:           void do_comp_indexlist(double* A, double* B, double* C, double* L) {
    35:           
    36: +------>    for (int j=0; j<n; j++) {
    37: |             int k_s;
    38: |V----->      for (int i=0; i<m; i++) {
    39: ||              k_s = o-1;
    40: ||V---->        for (int k=0; k<o; k++) {
    41: |||               int idx = j*m+i;
    42: |||               if (C[idx] > L[k]) {
    43: |||                 k_s = k;
    44: |||                 break;
    45: |||               }
    46: ||V----         }
    47: ||      G       B[j*m+i] += A[j*o*m+i*o+k_s];
    48: |V-----       }
    49: +------     }
    50:           }


