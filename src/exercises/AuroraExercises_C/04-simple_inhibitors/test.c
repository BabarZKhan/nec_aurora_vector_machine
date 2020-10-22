#include <ftrace.h>
#include <stdbool.h>
#include <string.h>
#include <stdio.h>

double disturb(double x);
void init(int n, double* a, double* b, char* mys);

int main() {

  int const n = 655360;
  int const m = 10000;
  int i, j;
  double a[n], b[n];
  double c[m*m];
  char mystring[10];
  bool keep_going;
  
  init(n,a,b,mystring);
  
  ftrace_region_begin("loop1");
  for (i=0; i<n; i++) {
    a[i] = disturb(a[i]);
  }
  ftrace_region_end("loop1");
  
  ftrace_region_begin("loop2");
  for (i=0; i<n; i++) {
    int thecase = 0;
    if (strcmp(mystring, "first") == 0) {
      thecase = 1;
    } else if (strcmp(mystring, "second") == 0) {
      thecase = 2;
    }
    switch(thecase) {
      case 1:
        a[i]=a[i]+2.0;
        break;
      case 2:
        b[i]=a[i]*2.1;
        break;
    }
  }
  ftrace_region_end("loop2");
  
  ftrace_region_begin("loop3");
  FILE* outfileh = fopen("dump.txt", "w");
  for (i=0; i<n; i++) {
    b[i] = 2.0*a[i];
    fprintf(outfileh, "%16.12f\n", b[i]);
  }
  fclose(outfileh);
  ftrace_region_end("loop3");
  
  ftrace_region_begin("loop4");
  i=0;
  keep_going = (i<n);
  while (keep_going) {
    b[i] = 2.0*a[i]*b[i];
    i++;
    keep_going = (i<n);
  }
  ftrace_region_end("loop4");
  
  for (j=0; j<m; j++) {
    for (i=0; i<m; i++) {
      c[j*m+i] = a[i]/42.0 + 137.0*b[j];
    }
  }
  ftrace_region_begin("loop5");
  for (j=0; j<m; j++) {
    for (i=1; i<m; i++) {
      c[j*m+i] = b[i]+0.01*c[j*m+(i-1)];
    }
    if (c[(j+1)*m] < 0.0) fprintf(stderr, "%16.12f\n", c[(j+1)*m]);
  }
  ftrace_region_end("loop5");

  double minval = c[0];
  double maxval = c[0];
  double sum = c[0];
  for (i=1; i<m*m; i++) {
    if (c[i] < minval) {
      minval = c[i];
    } 
    if (c[i] > maxval) {
      maxval = c[i];
    }
    sum += c[i];
  }
  printf("MIN: %20.16e\n", minval);
  printf("MAX: %20.16e\n", maxval);
  printf("AVG: %20.16e\n", sum/(m*m));

  return 0;
}

double disturb(double x) {
  return x+1;
}


void init(int n, double* a, double* b, char* mys) {
  for (int i=0; i<n; i++) a[i] = 2.0;
  for (int i=0; i<n; i++) b[i] = 0.0;

  strcpy(mys, "second");
}
