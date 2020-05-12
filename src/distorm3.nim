when hostCPU == "i386":
  {.passC: "-DDISTORM_STATIC -include stdint.h".}

import os
const PATH = currentSourcePath.splitPath.head
{.compile: PATH & "/private/distorm/src/decoder.c".}
{.compile: PATH & "/private/distorm/src/distorm.c".}
{.compile: PATH & "/private/distorm/src/instructions.c".}
{.compile: PATH & "/private/distorm/src/insts.c".}
{.compile: PATH & "/private/distorm/src/mnemonics.c".}
{.compile: PATH & "/private/distorm/src/operands.c".}
{.compile: PATH & "/private/distorm/src/prefix.c".}
{.compile: PATH & "/private/distorm/src/textdefs.c".}

type
  DecodeType* = enum
    Decode16Bits
    Decode32Bits
    Decode64Bits

  DecodeResult* = enum
    DECRES_NONE
    DECRES_SUCCESS
    DECRES_MEMORYERR
    DECRES_INPUTERR
    DECRES_FILTERED

  ValuePtr* {.bycopy.} = object
    seg*: uint16
    off*: uint32

  ValueEx* {.bycopy.} = object
    i1*: uint32
    i2*: uint32

  CodeInfo* {.bycopy.} = object
    codeOffset*: uint
    addrMask*: uint
    nextOffset*: uint
    code*: ptr uint8
    codeLen*: cint
    dt*: DecodeType
    features*: cuint

  Value* {.bycopy, union.} = object
    sbyte*: int8
    byt*: uint8
    sword*: int16
    word*: uint16
    sdword*: int32
    dword*: uint32
    sqword*: int64
    qword*: uint64
    adr*: uint
    pptr*: ValuePtr
    ex*: ValueEx

  Operand* {.bycopy.} = object
    kind*: uint8
    index*: uint8
    size*: uint16

  WString* {.bycopy.} = object
    length*: cuint
    p*: array[48, char]

  DInst* {.bycopy.} = object
    imm*: Value
    disp*: uint64
    adr*: uint
    flags*: uint16
    unusedPrefixesMask*: uint16
    usedRegistersMask*: uint32
    opcode*: uint16
    ops*: array[4, Operand]
    opsNo*: uint8
    size*: uint8
    segment*: uint8
    base*: uint8
    scale*: uint8
    dispSize*: uint8
    meta*: uint16
    modifiedFlagsMask*: uint16
    testedFlagsMask*: uint16
    undefinedFlagsMask*: uint16

  DecodedInst* {.bycopy.} = object
    offset*: uint
    size*: cuint
    mnemonic*: WString
    operands*: WString
    instructionHex*: WString

proc `$`(ws: WString): string = $cast[cstring](unsafeAddr ws.p[0])
proc `$`(di: DecodedInst): string = $di.mnemonic & " " & $di.operands

when hostCPU == "i386":
  proc distorm_decode*(codeOffset: uint, code: pointer, codeLen: int, dt: DecodeType, res: ptr DecodedInst, maxInstructions: uint, usedInstructionsCount: ptr int): DecodeResult {.importc: "distorm_decode32", cdecl.}
  proc distorm_format*(ci: ptr CodeInfo, di: ptr DInst, res: ptr DecodedInst) {.importc: "distorm_format32", cdecl.}
else:
  proc distorm_decode*(codeOffset: uint, code: pointer, codeLen: int, dt: DecodeType, res: ptr DecodedInst, maxInstructions: uint, usedInstructionsCount: ptr int): DecodeResult {.importc: "distorm_decode64", cdecl.}
  proc distorm_format*(ci: ptr CodeInfo, di: ptr DInst, res: ptr DecodedInst) {.importc: "distorm_format64", cdecl.}

when isMainModule:
  var
    res: DecodeResult
    decodedInstructions: array[10, DecodedInst]
    decodedInstructionsCount = 0
    offset: uint = 0
    buf = [byte 0xfd, 0xf3, 0xb8, 0x45, 0x49, 0x56, 0xed, 0xb3, 0x20, 0x0a, 0xc2, 0x7d, 0x90, 0x26, 0x5c, 0xc8]

  res = distorm_decode(offset, addr buf, sizeof(buf), Decode32Bits, addr decodedInstructions[0], 10, addr decodedInstructionsCount)
  if res == DECRES_SUCCESS:
    for i in 0..<decodedInstructionsCount:
      let ins = decodedInstructions[i]
      echo ins
