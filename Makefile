all: hello

hello: hello.o
	ld -no_pie hello.o -macos_version_min 10.7.0 -o hello

hello.o: hello.asm
	nasm -fmacho64 hello.asm

clean:
	rm -f hello.o hello
