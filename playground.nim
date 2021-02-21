asm ".loop:"
{.emit: """asm("nop");"""}
echo "hello"
asm "jmp .loop"