import macros
import strutils

dumpAstGen:
    type o = object
        a: int

macro struct(head: untyped, vars: nnkRecList): untyped =
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

expandMacros:
    struct UDPHeader:
        src: uint16

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

echo o[]

# 18446463700433086396