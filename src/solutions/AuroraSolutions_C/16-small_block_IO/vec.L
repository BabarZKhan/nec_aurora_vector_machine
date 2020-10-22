NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:16:00 2019
FILE NAME: vec.c

FUNCTION NAME: do_write
DIAGNOSTIC LIST

 LINE              DIAGNOSTIC MESSAGE

  No diagnostic message.


NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:16:00 2019
FILE NAME: vec.c

FUNCTION NAME: do_write
FORMAT LIST

 LINE   LOOP      STATEMENT

     5:           void do_write(double* Btmp) {
     6:           
     7:             FILE* outfileh = fopen("output.txt", "ab");
     8:             // remove everything but IO from this routine
     9:             // output.txt is written in the same order as Btmp is in memory
    10:             // replace loops of IO into one giant IO operation
    11:             fwrite(Btmp, n*m*o*sizeof(double), 1, outfileh);
    12:             fclose(outfileh);
    13:           
    14:           }


NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:16:00 2019
FILE NAME: vec.c

FUNCTION NAME: do_comp
DIAGNOSTIC LIST

 LINE              DIAGNOSTIC MESSAGE

    23: vec( 110): Vectorization obstructive function reference.: printf
    28: vec( 101): Vectorized loop.
    28: err( 504): The number of VLOAD, VSTORE.:  2,  2.
    28: err( 505): The number of VGT,   VSC.   :  0,  0.
    30: opt(1019): Feedback of scalar value from one loop pass to another.: B
    34: opt(1118): This I/O statement inhibits optimization of loop.


NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:16:00 2019
FILE NAME: vec.c

FUNCTION NAME: do_comp
FORMAT LIST

 LINE   LOOP      STATEMENT

    16:           void do_comp(double* A, double* B) {
    17:           
    18:             // create temporary B tensor to reorder elements of B
    19:             // to be able to write everything in one binary dump
    20:             double Btmp[o*n*m];
    21:           
    22:             // pull all IO operations out of the inner loop and put into do_write
    23: +------>    for (int j=0; j<n; j++) {
    24: |             // inline the k-loop from do_write
    25: |             // k in j loop because:
    26: |             // o > n and enables keeping of progress output status at the end of loop
    27: |+----->      for (int k=0; k<o; k++) {
    28: ||V---->        for (int i=0; i<m; i++) {
    29: |||               // save status of each B(i,j) summation for IO
    30: |||               B[j*m+i] += A[k*m*n+j*m+i];
    31: |||               Btmp[j*m*o+i*o+k] = B[j*m+i];
    32: ||V----         }
    33: |+-----       }
    34: |             printf("%d %d\n", j, n);
    35: +------     }
    36:           
    37:             do_write(Btmp);
    38:           
    39:           }


NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:16:00 2019
FILE NAME: vec.c

FUNCTION NAME: do_read
DIAGNOSTIC LIST

 LINE              DIAGNOSTIC MESSAGE

  No diagnostic message.


NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:16:00 2019
FILE NAME: vec.c

FUNCTION NAME: do_read
FORMAT LIST

 LINE   LOOP      STATEMENT

    41:           void do_read(double* C) {
    42:           
    43:             FILE* infileh = fopen("output.txt", "rb");
    44:             // read everything in one go
    45:             fread(C, n*m*o*sizeof(double), 1, infileh);
    46:             fclose(infileh);
    47:           }


