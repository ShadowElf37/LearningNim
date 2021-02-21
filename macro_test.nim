import macros
import strutils

macro struct(head: untyped, vars: untyped): untyped =
    #echo treeRepr(head)
    #echo treeRepr(vars)
    var recList = newNimNode(nnkRecList)

    for node in vars.children:
        node.expectKind({nnkCommand, nnkCall})
        node.expectMinLen(2)

        #for n in node.children:
        #    echo n.strVal
        case node.kind
        of nnkCommand:

            recList.add(newIdentDefs(
                node[1],
                node[0],
                newEmptyNode()
            ))

        of nnkCall:
            recList.add(newIdentDefs(
                node[0],
                node[1][0],
                newEmptyNode()
            ))
        else:
            discard

    result = nnkStmtList.newTree(
               nnkTypeSection.newTree(
                 nnkTypeDef.newTree(
                   head,
                   newEmptyNode(),
                   nnkObjectTy.newTree(
                     newEmptyNode(),
                     newEmptyNode(),
                     recList
                   )
                 )
               )
             )


struct UDPHeader:
    uint16 src
    uint16 dst
    uint16 length
    uint16 checksum

#[
type
  UDPHeader = object
    src: uint16
    dst: uint16
    length: uint16
    checksum: uint16
]#

var o = new UDPHeader

o.src = 0xA7BC
o.dst = 0x8273
o.length = 0x0100
o.checksum = 0xFFFF

echo cast[uint64](o[])

# 18446463700433086396