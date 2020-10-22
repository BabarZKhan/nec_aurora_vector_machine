NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:15:30 2019
FILE NAME: vec.c

FUNCTION NAME: do_write
DIAGNOSTIC LIST

 LINE              DIAGNOSTIC MESSAGE

     9: vec( 103): Unvectorized loop.
     9: vec( 110): Vectorization obstructive function reference.: fwrite
    11: opt(1118): This I/O statement inhibits optimization of loop.


NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:15:30 2019
FILE NAME: vec.c

FUNCTION NAME: do_write
FORMAT LIST

 LINE   LOOP      STATEMENT

     5:           void do_write(int i, int j, double* A, double* B) {
     6:           
     7:             FILE* outfileh = fopen("output.txt", "ab");
     8:           
     9: +------>    for (int k=0; k<o; k++) {
    10: |             B[j*m+i] += A[k*m*n+j*m+i];
    11: |             fwrite(B+j*m+i, sizeof(double), 1, outfileh);
    12: +------     }
    13:             fclose(outfileh);
    14:           
    15:           }


NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:15:30 2019
FILE NAME: vec.c

FUNCTION NAME: do_comp
DIAGNOSTIC LIST

 LINE              DIAGNOSTIC MESSAGE

    20: vec( 103): Unvectorized loop.
    20: vec( 110): Vectorization obstructive function reference.: do_write
    21: opt(1025): Reference to this function inhibits optimization.: do_write


NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:15:30 2019
FILE NAME: vec.c

FUNCTION NAME: do_comp
FORMAT LIST

 LINE   LOOP      STATEMENT

    17:           void do_comp(double* A, double* B) {
    18:           
    19: +------>    for (int j=0; j<n; j++) {
    20: |+----->      for (int i=0; i<m; i++) {
    21: ||              do_write(i, j, A, B);
    22: |+-----       }
    23: |             printf("%d %d\n", j, n);
    24: +------     }
    25:           
    26:           }


NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:15:30 2019
FILE NAME: vec.c

FUNCTION NAME: do_read
DIAGNOSTIC LIST

 LINE              DIAGNOSTIC MESSAGE

    34: vec( 103): Unvectorized loop.
    34: vec( 110): Vectorization obstructive function reference.: fread
    35: opt(1118): This I/O statement inhibits optimization of loop.


NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:15:30 2019
FILE NAME: vec.c

FUNCTION NAME: do_read
FORMAT LIST

 LINE   LOOP      STATEMENT

    28:           void do_read(double* C) {
    29:           
    30:             FILE* infileh = fopen("output.txt", "rb");
    31:           
    32: +------>    for (int j=0; j<n; j++) {
    33: |+----->      for (int i=0; i<m; i++) {
    34: ||+---->        for (int k=0; k<o; k++) {
    35: |||               fread(C+j*m*o+i*o+k, sizeof(double), 1, infileh);
    36: ||+----         }
    37: |+-----       }
    38: +------     }
    39:             fclose(infileh);
    40:           }


