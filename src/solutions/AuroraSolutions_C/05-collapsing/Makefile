#CC = ncc
CC = /opt/nec/ve/bin/ncc

VE_EXEC=/opt/nec/ve/bin/ve_exec
FTRACE=/opt/nec/ve/bin/ftrace

AURORA_INC_PATH=/opt/nec/ve/veos/include
AURORA_LIB_PATH=/opt/nec/ve/veos/lib64

CCFLAGS= -O3 -Wobsolescent -Wextension -Wall -std=gnu11 -ftrace -p -report-all -fdiag-vector=3 -lm
all: test.x

test.x: test.o
	$(CC) $(CCFLAGS) -o $@ $^

test.o: test.c
	$(CC) $(CCFLAGS) -c $<

KERNEL_DIAGNOSTIC=-report-diagnostics -report-format
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
