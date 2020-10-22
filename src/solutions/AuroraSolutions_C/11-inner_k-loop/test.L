NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:13:58 2019
FILE NAME: test.c

FUNCTION NAME: main
DIAGNOSTIC LIST

 LINE              DIAGNOSTIC MESSAGE

    15: vec( 101): Vectorized loop.
    15: err( 504): The number of VLOAD, VSTORE.:  0,  1.
    15: err( 505): The number of VGT,   VSC.   :  0,  0.
    16: vec( 101): Vectorized loop.
    16: err( 504): The number of VLOAD, VSTORE.:  0,  1.
    16: err( 505): The number of VGT,   VSC.   :  0,  0.
    18: vec( 128): Fused multiply-add operation applied.
    18: vec( 101): Vectorized loop.
    18: err( 504): The number of VLOAD, VSTORE.:  0,  1.
    18: err( 505): The number of VGT,   VSC.   :  0,  0.
    21: vec( 101): Vectorized loop.
    21: err( 504): The number of VLOAD, VSTORE.:  2,  3.
    21: err( 505): The number of VGT,   VSC.   :  0,  0.
    41: vec( 101): Vectorized loop.
    41: err( 504): The number of VLOAD, VSTORE.:  1,  0.
    41: err( 505): The number of VGT,   VSC.   :  0,  0.
    43: vec( 126): Idiom detected.: Max/Min
    46: vec( 126): Idiom detected.: Max/Min
    48: vec( 126): Idiom detected.: Sum


NEC C/C++ Compiler (2.3.20) for Vector Engine     Tue Jul  2 08:13:58 2019
FILE NAME: test.c

FUNCTION NAME: main
FORMAT LIST

 LINE   LOOP      STATEMENT

     6:           int main() {
     7:           
     8:             double B[m*n];
     9:             double A[o*m*n], C[(o+1)*m*n];
    10:             int L1[m*n];
    11:             int L2[m*n];
    12:           
    13:             int idx;
    14:           
    15: V======>    for (int i=0; i<m*n; i++) B[i] = 1.0;
    16: V======>    for (int i=0; i<(o+1)*m*n; i++) C[i] = 0.0;
    17:             double p=2.0*acos(0.0)/137.0;
    18: V======>F   for (int i=0; i<m*n*o; i++) A[i] = maxi*(fabs(2.0*(i/p-floor(i/p+0.5))));
    19:           
    20: +------>    for (int j=0; j<n; j++) {
    21: |V----->      for (int i=0; i<m; i++) {
    22: ||              idx = j*m+i;
    23: ||              L1[idx] = o/10 + (int)(A[j*m*o+i*o+0]*10.0);
    24: ||              L2[idx] = L1[idx];
    25: ||              if (((i+1+j+1)%128) == 0) L2[idx] = o;
    26: |V-----       }
    27: +------     }
    28:           
    29:           // IMPORANT A and L do not change for all calls to do_comp
    30:             do_comp_boolmask(A, B, C, L1, "L1-BOOLM");
    31:             do_comp_static_idxlist(A, B, C, L1, "L1-STIDX");
    32:             do_comp_dynamic_idxlist(A, B, C, L1, "L1-DYIDX");
    33:           
    34:             do_comp_boolmask(A, B, C, L2, "L2-BOOLM");
    35:             do_comp_static_idxlist(A, B, C, L2, "L2-STIDX");
    36:             do_comp_dynamic_idxlist(A, B, C, L2, "L2-DYIDX");
    37:           
    38:             double minval = C[0];
    39:             double maxval = C[0];
    40:             double sum = C[0];
    41: V------>    for (int i=1; i<(o+1)*m*n; i++) {
    42: |             if (C[i] < minval) {
    43: |               minval = C[i];
    44: |             }
    45: |             if (C[i] > maxval) {
    46: |               maxval = C[i];
    47: |             }
    48: |             sum += C[i];
    49: V------     }
    50:             printf("MIN: %20.16e\n", minval);
    51:             printf("MAX: %20.16e\n", maxval);
    52:             printf("AVG: %20.16e\n", sum/((o+1)*m*n));
    53:           
    54:           }


