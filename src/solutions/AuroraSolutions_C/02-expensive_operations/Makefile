CC =/opt/nec/ve/bin/ncc
CCFLAGS= -O3 -Wobsolescent -Wextension -Wall -std=gnu11 -ftrace -report-all -fdiag-vector=3 -fno-outerloop-unroll
all: test1.x test2.x

test1.x: test.o dims.o vec1.o
	$(CC) $(CCFLAGS) -o $@ $^

test2.x: test.o dims.o vec2.o
	$(CC) $(CCFLAGS) -o $@ $^

test.o: test.c dims.h vec.h
	$(CC) $(CCFLAGS) -c $<

vec2.o: vec2.c dims.h
	$(CC) $(CCFLAGS) -c $<

vec1.o: vec1.c dims.h
	$(CC) $(CCFLAGS) -c $<

dims.o: dims.c
	$(CC) $(CCFLAGS) -c $<

.PHONY: clean distclean

clean:
	-rm *.o ftrace.out

distclean: clean
	-rm *.x
