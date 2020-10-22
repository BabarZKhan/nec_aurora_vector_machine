CC = ncc
CCFLAGS= -O3 -Wobsolescent -Wextension -Wall -ftrace -report-all -finline-functions -fdiag-vector=3 -fno-outerloop-unroll -lm
all: test.x

test.x: test.o dims.o subs.o
	$(CC) $(CCFLAGS) -o $@ $^

test.o: test.c dims.h subs.h
	$(CC) $(CCFLAGS) -c $<

dims.o: dims.c
	$(CC) $(CCFLAGS) -c $<

subs.o: subs.c dims.h
	$(CC) $(CCFLAGS) -c $<

.PHONY: clean distclean

clean:
	-rm *.o *.L ftrace.out

distclean: clean
	-rm *.x
