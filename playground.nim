echo """
Error: invalid arguments.
Syntax:
"""

echo ord(fmRead)
echo ord(fmWrite)
echo ord(fmReadWrite)

echo 3 / 2

import strutils

let size: int64 = 0x0123456789abcdef

let
    high32: uint32 = uint32(size.shr(32))
    low32: uint32 = uint32(size)

echo high32.toHex()
echo low32.toHex()

var a = 50

let p: ptr int = a.addr

echo cast[int](p)
echo p[]

echo cstring("hello").len