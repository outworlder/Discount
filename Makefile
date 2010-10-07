# Temporary Makefile for the Discount egg
CSC=csc
CSI=csi
OBJECTS=bindings.o
FLAGS=-v
MAIN=discount.scm
TEST=test.scm
COMMA=,
EMPTY=
SPACE=$(EMPTY) $(EMPTY)
LIBRARIES=/usr/local/lib/libmarkdown.a

.PHONY: all clean test

all: discount

test:
	$(CSI) -s $(TEST)

discount: $(OBJECTS)
	$(CSC) $(FLAGS) -c $(MAIN) $(patsubst %.o,-uses %, $(OBJECTS))
	$(CSC) $(FLAGS) $(LIBRARIES) $^ $(MAIN:.scm=.o) -o $@

%.o: %.scm
	$(CSC) -unit $* -c $(FLAGS) $<

clean:
	rm -f *.o
	rm -f $(MAIN:.scm=)

