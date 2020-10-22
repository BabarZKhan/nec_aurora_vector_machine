NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:09:42 2019
FILE NAME: test.c

FUNCTION NAME: main
DIAGNOSTIC LIST

 LINE              DIAGNOSTIC MESSAGE

    10: inl(1212): Source for routine not found.: init
    14: vec( 101): Vectorized loop.
    14: err( 504): The number of VLOAD, VSTORE.:  1,  1.
    14: err( 505): The number of VGT,   VSC.   :  0,  0.
    21: vec( 103): Unvectorized loop.
    21: vec( 110): Vectorization obstructive function reference.: sub2
    21: vec( 110): Vectorization obstructive function reference.: sub3
    21: vec( 110): Vectorization obstructive function reference.: sub4
    21: vec( 110): Vectorization obstructive function reference.: sub1
    22: inl(1212): Source for routine not found.: sub1
    22: opt(1025): Reference to this function inhibits optimization.: sub1
    23: inl(1212): Source for routine not found.: sub2
    24: inl(1212): Source for routine not found.: sub3
    25: inl(1212): Source for routine not found.: sub4
    33: vec( 101): Vectorized loop.
    33: err( 504): The number of VLOAD, VSTORE.:  2,  0.
    33: err( 505): The number of VGT,   VSC.   :  0,  0.
    36: vec( 126): Idiom detected.: Max/Min
    39: vec( 126): Idiom detected.: Max/Min
    41: vec( 126): Idiom detected.: Sum


NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:09:42 2019
FILE NAME: test.c

FUNCTION NAME: main
FORMAT LIST

 LINE   LOOP      STATEMENT

     5:           int main () {
     6:            
     7:             double a[l*m*n], b[l*m*n];
     8:             int idx;
     9:            
    10:             init(a);
    11:           
    12: +------>    for (int k=0; k<n; k++) {
    13: |+----->      for (int j=0; j<m; j++) {
    14: ||V---->        for (int i=0; i<l; i++) {
    15: |||               idx = k*m*l+j*l+i;
    16: |||               b[idx] = a[idx]/3.0;
    17: ||V----         }
    18: |+-----       }
    19: +------     }
    20:           
    21: +------>    for (int p=1; p<=10000; p++) {
    22: |             sub1(a, b);
    23: |             sub2(a, b, l, m, n);
    24: |             sub3(a, b, l, m-1, n);
    25: |             sub4(a, b);
    26: +------     }
    27:            
    28:             double minval = a[0]+b[0];
    29:             double maxval = a[0]+b[0];
    30:             double sum = 0;
    31: +------>    for (int k=0; k<n; k++) {
    32: |+----->      for (int j=0; j<m; j++) {
    33: ||V---->        for (int i=0; i<l; i++) {
    34: |||               idx = k*m*l+j*l+i;
    35: |||               if (a[idx]+b[idx] < minval) {
    36: |||                 minval = a[idx]+b[idx];
    37: |||               }
    38: |||               if (a[idx]+b[idx] > maxval) {
    39: |||                 maxval = a[idx]+b[idx];
    40: |||               }
    41: |||               sum += a[idx]+b[idx];
    42: ||V----         }
    43: |+-----       }
    44: +------     }
    45:             printf("MIN: %20.16e\n", minval);
    46:             printf("MAX: %20.16e\n", maxval);
    47:             printf("AVG: %20.16e\n", sum/(2.0*l*m*n));
    48:            
    49:             return 0;
    50:           }


