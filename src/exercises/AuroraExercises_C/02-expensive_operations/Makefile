CC = ncc
CCFLAGS= -O3 -Wobsolescent -Wextension -Wall -std=gnu11 -ftrace -report-all -fdiag-vector=3 -fno-outerloop-unroll
all: test.x

test.x: test.o dims.o vec.o
	$(CC) $(CCFLAGS) -o $@ $^

test.o: test.c dims.h vec.h
	$(CC) $(CCFLAGS) -c $<

vec.o: vec.c dims.h
	$(CC) $(CCFLAGS) -c $<

dims.o: dims.c 
	$(CC) $(CCFLAGS) -c $<

.PHONY: clean distclean

clean:
	-rm *.o *.L ftrace.out

distclean: clean
	-rm *.x
