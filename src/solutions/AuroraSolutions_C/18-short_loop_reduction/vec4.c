const int vreg_len = 256;

void do_comp(int m, int n, int o, double* A, double* B) {
  
  // assign s to the vector registers
  double s[vreg_len];
  #pragma _NEC vreg(s)

  for (int j=0; j<n; j++) {
    // utilize the shortloop directive to help the compiler
    // optimize the vector register loops in this short case
    #pragma _NEC shortloop
    for (int i=0; i<m; i++) s[i] = 0.0;
    #pragma _NEC novector
    for (int k=0; k<o; k++) {
      #pragma _NEC shortloop
      for (int i=0; i<m; i++) {
        s[i] += A[j*m*o+i*o+k];
      }
    }
    // sum up B
    #pragma _NEC shortloop
    for (int i=0; i<m; i++) {
      B[j*m+i] += s[i];
    }
  }
}

void do_comp_general(int m, int n, int o, double* A, double* B) {
  
  // assign s to the vector registers
  double s[vreg_len];
  #pragma _NEC vreg(s)

  for (int is=0; is<n; is+=vreg_len) {
    int ie = (is+vreg_len<n)?is+vreg_len:n;
    for (int j=0; j<n; j++) {
      // utilize the shortloop directive to help the compiler
      // optimize the vector register loops in this short case
      #pragma _NEC shortloop
      for (int i=is; i<ie; i++) s[i-is] = 0.0;
      #pragma _NEC novector
      for (int k=0; k<o; k++) {
        #pragma _NEC shortloop
        for (int i=is; i<ie; i++) {
          s[i-is] += A[j*m*o+i*o+k];
        }
      }
      // sum up B
      #pragma _NEC shortloop
      for (int i=is; i<ie; i++) {
        B[j*m+i] += s[i-is];
      }
    }
  }
}
