#CC = ncc
CC = /opt/nec/ve/bin/ncc

VE_EXEC=/opt/nec/ve/bin/ve_exec
FTRACE=/opt/nec/ve/bin/ftrace

CCFLAGS= -O3 -Wobsolescent -Wextension -Wall -std=gnu11 -ftrace -report-all -fdiag-vector=3 -lm -mvector-packed --help
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

displayproginfo:
	@echo " "
	@echo "PROGINFO"
	@echo " "
	${VE_EXEC} ./test.x 

displayftrace:
	@echo " "
	${FTRACE} -f ./ftrace.out

profile: displayproginfo displayftrace
