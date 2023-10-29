all: hello

LIBDIR=/Library/Developer/CommandLineTools/SDKs/MacOSX11.3.sdk/usr/lib/

hello: hello.o
	ld -no_pie hello.o -macos_version_min 11.0 -L$(LIBDIR) -lSystem -o hello

hello.o: hello.asm
	nasm -fmacho64 hello.asm

clean:
	rm -f hello.o hello
