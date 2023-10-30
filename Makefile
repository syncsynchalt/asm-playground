all: hello triangle libc

LIBDIR=/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/lib/
LDFLAGS=-e start -static -macos_version_min 11.0

hello: hello.o
	ld $(LDFLAGS) -o $@ $^

triangle: triangle.o
	ld $(LDFLAGS) -o $@ $^

libc: libc.o
	cc -Wall -o $@ $^

%.o: %.asm
	nasm -fmacho64 $^

clean:
	rm -f *.o hello libc
