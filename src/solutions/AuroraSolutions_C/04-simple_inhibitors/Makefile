FC = ncc
FCFLAGS= -O3 -Wobsolescent -Wextension -Wall -std=gnu11 -ftrace -report-all -fdiag-vector=3 -fno-outerloop-unroll -finline-functions
all: test.x

test.x: test.o
	$(FC) $(FCFLAGS) -o $@ $^

test.o: test.c
	$(FC) $(FCFLAGS) -c $<

.PHONY: clean distclean

clean:
	-rm *.o ftrace.out dump.txt

distclean: clean
	-rm *.x
