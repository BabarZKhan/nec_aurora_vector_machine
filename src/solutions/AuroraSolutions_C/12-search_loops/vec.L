NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:14:11 2019
FILE NAME: vec.c

FUNCTION NAME: do_comp_extensive
DIAGNOSTIC LIST

 LINE              DIAGNOSTIC MESSAGE

     7: opt(1097): This statement prevents loop optimization.
     8: vec( 101): Vectorized loop.
     8: err( 504): The number of VLOAD, VSTORE.:  1,  1.
     8: err( 505): The number of VGT,   VSC.   :  0,  0.
    14: vec( 101): Vectorized loop.
    14: err( 504): The number of VLOAD, VSTORE.:  2,  1.
    14: err( 505): The number of VGT,   VSC.   :  0,  0.
    21: vec( 101): Vectorized loop.
    21: err( 504): The number of VLOAD, VSTORE.:  2,  1.
    21: err( 505): The number of VGT,   VSC.   :  0,  0.


NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:14:11 2019
FILE NAME: vec.c

FUNCTION NAME: do_comp_extensive
FORMAT LIST

 LINE   LOOP      STATEMENT

     3:           void do_comp_extensive(double* A, double* B) {
     4:           
     5: +------>    for (int j=0; j<n; j++) {
     6: |             // initialize with the first element
     7: |             double a_s[m];
     8: |V----->      for (int i=0; i<m; i++) {
     9: ||              a_s[i] = A[j*m*o+i*o];
    10: |V-----       }
    11: |             // search can start from 1 because [0] is already in a_s
    12: |             // exchange i and k loop to vectorize over i
    13: |+----->      for (int k=1; k<o; k++) {
    14: ||V---->        for (int i=0; i<m; i++) {
    15: |||               if (A[j*o*m+i*o+k] > a_s[i]) a_s[i] = A[j*o*m+i*o+k];
    16: ||V----         }
    17: |+-----       }
    18: |         
    19: |             // separate work loop from search
    20: |             //apply computation in vectorized form
    21: |V----->      for (int i=0; i<m; i++) {
    22: ||              B[j*m+i] -= a_s[i];
    23: |V-----       }
    24: +------     }
    25:           }


NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:14:11 2019
FILE NAME: vec.c

FUNCTION NAME: do_comp_boolmask
DIAGNOSTIC LIST

 LINE              DIAGNOSTIC MESSAGE

    31: opt(1097): This statement prevents loop optimization.
    32: vec( 101): Vectorized loop.
    32: err( 504): The number of VLOAD, VSTORE.:  0,  1.
    32: err( 505): The number of VGT,   VSC.   :  0,  0.
    35: vec( 101): Vectorized loop.
    35: err( 504): The number of VLOAD, VSTORE.:  2,  1.
    35: err( 505): The number of VGT,   VSC.   :  0,  0.
    37: opt(1019): Feedback of scalar value from one loop pass to another.: k_s
    48: vec( 101): Vectorized loop.
    48: err( 504): The number of VLOAD, VSTORE.:  2,  1.
    48: err( 505): The number of VGT,   VSC.   :  1,  0.
    49: err( 506): VGT generated


NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:14:11 2019
FILE NAME: vec.c

FUNCTION NAME: do_comp_boolmask
FORMAT LIST

 LINE   LOOP      STATEMENT

    27:           void do_comp_boolmask(double* A, double* B, double* C, double* L) {
    28:           
    29: +------>    for (int j=0; j<n; j++) {
    30: |             // promote k_s to an array and init with -1
    31: |             int k_s[m];
    32: |V=====>      for (int i=0; i<m; i++) k_s[i] = -1;
    33: |             // pull out k-loop
    34: |+----->      for (int k=0; k<o; k++) {
    35: ||V---->        for (int i=0; i<m; i++) {
    36: |||               // only do stuff if not found yet
    37: |||               if (k_s[i] == -1) {
    38: |||                 // perform check
    39: |||                 int idx = j*m+i;
    40: |||                 if (C[idx] > L[k]) {
    41: |||                   // save element
    42: |||                   k_s[i] = k;
    43: |||                 }
    44: |||               }
    45: ||V----         }
    46: |+-----       }
    47: |         
    48: |V----->      for (int i=0; i<m; i++) {
    49: ||      G       B[j*m+i] += A[j*o*m+i*o+k_s[i]];
    50: |V-----       }
    51: +------     }
    52:           }


NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:14:11 2019
FILE NAME: vec.c

FUNCTION NAME: do_comp_indexlist
DIAGNOSTIC LIST

 LINE              DIAGNOSTIC MESSAGE

    59: vec( 101): Vectorized loop.
    59: err( 504): The number of VLOAD, VSTORE.:  0,  1.
    59: err( 505): The number of VGT,   VSC.   :  0,  0.
    62: vec( 101): Vectorized loop.
    62: err( 504): The number of VLOAD, VSTORE.:  0,  1.
    62: err( 505): The number of VGT,   VSC.   :  0,  0.
    71: vec( 101): Vectorized loop.
    71: err( 504): The number of VLOAD, VSTORE.:  1,  1.
    71: err( 505): The number of VGT,   VSC.   :  1,  1.
    75: err( 506): VGT generated
    78: opt(1060): Use "nolstval" directive if possible.
    78: opt(1059): Unable to determine last value of scalar temporary.: k_s
    78: err( 507): VSC generated
    82: opt(1019): Feedback of scalar value from one loop pass to another.: midx_new
    89: vec( 101): Vectorized loop.
    89: err( 504): The number of VLOAD, VSTORE.:  2,  1.
    89: err( 505): The number of VGT,   VSC.   :  1,  0.
    90: err( 506): VGT generated


NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:14:11 2019
FILE NAME: vec.c

FUNCTION NAME: do_comp_indexlist
FORMAT LIST

 LINE   LOOP      STATEMENT

    54:           void do_comp_indexlist(double* A, double* B, double* C, double* L) {
    55:           
    56: +------>    for (int j=0; j<n; j++) {
    57: |             // create an initial index list
    58: |             int idxlist[m];
    59: |V=====>      for (int i=0; i<m; i++) idxlist[i] = i;
    60: |             // set k_s to -1 to indicate no success yet
    61: |             int k_s[m];
    62: |V=====>      for (int i=0; i<m; i++) k_s[i] = -1;
    63: |             // last entry in index list is at m-1
    64: |             // because the index list is completely full
    65: |             int midx = m;
    66: |             // pull out k-loop
    67: |+----->      for (int k=0; k<o; k++) {
    68: ||              int midx_new = 0;
    69: ||              // ensure compiler the uniqueness of entries in the index list
    70: ||              #pragma _NEC ivdep
    71: ||V---->        for (int lidx=0; lidx<midx; lidx++) {
    72: |||               int i = idxlist[lidx];
    73: |||               int idx = j*m+i;
    74: |||               // perform check
    75: |||     G         if (C[idx] > L[k]) {
    76: |||                 // if true: search successfull
    77: |||                 // i will not be part of the new index list
    78: |||     C           k_s[i] = k;
    79: |||               } else {
    80: |||                 // if false: search still not successfull
    81: |||                 // i will be part of the new index list
    82: |||                 idxlist[midx_new++] = i;
    83: |||               }
    84: ||V----         }
    85: ||              // transfer length of new index list
    86: ||              midx = midx_new;
    87: |+-----       }
    88: |         
    89: |V----->      for (int i=0; i<m; i++) {
    90: ||      G       B[j*m+i] += A[j*o*m+i*o+k_s[i]];
    91: |V-----       }
    92: +------     }
    93:           }


