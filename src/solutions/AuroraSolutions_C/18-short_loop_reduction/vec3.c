void do_comp(int m, int n, int o, double* A, double* B) {
  
  for (int j=0; j<n; j++) {
    // set up a 1-D array
    double s[m];
    for (int i=0; i<m; i++) s[i] = 0.0;
    #pragma _NEC outerloop_unroll(16)
    for (int k=0; k<o; k++) {
      for (int i=0; i<m; i++) {
        s[i] += A[j*m*o+i*o+k];
      }
    }
    // sum up B
    for (int i=0; i<m; i++) {
      B[j*m+i] += s[i];
    }
  }
}
