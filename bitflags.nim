import strutils
import math

type flags = distinct uint8

converter asFlag(i: int): flags = flags(i)
proc `$`*(f: flags): string =
    cast[int](f).toBin(8)

proc set*(f: var flags, n: range[0..7], x: bool): void =
    #echo (2^n * int(x))
    if x:
        f = flags(int8(f) or (1 shl n))
    else:
        f = flags(int8(f) and not (1 shl n))
proc get*(f: flags, n: range[0..7]): bool =
    return bool(int(f) and 2^n)

proc `and`*(f1, f2: flags): flags =
    flags(uint8(f1) and uint8(f2))
proc `or`*(f1, f2: flags): flags =
    flags(uint8(f1) or uint8(f2))
proc `not`*(f: flags): flags =
    flags(not uint8(f))
proc `xor`*(f1, f2: flags): flags =
    flags(uint8(f1) xor uint8(f2))

proc `+`*(f1: flags, f2: flags): flags =
    f1 or f2
proc `-`*(f1: flags, f2: flags): flags =
    f1 and not f2


if isMainModule:
    var f: flags = 0b00011001
    var g: flags = 0b00101100

    echo f + g
    echo f - g
    echo f and g

    f.set(1, false)
    echo f.get(3)

    echo f or flags(3)

    echo f
