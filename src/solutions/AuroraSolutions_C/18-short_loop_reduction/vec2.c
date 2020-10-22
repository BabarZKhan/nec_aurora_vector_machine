void do_comp(int m, int n, int o, double* A, double* B) {
  
  for (int j=0; j<n; j++) {
    // interchange the i and k loop to prevent a reduction for the k loop
    // increase the unrolling (default 4) to something larger 
    #pragma _NEC outerloop_unroll(16)
    for (int k=0; k<o; k++) {
      for (int i=0; i<m; i++) {
        B[j*m+i] += A[j*m*o+i*o+k];
      }
    }
  }
}
