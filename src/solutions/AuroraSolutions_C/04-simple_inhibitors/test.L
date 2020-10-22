NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:09:37 2019
FILE NAME: test.c

FUNCTION NAME: main
DIAGNOSTIC LIST

 LINE              DIAGNOSTIC MESSAGE

    18: inl(1222): Inlined: init
    20: inl(1212): Source for routine not found.: ftrace_region_begin
    23: vec( 101): Vectorized loop.
    23: err( 504): The number of VLOAD, VSTORE.:  1,  1.
    23: err( 505): The number of VGT,   VSC.   :  0,  0.
    24: inl(1222): Inlined: disturb
    30: inl(1212): Source for routine not found.: ftrace_region_end
    42: vec( 101): Vectorized loop.
    42: err( 504): The number of VLOAD, VSTORE.:  1,  1.
    42: err( 505): The number of VGT,   VSC.   :  0,  0.
    47: vec( 101): Vectorized loop.
    47: err( 504): The number of VLOAD, VSTORE.:  1,  1.
    47: err( 505): The number of VGT,   VSC.   :  0,  0.
    56: vec( 101): Vectorized loop.
    56: err( 504): The number of VLOAD, VSTORE.:  1,  1.
    56: err( 505): The number of VGT,   VSC.   :  0,  0.
    60: vec( 103): Unvectorized loop.
    60: vec( 110): Vectorization obstructive function reference.: fprintf
    61: opt(1118): This I/O statement inhibits optimization of loop.
    68: vec( 101): Vectorized loop.
    68: err( 504): The number of VLOAD, VSTORE.:  2,  1.
    68: err( 505): The number of VGT,   VSC.   :  0,  0.
    74: opt(1395): Inner loop stripped and strip loop moved outside outer loop.: i
    74: vec( 101): Vectorized loop.
    74: err( 504): The number of VLOAD, VSTORE.:  1,  1.
    74: err( 505): The number of VGT,   VSC.   :  0,  0.
    75: vec( 128): Fused multiply-add operation applied.
    82: vec( 101): Vectorized loop.
    82: err( 504): The number of VLOAD, VSTORE.:  1,  1.
    82: err( 505): The number of VGT,   VSC.   :  0,  0.
    84: opt(1037): Feedback of array elements.: c
    84: vec( 128): Fused multiply-add operation applied.
    87: vec( 103): Unvectorized loop.
   117: vec( 101): Vectorized loop.
   117: err( 504): The number of VLOAD, VSTORE.:  0,  2.
   117: err( 505): The number of VGT,   VSC.   :  0,  0.
    87: vec( 110): Vectorization obstructive function reference.: fprintf
    88: opt(1118): This I/O statement inhibits optimization of loop.
    95: vec( 101): Vectorized loop.
    95: err( 504): The number of VLOAD, VSTORE.:  1,  0.
    95: err( 505): The number of VGT,   VSC.   :  0,  0.
    97: vec( 126): Idiom detected.: Max/Min
   100: vec( 126): Idiom detected.: Max/Min
   102: vec( 126): Idiom detected.: Sum


NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:09:37 2019
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
    17:            
    18:         I   init(n,a,b,mystring);
    19:            
    20:             ftrace_region_begin("loop1");
    21:             // check the Makefile, where the compile flag -finline-functions was used.
    22:             // this automatically inlines small functions, which would otherwise obstruct vectorization.
    23: V------>    for (i=0; i<n; i++) {
    24: |       I     a[i] = disturb(a[i]);
    25: V------     }
    26:             // alternatively you can inline the function call manually as shown here
    27:             // for (i=0; i<n; i++) {
    28:             //   a[i] = a[i] + 1;
    29:             // }
    30:             ftrace_region_end("loop1");
    31:            
    32:             ftrace_region_begin("loop2");
    33:             // pull loop into switch construct
    34:             int thecase = 0;
    35:             if (strcmp(mystring, "first") == 0) {
    36:               thecase = 1;
    37:             } else if (strcmp(mystring, "second") == 0) {
    38:               thecase = 2;
    39:             }
    40:             switch(thecase) {
    41:               case 1:
    42: V------>        for (i=0; i<n; i++) {
    43: |                 a[i]=a[i]+2.0;
    44: V------         }
    45:                 break;
    46:               case 2:
    47: V------>        for (i=0; i<n; i++) {
    48: |                 b[i]=a[i]*2.1;
    49: V------         }
    50:                 break;
    51:             }
    52:             ftrace_region_end("loop2");
    53:            
    54:             ftrace_region_begin("loop3");
    55:             // separate computation and IO
    56: V------>    for (i=0; i<n; i++) {
    57: |             b[i] = 2.0*a[i];
    58: V------     }
    59:             FILE* outfileh = fopen("dump.txt", "w");
    60: +------>    for (i=0; i<n; i++) {
    61: |             fprintf(outfileh, "%16.12f\n", b[i]);
    62: +------     }
    63:             fclose(outfileh);
    64:             ftrace_region_end("loop3");
    65:            
    66:             ftrace_region_begin("loop4");
    67:             // rewrite loop to be a regular for loop
    68: V------>    for (i=0; i<n;i++) {
    69: |             b[i] = 2.0*a[i]*b[i];
    70: V------     }
    71:             ftrace_region_end("loop4");
    72:            
    73: +------>    for (j=0; j<m; j++) {
    74: |V----->      for (i=0; i<m; i++) {
    75: ||      F       c[j*m+i] = a[i]/42.0 + 137.0*b[j];
    76: |V-----       }
    77: +------     }
    78:             ftrace_region_begin("loop5");
    79:             // pull out the print statement
    80:             // to allow for an exchange of the loops to better vectorize
    81: +------>    for (i=1; i<m; i++) {
    82: |V----->      for (j=0; j<m; j++) {
    83: ||              int idx = j*m+i;
    84: ||      F       c[idx] = b[i]+0.01*c[idx-1];
    85: |V-----       }
    86: +------     }
    87: V------>    for (j=0; j<m; j++) {
    88: |             if (c[(j+1)*m] < 0.0) fprintf(stderr, "%16.12f\n", c[(j+1)*m]);
    89: V------     }
    90:             ftrace_region_end("loop5");
    91:           
    92:             double minval = c[0];
    93:             double maxval = c[0];
    94:             double sum = c[0];
    95: V------>    for (i=1; i<m*m; i++) {
    96: |             if (c[i] < minval) {
    97: |               minval = c[i];
    98: |             }
    99: |             if (c[i] > maxval) {
   100: |               maxval = c[i];
   101: |             }
   102: |             sum += c[i];
   103: V------     }
   104:             printf("MIN: %20.16e\n", minval);
   105:             printf("MAX: %20.16e\n", maxval);
   106:             printf("AVG: %20.16e\n", sum/(m*m));
   107:           
   108:             return 0;
   109:           }


NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:09:37 2019
FILE NAME: test.c

FUNCTION NAME: disturb
DIAGNOSTIC LIST

 LINE              DIAGNOSTIC MESSAGE

  No diagnostic message.


NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:09:37 2019
FILE NAME: test.c

FUNCTION NAME: disturb
FORMAT LIST

 LINE   LOOP      STATEMENT

   111:           double disturb(double x) {
   112:             return x+1;
   113:           }


NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:09:37 2019
FILE NAME: test.c

FUNCTION NAME: init
DIAGNOSTIC LIST

 LINE              DIAGNOSTIC MESSAGE

   117: vec( 101): Vectorized loop.
   117: err( 504): The number of VLOAD, VSTORE.:  0,  2.
   117: err( 505): The number of VGT,   VSC.   :  0,  0.
   118: opt(1112): Loop fused with previous loop.: i


NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:09:37 2019
FILE NAME: test.c

FUNCTION NAME: init
FORMAT LIST

 LINE   LOOP      STATEMENT

   116:           void init(int n, double* a, double* b, char* mys) {
   117: |      >    for (int i=0; i<n; i++) a[i] = 2.0;
   118: V======>    for (int i=0; i<n; i++) b[i] = 0.0;
   119:           
   120:             strcpy(mys, "second");
   121:           }


