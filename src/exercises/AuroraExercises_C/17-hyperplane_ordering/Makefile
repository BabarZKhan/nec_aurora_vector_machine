CC = ncc
CCFLAGS= -O3 -Wobsolescent -Wextension -Wall -ftrace -report-all -fdiag-vector=3 -fno-outerloop-unroll
all: test.x

test.x: test.o
	$(CC) $(CCFLAGS) -o $@ $^

test.o: test.c
	$(CC) $(CCFLAGS) -c $<

.PHONY: clean distclean

clean:
	-rm *.o ftrace.out

distclean: clean
	-rm *.x
