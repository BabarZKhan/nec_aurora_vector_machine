NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:09:28 2019
FILE NAME: test.c

FUNCTION NAME: main
DIAGNOSTIC LIST

 LINE              DIAGNOSTIC MESSAGE

    22: vec( 103): Unvectorized loop.
    22: vec( 110): Vectorization obstructive function reference.: disturb
    23: opt(1025): Reference to this function inhibits optimization.: disturb
    28: vec( 103): Unvectorized loop.
    28: vec( 110): Vectorization obstructive function reference.: strcmp
    48: vec( 103): Unvectorized loop.
    48: vec( 110): Vectorization obstructive function reference.: fprintf
    50: opt(1118): This I/O statement inhibits optimization of loop.
    58: vec( 103): Unvectorized loop.
    58: vec( 108): Unvectorizable loop structure.
    66: opt(1395): Inner loop stripped and strip loop moved outside outer loop.: i
    66: vec( 101): Vectorized loop.
    66: err( 504): The number of VLOAD, VSTORE.:  1,  1.
    66: err( 505): The number of VGT,   VSC.   :  0,  0.
    67: vec( 128): Fused multiply-add operation applied.
    71: vec( 110): Vectorization obstructive function reference.: fprintf
    72: vec( 101): Vectorized loop.
    72: err( 504): The number of VLOAD, VSTORE.:  1,  1.
    72: err( 505): The number of VGT,   VSC.   :  0,  0.
    73: opt(1037): Feedback of array elements.: c
    73: vec( 126): Idiom detected.: Iteration
    75: opt(1118): This I/O statement inhibits optimization of loop.
    82: vec( 101): Vectorized loop.
    82: err( 504): The number of VLOAD, VSTORE.:  1,  0.
    82: err( 505): The number of VGT,   VSC.   :  0,  0.
    84: vec( 126): Idiom detected.: Max/Min
    87: vec( 126): Idiom detected.: Max/Min
    89: vec( 126): Idiom detected.: Sum


NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:09:28 2019
FILE NAME: test.c

FUNCTION NAME: main
FORMAT LIST

 LINE   LOOP      STATEMENT

     9:           int main() {
    10:           
    11:             int const n = 655360;
    12:             int const m = 10000;
    13:             int i, j;
    14:             double a[n], b[n];
    15:             double c[m*m];
    16:             char mystring[10];
    17:             bool keep_going;
    18:            
    19:             init(n,a,b,mystring);
    20:            
    21:             ftrace_region_begin("loop1");
    22: +------>    for (i=0; i<n; i++) {
    23: |             a[i] = disturb(a[i]);
    24: +------     }
    25:             ftrace_region_end("loop1");
    26:            
    27:             ftrace_region_begin("loop2");
    28: +------>    for (i=0; i<n; i++) {
    29: |             int thecase = 0;
    30: |             if (strcmp(mystring, "first") == 0) {
    31: |               thecase = 1;
    32: |             } else if (strcmp(mystring, "second") == 0) {
    33: |               thecase = 2;
    34: |             }
    35: |             switch(thecase) {
    36: |               case 1:
    37: |                 a[i]=a[i]+2.0;
    38: |                 break;
    39: |               case 2:
    40: |                 b[i]=a[i]*2.1;
    41: |                 break;
    42: |             }
    43: +------     }
    44:             ftrace_region_end("loop2");
    45:            
    46:             ftrace_region_begin("loop3");
    47:             FILE* outfileh = fopen("dump.txt", "w");
    48: +------>    for (i=0; i<n; i++) {
    49: |             b[i] = 2.0*a[i];
    50: |             fprintf(outfileh, "%16.12f\n", b[i]);
    51: +------     }
    52:             fclose(outfileh);
    53:             ftrace_region_end("loop3");
    54:            
    55:             ftrace_region_begin("loop4");
    56:             i=0;
    57:             keep_going = (i<n);
    58: +------>    while (keep_going) {
    59: |             b[i] = 2.0*a[i]*b[i];
    60: |             i++;
    61: |             keep_going = (i<n);
    62: +------     }
    63:             ftrace_region_end("loop4");
    64:            
    65: +------>    for (j=0; j<m; j++) {
    66: |V----->      for (i=0; i<m; i++) {
    67: ||      F       c[j*m+i] = a[i]/42.0 + 137.0*b[j];
    68: |V-----       }
    69: +------     }
    70:             ftrace_region_begin("loop5");
    71: +------>    for (j=0; j<m; j++) {
    72: |V----->      for (i=1; i<m; i++) {
    73: ||              c[j*m+i] = b[i]+0.01*c[j*m+(i-1)];
    74: |V-----       }
    75: |             if (c[(j+1)*m] < 0.0) fprintf(stderr, "%16.12f\n", c[(j+1)*m]);
    76: +------     }
    77:             ftrace_region_end("loop5");
    78:           
    79:             double minval = c[0];
    80:             double maxval = c[0];
    81:             double sum = c[0];
    82: V------>    for (i=1; i<m*m; i++) {
    83: |             if (c[i] < minval) {
    84: |               minval = c[i];
    85: |             }
    86: |             if (c[i] > maxval) {
    87: |               maxval = c[i];
    88: |             }
    89: |             sum += c[i];
    90: V------     }
    91:             printf("MIN: %20.16e\n", minval);
    92:             printf("MAX: %20.16e\n", maxval);
    93:             printf("AVG: %20.16e\n", sum/(m*m));
    94:           
    95:             return 0;
    96:           }


NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:09:28 2019
FILE NAME: test.c

FUNCTION NAME: disturb
DIAGNOSTIC LIST

 LINE              DIAGNOSTIC MESSAGE

  No diagnostic message.


NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:09:28 2019
FILE NAME: test.c

FUNCTION NAME: disturb
FORMAT LIST

 LINE   LOOP      STATEMENT

    98:           double disturb(double x) {
    99:             return x+1;
   100:           }


NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:09:28 2019
FILE NAME: test.c

FUNCTION NAME: init
DIAGNOSTIC LIST

 LINE              DIAGNOSTIC MESSAGE

   104: vec( 101): Vectorized loop.
   104: err( 504): The number of VLOAD, VSTORE.:  0,  2.
   104: err( 505): The number of VGT,   VSC.   :  0,  0.
   105: opt(1112): Loop fused with previous loop.: i


NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:09:28 2019
FILE NAME: test.c

FUNCTION NAME: init
FORMAT LIST

 LINE   LOOP      STATEMENT

   103:           void init(int n, double* a, double* b, char* mys) {
   104: |      >    for (int i=0; i<n; i++) a[i] = 2.0;
   105: V======>    for (int i=0; i<n; i++) b[i] = 0.0;
   106:           
   107:             strcpy(mys, "second");
   108:           }


