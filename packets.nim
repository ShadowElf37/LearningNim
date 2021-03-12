type
    Field = object of RootObj

    Bit = object
        data {.bitsize: 1.}: uint
    BitField[Bits: static[int]] = object of Field
        data: array[Bits, Bit]

    ByteField[Bytes: static[int]] = object of Field
        data: array[Bytes * 8, Bit]

#type Packet = ref object
#    f1: ByteField[1]
#    f2: BitField[4]
#    f3: BitField[4]

proc compileByte(fields: varargs[BitField]): char =
    return 'c'

var f: BitField[2]
f.data = 0b10

discard compileByte(f)