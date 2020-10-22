#include <stdio.h>
#include "dims.h"
#include "subs.h"

int main () {
  
  double a[l*m*n], b[l*m*n];
  int idx;
  
  init(a);

  for (int k=0; k<n; k++) {
    for (int j=0; j<m; j++) {
      for (int i=0; i<l; i++) {
        idx = k*m*l+j*l+i;
        b[idx] = a[idx]/3.0;
      }
    }
  }

  for (int p=1; p<=10000; p++) {
    sub1(a, b);
    sub2(a, b, l, m, n);
    sub3(a, b, l, m-1, n);
    sub4(a, b);
  }
   
  double minval = a[0]+b[0];
  double maxval = a[0]+b[0];
  double sum = 0;
  for (int k=0; k<n; k++) {
    for (int j=0; j<m; j++) {
      for (int i=0; i<l; i++) {
        idx = k*m*l+j*l+i;
        if (a[idx]+b[idx] < minval) {
          minval = a[idx]+b[idx];
        } 
        if (a[idx]+b[idx] > maxval) {
          maxval = a[idx]+b[idx];
        }
        sum += a[idx]+b[idx];
      }
    }
  }
  printf("MIN: %20.16e\n", minval);
  printf("MAX: %20.16e\n", maxval);
  printf("AVG: %20.16e\n", sum/(2.0*l*m*n));
  
  return 0;
}
