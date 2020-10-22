void do_comp(int m, int n, int o, double* A, double* B) {
  
  for (int j=0; j<n; j++) {
    for (int i=0; i<m; i++) {
      // use the shortloop compiler directive to inform the compiler
      // that the next loop is shorter than 256 such that it can generate the appropriate 
      // reduction instructions
      #pragma _NEC shortloop
      for (int k=0; k<o; k++) {
        B[j*m+i] += A[j*m*o+i*o+k];
      }
    }
  }
}
