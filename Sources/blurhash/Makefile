CC=gcc
CFLAGS=-I.
DEPS = include/*.h
OBJ = encode.o decode.o 

%.o: %.c $(DEPS)
	$(CC) -c -o $@ $< $(CFLAGS)

blurhash: $(OBJ)
	$(CC) -o $@ $^ $(CFLAGS)

.PHONY: clean

clean:
	rm -f *.o blurhash
