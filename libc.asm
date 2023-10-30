; call a libc function

    global      _main
    extern      _puts

    section     .text

_main:
    push    rbx
    lea     rdi, [rel msg]
    call    _puts
    pop     rbx
    ret

    section .data

msg     db      'Hello, world!'
