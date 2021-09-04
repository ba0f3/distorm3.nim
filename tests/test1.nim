# This is just an example to get you started. You may wish to put all of your
# tests into a single file, or separate them into multiple `test1`, `test2`
# etc. files (better names are recommended, just make sure the name starts with
# the letter 't').
#
# To run these tests, simply execute `nimble test`.

import unittest

import distorm3
test "decode":
  var
    res: DecodeResult
    decodedInstructions: array[10, DecodedInst]
    decodedInstructionsCount = 0'u32
    offset: uint = 0
    buf = [byte 0xfd, 0xf3, 0xb8, 0x45, 0x49, 0x56, 0xed, 0xb3, 0x20, 0x0a, 0xc2, 0x7d, 0x90, 0x26, 0x5c, 0xc8]

  res = distorm_decode(offset, addr buf, sizeof(buf).int32, Decode32Bits, addr decodedInstructions[0], sizeof(decodedInstructions).uint32, addr decodedInstructionsCount)
  assert res == DECRES_SUCCESS
  assert decodedInstructionsCount == 7
  for i in 0..<decodedInstructionsCount:
    echo decodedInstructions[i]

test "decompose":
  #proc test () {.used.} =
  #  echo "hello"
  var
    decodedInstructionsCount = 0'u32
    dInsts: array[10, DInst]
    buf = [byte 0xe9, 0x51, 0x34, 0x12, 0x00]
    ci = CodeInfo(
      codeOffset: 0x0,
      code: addr buf,
      codeLen: sizeof(buf),
      dt: Decode64Bits,
      features: DF_STOP_ON_RET
    )
  let res = distorm_decompose(addr ci, addr dInsts[0], sizeof(dInsts).uint32, addr decodedInstructionsCount)
  assert res == DECRES_SUCCESS
  for i in 0..<decodedInstructionsCount:
    echo dInsts[i].opcode

