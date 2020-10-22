NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:13:59 2019
FILE NAME: vec.c

FUNCTION NAME: do_comp_boolmask
DIAGNOSTIC LIST

 LINE              DIAGNOSTIC MESSAGE

    13: vec( 110): Vectorization obstructive function reference.: compute_maxval_i
    13: vec( 110): Vectorization obstructive function reference.: compute_minval_i
    19: opt(1025): Reference to this function inhibits optimization.: compute_minval_i
    19: vec( 101): Vectorized loop.
    19: err( 504): The number of VLOAD, VSTORE.:  2,  2.
    19: err( 505): The number of VGT,   VSC.   :  0,  0.
    23: opt(1019): Feedback of scalar value from one loop pass to another.: B
    23: vec( 128): Fused multiply-add operation applied.
    29: vec( 101): Vectorized loop.
    29: err( 504): The number of VLOAD, VSTORE.:  3,  2.
    29: err( 505): The number of VGT,   VSC.   :  0,  0.
    35: opt(1019): Feedback of scalar value from one loop pass to another.: B
    35: vec( 128): Fused multiply-add operation applied.
    44: vec( 101): Vectorized loop.
    44: err( 504): The number of VLOAD, VSTORE.:  2,  0.
    44: err( 505): The number of VGT,   VSC.   :  1,  1.
    48: opt(1033): Potential multiple store conflict -- use directive if OK.: C
    48: opt(1036): Potential feedback - use directive or compiler option if OK.: C
    48: err( 507): VSC generated
    48: err( 506): VGT generated


NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:13:59 2019
FILE NAME: vec.c

FUNCTION NAME: do_comp_boolmask
FORMAT LIST

 LINE   LOOP      STATEMENT

    10:           void do_comp_boolmask(double* A, double* B, double* C, int* L, char* ftraceident) {
    11:           
    12:             ftrace_region_begin(ftraceident);
    13: +------>    for (int j=0; j<n; j++) {
    14: |             // determine minimal value and maximal value of L for a given j
    15: |             int kmin = compute_minval_i(j, L);
    16: |             int kmax = compute_maxval_i(j, L);
    17: |             // pull out k-loop and execute only for cases where every i has a k
    18: |+----->      for (int k=0; k<kmin; k++) {
    19: ||V---->        for (int i=0; i<m; i++) {
    20: |||               int idx = j*m+i;
    21: |||               int idx2 = j*m*o+i*o;
    22: |||               int idx3 = j*m*(o+1)+i*(o+1);
    23: |||     F         B[idx] += sqrt((k+1)*B[idx]) * exp(sin(A[idx2+k]));
    24: |||               C[idx3+k] = B[idx] * A[idx2+k];
    25: ||V----         }
    26: |+-----       }
    27: |             // pull out k-loop and execute all other cases
    28: |+----->      for (int k=kmin; k<kmax; k++) {
    29: ||V---->        for (int i=0; i<m; i++) {
    30: |||               int idx = j*m+i;
    31: |||               // use a boolean mask to only work on the cases, where it is required
    32: |||               if (k < L[idx]) {
    33: |||                 int idx2 = j*m*o+i*o;
    34: |||                 int idx3 = j*m*(o+1)+i*(o+1);
    35: |||     F           B[idx] += sqrt((k+1)*B[idx]) * exp(sin(A[idx2+k]));
    36: |||                 C[idx3+k] = B[idx] * A[idx2+k];
    37: |||               }
    38: ||V----         }
    39: |+-----       }
    40: +------     }
    41:           
    42: +------>    for (int j=0; j<n; j++) {
    43: |             #pragma _NEC ivdep
    44: |V----->      for (int i=0; i<m; i++) {
    45: ||              int idx = j*m+i;
    46: ||              int idx3 = j*m*(o+1)+i*(o+1);
    47: ||              int lij = L[idx];
    48: ||      G       C[idx3+lij] = C[idx3 +lij-1] + sqrt(B[idx]);
    49: |V-----       }
    50: +------     }
    51:             ftrace_region_end(ftraceident);
    52:           
    53:           }


NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:13:59 2019
FILE NAME: vec.c

FUNCTION NAME: do_comp_static_idxlist
DIAGNOSTIC LIST

 LINE              DIAGNOSTIC MESSAGE

    58: vec( 110): Vectorization obstructive function reference.: compute_maxval_i
    58: vec( 110): Vectorization obstructive function reference.: compute_minval_i
    63: opt(1025): Reference to this function inhibits optimization.: compute_minval_i
    67: vec( 101): Vectorized loop.
    67: err( 504): The number of VLOAD, VSTORE.:  1,  1.
    67: err( 505): The number of VGT,   VSC.   :  0,  0.
    69: opt(1033): Potential multiple store conflict -- use directive if OK.: idxlist
    69: opt(1019): Feedback of scalar value from one loop pass to another.: midx_tmp
    79: vec( 101): Vectorized loop.
    79: err( 504): The number of VLOAD, VSTORE.:  2,  2.
    79: err( 505): The number of VGT,   VSC.   :  0,  0.
    83: opt(1019): Feedback of scalar value from one loop pass to another.: B
    83: vec( 128): Fused multiply-add operation applied.
    90: vec( 103): Unvectorized loop.
    90: vec( 113): Overhead of loop division is too large.
    92: vec( 101): Vectorized loop.
    92: err( 504): The number of VLOAD, VSTORE.:  1,  0.
    92: err( 505): The number of VGT,   VSC.   :  3,  2.
    97: opt(1036): Potential feedback - use directive or compiler option if OK.: B
    97: vec( 128): Fused multiply-add operation applied.
    97: err( 507): VSC generated
    97: err( 506): VGT generated
    98: opt(1033): Potential multiple store conflict -- use directive if OK.: C
    98: err( 507): VSC generated
    98: err( 506): VGT generated
   105: vec( 101): Vectorized loop.
   105: err( 504): The number of VLOAD, VSTORE.:  2,  0.
   105: err( 505): The number of VGT,   VSC.   :  1,  1.
   109: opt(1033): Potential multiple store conflict -- use directive if OK.: C
   109: opt(1036): Potential feedback - use directive or compiler option if OK.: C
   109: err( 507): VSC generated
   109: err( 506): VGT generated


NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:13:59 2019
FILE NAME: vec.c

FUNCTION NAME: do_comp_static_idxlist
FORMAT LIST

 LINE   LOOP      STATEMENT

    55:           void do_comp_static_idxlist(double* A, double* B, double* C, int* L, char* ftraceident) {
    56:           
    57:             ftrace_region_begin(ftraceident);
    58: +------>    for (int j=0; j<n; j++) {
    59: |             // precompute entire index list for every value of k
    60: |             // (where it is required)
    61: |             int kmin = compute_minval_i(j, L);
    62: |             int kmax = compute_maxval_i(j, L);
    63: |             int midx[o];
    64: |             double idxlist[m*o];
    65: |+----->      for (int k=kmin; k<kmax; k++) {
    66: ||              int midx_tmp = 0;
    67: ||V---->        for (int i=0; i<m; i++) {
    68: |||               if (k < L[j*m+i]) {
    69: |||                 idxlist[k*m+midx_tmp] = i;
    70: |||                 midx_tmp++;
    71: |||               }
    72: ||V----         }
    73: ||              midx[k] = midx_tmp;
    74: |+-----       }
    75: |          
    76: |             // push k-loop out of i-loop
    77: |             // execute k-loop where no condition is needed
    78: |+----->      for (int k=0; k<kmin; k++) {
    79: ||V---->        for (int i=0; i<m; i++) {
    80: |||               int idx = j*m+i;
    81: |||               int idx2 = j*m*o+i*o;
    82: |||               int idx3 = j*m*(o+1)+i*(o+1);
    83: |||     F         B[idx] += sqrt((k+1)*B[idx]) * exp(sin(A[idx2+k]));
    84: |||               C[idx3+k] = B[idx] * A[idx2+k];
    85: ||V----         }
    86: |+-----       }
    87: |         
    88: |             // Push k-loop out of i-loop
    89: |             // execute rest of the k-loop utilizing the index list.
    90: |+----->      for (int k=kmin; k<kmax; k++) {
    91: ||              #pragma _NEC ivdep
    92: ||V---->        for (int lidx=0; lidx<midx[k]; lidx++) {
    93: |||               int i = idxlist[k*m+lidx];
    94: |||               int idx = j*m+i;
    95: |||               int idx2 = j*m*o+i*o;
    96: |||               int idx3 = j*m*(o+1)+i*(o+1);
    97: |||     G         B[idx] += sqrt((k+1)*B[idx]) * exp(sin(A[idx2+k]));
    98: |||     G         C[idx3+k] = B[idx] * A[idx2+k];
    99: ||V----         }
   100: |+-----       }
   101: +------     }
   102:           
   103: +------>    for (int j=0; j<n; j++) {
   104: |             #pragma _NEC ivdep
   105: |V----->      for (int i=0; i<m; i++) {
   106: ||              int idx = j*m+i;
   107: ||              int idx3 = j*m*(o+1)+i*(o+1);
   108: ||              int lij = L[idx];
   109: ||      G       C[idx3+lij] = C[idx3 +lij-1] + sqrt(B[idx]);
   110: |V-----       }
   111: +------     }
   112:             ftrace_region_end(ftraceident);
   113:           
   114:           }


NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:13:59 2019
FILE NAME: vec.c

FUNCTION NAME: do_comp_dynamic_idxlist
DIAGNOSTIC LIST

 LINE              DIAGNOSTIC MESSAGE

   119: vec( 110): Vectorization obstructive function reference.: compute_minval_i
   124: opt(1025): Reference to this function inhibits optimization.: compute_minval_i
   124: vec( 101): Vectorized loop.
   124: err( 504): The number of VLOAD, VSTORE.:  2,  2.
   124: err( 505): The number of VGT,   VSC.   :  0,  0.
   128: opt(1019): Feedback of scalar value from one loop pass to another.: B
   128: vec( 128): Fused multiply-add operation applied.
   136: vec( 101): Vectorized loop.
   136: err( 504): The number of VLOAD, VSTORE.:  1,  1.
   136: err( 505): The number of VGT,   VSC.   :  0,  0.
   138: opt(1019): Feedback of scalar value from one loop pass to another.: midx
   143: opt(1082): Backward transfers inhibit loop optimization.
   147: vec( 101): Vectorized loop.
   147: err( 504): The number of VLOAD, VSTORE.:  1,  1.
   147: err( 505): The number of VGT,   VSC.   :  4,  2.
   153: vec( 128): Fused multiply-add operation applied.
   153: err( 507): VSC generated
   153: err( 506): VGT generated
   154: err( 507): VSC generated
   154: err( 506): VGT generated
   156: err( 506): VGT generated
   158: opt(1019): Feedback of scalar value from one loop pass to another.: midx_tmp
   168: vec( 101): Vectorized loop.
   168: err( 504): The number of VLOAD, VSTORE.:  2,  0.
   168: err( 505): The number of VGT,   VSC.   :  1,  1.
   172: opt(1033): Potential multiple store conflict -- use directive if OK.: C
   172: opt(1036): Potential feedback - use directive or compiler option if OK.: C
   172: err( 507): VSC generated
   172: err( 506): VGT generated


NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:13:59 2019
FILE NAME: vec.c

FUNCTION NAME: do_comp_dynamic_idxlist
FORMAT LIST

 LINE   LOOP      STATEMENT

   116:           void do_comp_dynamic_idxlist(double* A, double* B, double* C, int* L, char* ftraceident) {
   117:           
   118:             ftrace_region_begin(ftraceident);
   119: +------>    for (int j=0; j<n; j++) {
   120: |             // determine minimal value and maximal value of L for a given j
   121: |             int kmin = compute_minval_i(j, L);
   122: |             // pull out k-loop and execute only for cases where every i has a k
   123: |+----->      for (int k=0; k<kmin; k++) {
   124: ||V---->        for (int i=0; i<m; i++) {
   125: |||               int idx = j*m+i;
   126: |||               int idx2 = j*m*o+i*o;
   127: |||               int idx3 = j*m*(o+1)+i*(o+1);
   128: |||     F         B[idx] += sqrt((k+1)*B[idx]) * exp(sin(A[idx2+k]));
   129: |||               C[idx3+k] = B[idx] * A[idx2+k];
   130: ||V----         }
   131: |+-----       }
   132: |         
   133: |             // initialize index list
   134: |             int midx = 0;
   135: |             int idxlist[m];
   136: |V----->      for (int i=0; i<m; i++) {
   137: ||              if (L[j*m+i] > kmin) {
   138: ||                idxlist[midx++] = i;
   139: ||              }
   140: |V-----       }
   141: |         
   142: |             int k = kmin;
   143: |+----->      while (midx > 0) {
   144: ||              int midx_tmp = 0;
   145: ||              // use index list
   146: ||              #pragma _NEC ivdep
   147: ||V---->        for (int lidx=0; lidx<midx; lidx++) {
   148: |||               int i = idxlist[lidx];
   149: |||               int idx = j*m+i;
   150: |||               int idx2 = j*m*o+i*o;
   151: |||               int idx3 = j*m*(o+1)+i*(o+1);
   152: |||               // perform the operation
   153: |||     G         B[idx] += sqrt((k+1)*B[idx]) * exp(sin(A[idx2+k]));
   154: |||     G         C[idx3+k] = B[idx] * A[idx2+k];
   155: |||               // check if i needs to be included in the list again
   156: |||     G         if (k < L[idx]-1) {
   157: |||                 // rebuild index list
   158: |||                 idxlist[midx_tmp++] = i;
   159: |||               }
   160: ||V----         }
   161: ||              midx = midx_tmp;
   162: ||              k++;
   163: |+-----       }
   164: +------     }
   165:           
   166: +------>    for (int j=0; j<n; j++) {
   167: |             #pragma _NEC ivdep
   168: |V----->      for (int i=0; i<m; i++) {
   169: ||              int idx = j*m+i;
   170: ||              int idx3 = j*m*(o+1)+i*(o+1);
   171: ||              int lij = L[idx];
   172: ||      G       C[idx3+lij] = C[idx3 +lij-1] + sqrt(B[idx]);
   173: |V-----       }
   174: +------     }
   175:             ftrace_region_end(ftraceident);
   176:           }


NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:13:59 2019
FILE NAME: vec.c

FUNCTION NAME: compute_minval_i
DIAGNOSTIC LIST

 LINE              DIAGNOSTIC MESSAGE

   182: vec( 101): Vectorized loop.
   182: err( 504): The number of VLOAD, VSTORE.:  1,  0.
   182: err( 505): The number of VGT,   VSC.   :  0,  0.
   184: vec( 126): Idiom detected.: Max/Min


NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:13:59 2019
FILE NAME: vec.c

FUNCTION NAME: compute_minval_i
FORMAT LIST

 LINE   LOOP      STATEMENT

   179:           int compute_minval_i(int j, int* arr) {
   180:             arr += j*m;
   181:             int minval = *arr;
   182: V------>    for (int i=1; i<m; i++) {
   183: |             arr++;
   184: |             minval = (*arr < minval) ? *arr : minval;
   185: V------     }
   186:             return minval;
   187:           }


NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:13:59 2019
FILE NAME: vec.c

FUNCTION NAME: compute_maxval_i
DIAGNOSTIC LIST

 LINE              DIAGNOSTIC MESSAGE

   192: vec( 101): Vectorized loop.
   192: err( 504): The number of VLOAD, VSTORE.:  1,  0.
   192: err( 505): The number of VGT,   VSC.   :  0,  0.
   194: vec( 126): Idiom detected.: Max/Min


NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:13:59 2019
FILE NAME: vec.c

FUNCTION NAME: compute_maxval_i
FORMAT LIST

 LINE   LOOP      STATEMENT

   189:           int compute_maxval_i(int j, int* arr) {
   190:             arr += j*m;
   191:             int maxval = *arr;
   192: V------>    for (int i=1; i<m; i++) {
   193: |             arr++;
   194: |             maxval = (*arr > maxval) ? *arr : maxval;
   195: V------     }
   196:             return maxval;
   197:           }


