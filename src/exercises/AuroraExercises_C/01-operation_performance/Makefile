CC = ncc
CCFLAGS= -O3 -Wobsolescent -Wextension -Wall -std=gnu11 -ftrace -report-all -fdiag-vector=3 -lm
all: test.x

test.x: test.o
	$(CC) $(CCFLAGS) -o $@ $^

test.o: test.c
	$(CC) $(CCFLAGS) -c $<

.PHONY: clean distclean

clean:
	-rm *.o *.L ftrace.out

distclean: clean
	-rm *.x
