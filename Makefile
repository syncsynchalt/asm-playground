all: hello triangle

LIBDIR=/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/lib/
LDFLAGS=-e start -static -macos_version_min 11.0

hello: hello.o
	ld $(LDFLAGS) -o $@ $^

triangle: triangle.o
	ld $(LDFLAGS) -o $@ $^

%.o: %.asm
	nasm -fmacho64 $^

clean:
	rm -f hello.o hello
