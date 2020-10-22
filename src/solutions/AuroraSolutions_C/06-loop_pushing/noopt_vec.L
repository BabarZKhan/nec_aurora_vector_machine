NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:09:45 2019
FILE NAME: vec.c

FUNCTION NAME: do_loop
DIAGNOSTIC LIST

 LINE              DIAGNOSTIC MESSAGE

    18: vec( 110): Vectorization obstructive function reference.: printf
    18: vec( 110): Vectorization obstructive function reference.: add_term
    18: vec( 110): Vectorization obstructive function reference.: exit
    47: vec( 101): Vectorized loop.
    47: err( 504): The number of VLOAD, VSTORE.:  1,  0.
    47: err( 505): The number of VGT,   VSC.   :  0,  0.
    48: vec( 126): Idiom detected.: Sum


NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:09:45 2019
FILE NAME: vec.c

FUNCTION NAME: do_loop
FORMAT LIST

 LINE   LOOP      STATEMENT

    10:           void do_loop(double* A, double* B, double* C, double* D, double* L,
    11:                        int today) {
    12:           
    13:             double tmp, tmp_old;
    14:             double const max_tmp = 1000000.0;
    15:             int idx;
    16:           
    17: +------>    for (int j=0; j<n; j++) {
    18: |+----->      for (int i=0; i<m; i++) {
    19: ||              idx = j*m+i;
    20: ||              switch (today) {
    21: ||                case (MONDAY):
    22: ||                  tmp = B[idx]+2;
    23: ||                  break;
    24: ||                case (TUESDAY):
    25: ||                  tmp = B[idx]-2;
    26: ||                  break;
    27: ||                case (WEDNESDAY):
    28: ||                  tmp = ((double)(i+1))/((double)(j+1));
    29: ||                  break;
    30: ||                case (THURSDAY):
    31: ||                  tmp = (i+1)/(j+1)+1;
    32: ||                  break;
    33: ||                case (FRIDAY):
    34: ||                  tmp = ((double)(i+1))*((double)(j+1));
    35: ||                  break;
    36: ||                case (SATURDAY):
    37: ||                  tmp = 0.5*(double)((i+1)/(j+1));
    38: ||                  break;
    39: ||                case (SUNDAY):
    40: ||                  tmp = (i+1)/((double)(j+1+2));
    41: ||                  break;
    42: ||              }
    43: ||        
    44: ||              A[idx] += sqrt(fabs(tmp)+1) * exp(B[idx]);
    45: ||              tmp_old = tmp;
    46: ||        
    47: ||V---->        for (int k=0; k<o; k++) {
    48: |||               tmp += exp(B[idx] * L[k]);
    49: ||V----         }
    50: ||        
    51: ||              if (tmp > max_tmp) {
    52: ||                printf("TMP greater MAX_TMP -> STOP\n");
    53: ||                exit(0);
    54: ||              }
    55: ||        
    56: ||              A[idx] += tmp / sqrt(fabs(tmp_old)+1);
    57: ||        
    58: ||              add_term(j, A+idx, C[i], D[i], L);
    59: ||        
    60: |+-----       }
    61: +------     }
    62:           
    63:           }


NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:09:45 2019
FILE NAME: vec.c

FUNCTION NAME: add_term
DIAGNOSTIC LIST

 LINE              DIAGNOSTIC MESSAGE

  No diagnostic message.


NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:09:45 2019
FILE NAME: vec.c

FUNCTION NAME: add_term
FORMAT LIST

 LINE   LOOP      STATEMENT

    65:           void add_term(int j, double* A, double C, double D, double* L) {
    66:           
    67:             if (j >= 90) {
    68:               add_C(A, C);
    69:             } else if (j >= 0) {
    70:               add_D(A, D, L);
    71:             } else {
    72:               printf("A = 0.0 -> STOP\n");
    73:               exit(0);
    74:             }
    75:           
    76:           }


NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:09:45 2019
FILE NAME: vec.c

FUNCTION NAME: add_C
DIAGNOSTIC LIST

 LINE              DIAGNOSTIC MESSAGE

  No diagnostic message.


NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:09:45 2019
FILE NAME: vec.c

FUNCTION NAME: add_C
FORMAT LIST

 LINE   LOOP      STATEMENT

    78:           void add_C(double* A, double C) {
    79:             *A += sqrt(C);
    80:           }


NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:09:45 2019
FILE NAME: vec.c

FUNCTION NAME: add_D
DIAGNOSTIC LIST

 LINE              DIAGNOSTIC MESSAGE

    84: vec( 101): Vectorized loop.
    84: err( 504): The number of VLOAD, VSTORE.:  1,  0.
    84: err( 505): The number of VGT,   VSC.   :  0,  0.
    85: vec( 126): Idiom detected.: Sum


NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:09:45 2019
FILE NAME: vec.c

FUNCTION NAME: add_D
FORMAT LIST

 LINE   LOOP      STATEMENT

    82:           void add_D(double* A, double D, double* L) {
    83:            
    84: V------>    for (int k=0; k<o; k++) {
    85: |             *A += sqrt(D * L[k]);
    86: V------     }
    87:           
    88:           }


