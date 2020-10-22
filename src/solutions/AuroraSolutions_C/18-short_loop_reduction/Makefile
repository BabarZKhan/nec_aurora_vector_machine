CC = ncc
CCFLAGS= -O3 -Wobsolescent -Wextension -Wall -std=gnu11 -ftrace -report-all -fdiag-vector=3
all: test1.x test2.x test3.x test4.x

test1.x: test.o vec1.o
	$(CC) $(CCFLAGS) -o $@ $^
test2.x: test.o vec2.o
	$(CC) $(CCFLAGS) -o $@ $^
test3.x: test.o vec3.o
	$(CC) $(CCFLAGS) -o $@ $^
test4.x: test.o vec4.o
	$(CC) $(CCFLAGS) -o $@ $^

test.o: test.c vec.h
	$(CC) $(CCFLAGS) -c $<

vec1.o: vec1.c 
	$(CC) $(CCFLAGS) -c $<
vec2.o: vec2.c 
	$(CC) $(CCFLAGS) -c $<
vec3.o: vec3.c 
	$(CC) $(CCFLAGS) -c $<
vec4.o: vec4.c 
	$(CC) $(CCFLAGS) -c $<

.PHONY: clean distclean

clean:
	-rm *.o ftrace.out

distclean: clean
	-rm *.x
