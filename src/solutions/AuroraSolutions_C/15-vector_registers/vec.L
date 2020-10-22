NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:15:12 2019
FILE NAME: vec.c

FUNCTION NAME: do_comp1
DIAGNOSTIC LIST

 LINE              DIAGNOSTIC MESSAGE

    10: vec( 130): Vector register is assigned.: vregc
    17: vec( 103): Unvectorized loop.
    17: vec( 113): Overhead of loop division is too large.
    21: vec( 101): Vectorized loop.
    21: err( 504): The number of VLOAD, VSTORE.:  1,  1.
    21: err( 505): The number of VGT,   VSC.   :  0,  0.
    22: err( 508): Replaced with vector register.: vregc
    27: vec( 101): Vectorized loop.
    27: err( 504): The number of VLOAD, VSTORE.:  2,  1.
    27: err( 505): The number of VGT,   VSC.   :  0,  0.
    29: err( 508): Replaced with vector register.: vregc
    29: vec( 128): Fused multiply-add operation applied.
    34: vec( 101): Vectorized loop.
    34: err( 504): The number of VLOAD, VSTORE.:  1,  1.
    34: err( 505): The number of VGT,   VSC.   :  0,  0.
    35: opt(1033): Potential multiple store conflict -- use directive if OK.: C
    35: err( 508): Replaced with vector register.: vregc


NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:15:12 2019
FILE NAME: vec.c

FUNCTION NAME: do_comp1
FORMAT LIST

 LINE   LOOP      STATEMENT

    10:           void do_comp1(double* A, double* C) {
    11:            
    12:             // create an array and assign it directly to the vector registers
    13:             double vregc[nreg];
    14:             #pragma _NEC vreg(vregc)
    15:           
    16:             // create an outer loopt to work on chunks, which fit into the vector registers
    17: +------>    for (int si=0; si<m; si+=nreg) {
    18: |             int se = MIN(si+nreg,m);
    19: |             // transfer array to the vector registers
    20: |             #pragma _NEC ivdep
    21: |V----->      for (int i=si; i<se; i++) {
    22: ||      V       vregc[i-si] = C[i];
    23: |V-----       }
    24: |             // perform computation and store the result in the vecor registers
    25: |             // thus minimizing loads
    26: |+----->      for (int j=0; j<n; j++) {
    27: ||V---->        for (int i=si; i<se; i++) {
    28: |||               int idx = j*m+i;
    29: |||     F         vregc[i-si] += A[idx]*A[idx];
    30: ||V----         }
    31: |+-----       }
    32: |             // copy the results back from the vector registers
    33: |             #pragma _NEC ivdep
    34: |V----->      for (int i=si; i<se; i++) {
    35: ||      V       C[i] = vregc[i-si];
    36: |V-----       }
    37: +------     }
    38:           }


NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:15:12 2019
FILE NAME: vec.c

FUNCTION NAME: do_comp2
DIAGNOSTIC LIST

 LINE              DIAGNOSTIC MESSAGE

    40: vec( 130): Vector register is assigned.: vregc
    47: vec( 103): Unvectorized loop.
    47: vec( 113): Overhead of loop division is too large.
    51: vec( 101): Vectorized loop.
    51: err( 504): The number of VLOAD, VSTORE.:  1,  1.
    51: err( 505): The number of VGT,   VSC.   :  0,  0.
    52: err( 508): Replaced with vector register.: vregc
    57: vec( 101): Vectorized loop.
    57: err( 504): The number of VLOAD, VSTORE.:  2,  1.
    57: err( 505): The number of VGT,   VSC.   :  0,  0.
    59: opt(1036): Potential feedback - use directive or compiler option if OK.: B
    59: err( 508): Replaced with vector register.: vregc
    59: vec( 128): Fused multiply-add operation applied.


NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:15:12 2019
FILE NAME: vec.c

FUNCTION NAME: do_comp2
FORMAT LIST

 LINE   LOOP      STATEMENT

    40:           void do_comp2(double* B,double* C) {
    41:           
    42:             // create an array and assign it directly to the vector registers
    43:             double vregc[nreg];
    44:             #pragma _NEC vreg(vregc)
    45:           
    46:             // create an outer loopt to work on chunks, which fit into the vector registers
    47: +------>    for (int si=0; si<m; si+=nreg) {
    48: |             int se = MIN(si+nreg,m);
    49: |             // transfer array to the vector registers
    50: |             #pragma _NEC ivdep
    51: |V----->      for (int i=si; i<se; i++) {
    52: ||      V       vregc[i-si] = C[i];
    53: |V-----       }
    54: |             // perform computation by repeatedly using the information stored in the vector registers
    55: |             // thus minimizing loads
    56: |+----->      for (int j=0; j<n; j++) {
    57: ||V---->        for (int i=si; i<se; i++) {
    58: |||               int idx = j*m+i;
    59: |||     F         B[idx] += vregc[i-si]*vregc[i-si];
    60: ||V----         }
    61: |+-----       }
    62: +------     }
    63:           }


NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:15:12 2019
FILE NAME: vec.c

FUNCTION NAME: do_comp3
DIAGNOSTIC LIST

 LINE              DIAGNOSTIC MESSAGE

    65: vec( 130): Vector register is assigned.: vregc
    74: vec( 101): Vectorized loop.
    74: err( 504): The number of VLOAD, VSTORE.:  2,  1.
    74: err( 505): The number of VGT,   VSC.   :  0,  0.
    76: vec( 128): Fused multiply-add operation applied.
    84: vec( 103): Unvectorized loop.
    84: vec( 113): Overhead of loop division is too large.
    88: vec( 101): Vectorized loop.
    88: err( 504): The number of VLOAD, VSTORE.:  1,  1.
    88: err( 505): The number of VGT,   VSC.   :  0,  0.
    89: opt(1060): Use "nolstval" directive if possible.
    89: opt(1059): Unable to determine last value of scalar temporary.: vregc
    89: err( 508): Replaced with vector register.: vregc
    93: vec( 101): Vectorized loop.
    93: err( 504): The number of VLOAD, VSTORE.:  2,  2.
    93: err( 505): The number of VGT,   VSC.   :  0,  0.
    95: opt(1019): Feedback of scalar value from one loop pass to another.: vregc
    95: err( 508): Replaced with vector register.: vregc
    95: vec( 128): Fused multiply-add operation applied.
    96: err( 508): Replaced with vector register.: vregc
   106: vec( 101): Vectorized loop.
   106: err( 504): The number of VLOAD, VSTORE.:  2,  1.
   106: err( 505): The number of VGT,   VSC.   :  0,  0.
   108: vec( 128): Fused multiply-add operation applied.
   116: vec( 103): Unvectorized loop.
   116: vec( 113): Overhead of loop division is too large.
   119: opt(1037): Feedback of array elements.: vregc
   119: opt(1036): Potential feedback - use directive or compiler option if OK.: E
   119: vec( 101): Vectorized loop.
   119: err( 504): The number of VLOAD, VSTORE.:  1,  1.
   119: err( 505): The number of VGT,   VSC.   :  0,  0.
   120: opt(1036): Potential feedback - use directive or compiler option if OK.: E
   120: err( 508): Replaced with vector register.: vregc
   124: vec( 101): Vectorized loop.
   124: err( 504): The number of VLOAD, VSTORE.:  2,  2.
   124: err( 505): The number of VGT,   VSC.   :  0,  0.
   126: opt(1036): Potential feedback - use directive or compiler option if OK.: E
   126: opt(1019): Feedback of scalar value from one loop pass to another.: vregc
   126: err( 508): Replaced with vector register.: vregc
   126: vec( 128): Fused multiply-add operation applied.
   127: err( 508): Replaced with vector register.: vregc
   137: vec( 101): Vectorized loop.
   137: err( 504): The number of VLOAD, VSTORE.:  1,  1.
   137: err( 505): The number of VGT,   VSC.   :  0,  0.


NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:15:12 2019
FILE NAME: vec.c

FUNCTION NAME: do_comp3
FORMAT LIST

 LINE   LOOP      STATEMENT

    65:           void do_comp3(double* E, double* F, double* B) {
    66:            
    67:             // create an array and assign it directly to the vector registers
    68:             double vregc[nreg];
    69:             #pragma _NEC vreg(vregc)
    70:           
    71:             ftrace_region_begin("l-1");
    72:             int k1=0;
    73: +------>    for (int j=0; j<n; j++) {
    74: |V----->      for (int i=0; i<m; i++) {
    75: ||              int idx=j*m+i;
    76: ||      F       E[k1*m*n+idx] -= B[idx] * B[idx];
    77: |V-----       }
    78: +------     }
    79:             ftrace_region_end("l-1");
    80:           
    81:             ftrace_region_begin("l-2");
    82: +------>    for (int j=0; j<n; j++) {
    83: |             // create a loop to work in chunks, which fit into the vector registers
    84: |+----->      for (int si=0; si<m; si+=nreg) {
    85: ||              int se = MIN(si+nreg,m);
    86: ||              // transfer array to the vector registers
    87: ||              #pragma _NEC ivdep
    88: ||V---->        for (int i=si; i<se; i++) {
    89: |||     V         vregc[i-si] = E[0*m*n+j*m+i];
    90: ||V----         }
    91: ||              // perform computation and shift the vector register content to minimize loads
    92: ||+---->        for (int k=1; k<o; k++) {
    93: |||V--->          for (int i=si; i<se; i++) {
    94: ||||                int idx=j*m+i;
    95: ||||    F           E[k*m*n+idx] = vregc[i-si] - F[k*m*n+idx] * F[k*m*n+idx];
    96: ||||    V           vregc[i-si] = E[k*m*n+idx];
    97: |||V---           }
    98: ||+----         }
    99: |+-----       }
   100: +------     }
   101:             ftrace_region_end("l-2");
   102:           
   103:             ftrace_region_begin("l-3");
   104:             int k2=o-1;
   105: +------>    for (int j=0; j<n; j++) {
   106: |V----->      for (int i=0; i<m; i++) {
   107: ||              int idx=j*m+i;
   108: ||      F       E[k2*n*m+idx] += B[idx] * B[idx];
   109: |V-----       }
   110: +------     }
   111:             ftrace_region_end("l-3");
   112:           
   113:             ftrace_region_begin("l-4");
   114: +------>    for (int j=0; j<n; j++) {
   115: |             // create a loop to work in chunks, which fit into the vector registers
   116: |+----->      for (int si=0; si<m; si+=nreg) {
   117: ||              int se = MIN(si+nreg,m);
   118: ||              // transfer array to the vector registers
   119: ||V---->        for (int i=si; i<se; i++) {
   120: |||     V         vregc[i-si] = E[(o-1)*m*n+j*m+i];
   121: ||V----         }
   122: ||              // perform computation and shift the vector register content to minimize loads
   123: ||+---->        for (int k=o-2; k>=0; k--) {
   124: |||V--->          for (int i=si; i<se; i++) {
   125: ||||                int idx=j*m+i;
   126: ||||    F           E[k*m*n+idx] = vregc[i-si] - F[k*m*n+idx] * F[k*m*n+idx];
   127: ||||    V           vregc[i-si] = E[k*m*n+idx];
   128: |||V---           }
   129: ||+----         }
   130: |+-----       }
   131: +------     }
   132:             ftrace_region_end("l-4");
   133:           
   134:             ftrace_region_begin("l-5");
   135:             int k3=0;
   136: +------>    for (int j=0; j<n; j++) {
   137: |V----->      for (int i=0; i<m; i++) {
   138: ||              int idx=j*m+i;
   139: ||              B[idx] = E[k3*m*n+idx];
   140: |V-----       }
   141: +------     }
   142:             ftrace_region_end("l-5");
   143:           
   144:           }


NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:15:12 2019
FILE NAME: vec.c

FUNCTION NAME: do_comp4
DIAGNOSTIC LIST

 LINE              DIAGNOSTIC MESSAGE

   146: vec( 130): Vector register is assigned.: vregc
   146: vec( 130): Vector register is assigned.: vregd
   155: vec( 103): Unvectorized loop.
   155: vec( 113): Overhead of loop division is too large.
   159: vec( 101): Vectorized loop.
   159: err( 504): The number of VLOAD, VSTORE.:  2,  2.
   159: err( 505): The number of VGT,   VSC.   :  0,  0.
   160: err( 508): Replaced with vector register.: vregc
   161: err( 508): Replaced with vector register.: vregd
   167: vec( 101): Vectorized loop.
   167: err( 504): The number of VLOAD, VSTORE.:  4,  3.
   167: err( 505): The number of VGT,   VSC.   :  0,  0.
   168: opt(1036): Potential feedback - use directive or compiler option if OK.: B
   168: opt(1019): Feedback of scalar value from one loop pass to another.: vregc
   168: opt(1019): Feedback of scalar value from one loop pass to another.: vregd
   168: err( 508): Replaced with vector register.: vregc
   168: err( 508): Replaced with vector register.: vregd
   168: vec( 128): Fused multiply-add operation applied.
   169: err( 508): Replaced with vector register.: vregc
   170: err( 508): Replaced with vector register.: vregd


NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:15:12 2019
FILE NAME: vec.c

FUNCTION NAME: do_comp4
FORMAT LIST

 LINE   LOOP      STATEMENT

   146:           void do_comp4(double* A, double* B) {
   147:           
   148:             // create two arrays and assign both directly to the vector registers
   149:             double vregc[nreg];
   150:             double vregd[nreg];
   151:             #pragma _NEC vreg(vregc)
   152:             #pragma _NEC vreg(vregd)
   153:           
   154:             // create an outer loopt to work on chunks, which fit into the vector registers
   155: +------>    for (int si=1; si<m-1; si+=nreg) {
   156: |             int se = MIN(si+nreg,m-1);
   157: |             // transfer array to the vector registers
   158: |             #pragma _NEC shortloop
   159: |V----->      for (int i=si; i<se; i++) {
   160: ||      V       vregc[i-si] = A[0*m+i];
   161: ||      V       vregd[i-si] = A[1*m+i];
   162: |V-----       }
   163: |             // perform computation and echange the vector register content
   164: |             // and fill vregd with new content to minimize loads
   165: |+----->      for (int j=1; j<n-1; j++) {
   166: ||              #pragma _NEC shortloop
   167: ||V---->        for (int i=si; i<se; i++) {
   168: |||     F         B[j*m+i] += vregd[i-si] * vregc[i-si] - A[(j+1)*m+i];
   169: |||     V         vregc[i-si] = vregd[i-si];
   170: |||     V         vregd[i-si] = A[(j+1)*m+i];
   171: ||V----         }
   172: |+-----       }
   173: +------     }
   174:           
   175:           }


