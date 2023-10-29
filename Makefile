all: hello

LIBDIR=/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/lib/

hello: hello.o
	ld -e start -static -macos_version_min 11.0 -o hello hello.o

hello.o: hello.asm
	nasm -fmacho64 hello.asm

clean:
	rm -f hello.o hello
