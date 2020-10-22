NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:16:00 2019
FILE NAME: test.c

FUNCTION NAME: main
DIAGNOSTIC LIST

 LINE              DIAGNOSTIC MESSAGE

    14: vec( 101): Vectorized loop.
    14: err( 504): The number of VLOAD, VSTORE.:  0,  1.
    14: err( 505): The number of VGT,   VSC.   :  0,  0.
    16: vec( 128): Fused multiply-add operation applied.
    16: vec( 101): Vectorized loop.
    16: err( 504): The number of VLOAD, VSTORE.:  0,  1.
    16: err( 505): The number of VGT,   VSC.   :  0,  0.
    18: vec( 103): Unvectorized loop.
    18: vec( 110): Vectorization obstructive function reference.: do_comp
    19: opt(1025): Reference to this function inhibits optimization.: do_comp
    27: vec( 101): Vectorized loop.
    27: err( 504): The number of VLOAD, VSTORE.:  1,  0.
    27: err( 505): The number of VGT,   VSC.   :  0,  0.
    29: vec( 126): Idiom detected.: Max/Min
    32: vec( 126): Idiom detected.: Max/Min
    34: vec( 126): Idiom detected.: Sum


NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:16:00 2019
FILE NAME: test.c

FUNCTION NAME: main
FORMAT LIST

 LINE   LOOP      STATEMENT

     8:           int main() {
     9:             double A[m*n*o], B[m*n], C[o*m*n];
    10:           
    11:             FILE* outfileh = fopen("output.txt", "wb");
    12:             fclose(outfileh);
    13:           
    14: V======>    for (int i=0; i<m*n; i++) B[i] = 0.0;
    15:             double p=2.0*acos(0.0)/137.0;
    16: V======>F   for (int i=0; i<m*n*o; i++) A[i] = maxi*fabs(2.0*(i/p-floor(i/p+0.5)));
    17:           
    18: +------>    for (int i=0; i<iter; i++) {
    19: |             do_comp(A, B);
    20: +------     }
    21:           
    22:             do_read(C);
    23:           
    24:             double minval = C[0];
    25:             double maxval = C[0];
    26:             double sum = C[0];
    27: V------>    for (int i=1; i<m*n*o; i++) {
    28: |             if (C[i] < minval) {
    29: |               minval = C[i];
    30: |             }
    31: |             if (C[i] > maxval) {
    32: |               maxval = C[i];
    33: |             }
    34: |             sum += C[i];
    35: V------     }
    36:             printf("MIN: %20.16e\n", minval);
    37:             printf("MAX: %20.16e\n", maxval);
    38:             printf("AVG: %20.16e\n", sum/(m*n));
    39:             system("if [[ $(which md5sum) == '' ]] ;"//&
    40:                    "then "//&
    41:                    "   echo 'No md5sum found!' ; "//&
    42:                    "else " //&
    43:                    "   md5sum output.txt;"//&
    44:                    "fi");
    45:           }


