SRC = $(wildcard *.c)
OBJ = $(SRC:%.c=%.o)
PROG = simplec

.PHONY: all clean

all: $(PROG)

$(PROG): $(OBJ)
	gcc -o $@ $^

%.o: %.c
	gcc -c $<

clean:
	rm -rf $(PROG) $(OBJ)
