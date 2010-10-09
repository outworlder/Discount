# Temporary Makefile for the Discount egg
CSC=csc
CSI=csi
OBJECTS=discount.o
CFLAGS=
FLAGS=-setup-mode
TEST=test.o
COMMA=,
EMPTY=
SPACE=$(EMPTY) $(EMPTY)
LIBRARIES=-L/usr/local/lib -lmarkdown

.PHONY: all clean test

all: test

test: $(TEST)
	$(CSC) $(FLAGS) $(LIBRARIES) $(TEST) -o $@
	./test

# discount: $(OBJECTS)
# 	$(CSC) $(FLAGS) $(LIBRARIES) $(OBJECTS) -o $@

%.o: %.scm
	$(CSC) $(FLAGS) -c $<  -C "$(CFLAGS)"

clean:
	rm -f *.o
	rm -f $(MAIN:.scm=)

