# Temporary Makefile for the Discount egg
CSC=csc
CSI=csi
OBJECTS=bindings.o discount.o
CFLAGS=
TEST=test.o
COMMA=,
EMPTY=
SPACE=$(EMPTY) $(EMPTY)
LIBRARIES=-L/usr/local/lib -lmarkdown

.PHONY: all clean test

all: test

test: $(OBJECTS) $(TEST)
	$(CSC) $(FLAGS) $(LIBRARIES) $(OBJECTS) $(TEST) -o $@
	./test

# discount: $(OBJECTS)
# 	$(CSC) $(FLAGS) $(LIBRARIES) $(OBJECTS) -o $@

%.o: %.scm
	$(CSC) -c $<  -C "$(CFLAGS)"

clean:
	rm -f *.o
	rm -f $(MAIN:.scm=)

