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
    decodedInstructionsCount = 0
    offset: uint = 0
    buf = [byte 0xfd, 0xf3, 0xb8, 0x45, 0x49, 0x56, 0xed, 0xb3, 0x20, 0x0a, 0xc2, 0x7d, 0x90, 0x26, 0x5c, 0xc8]

  res = distorm_decode(offset, addr buf, sizeof(buf), Decode32Bits, addr decodedInstructions[0], 10, addr decodedInstructionsCount)
  assert res == DECRES_SUCCESS
  assert decodedInstructionsCount == 7
  for i in 0..<decodedInstructionsCount:
    echo decodedInstructions[i]

test "decompose":
  #proc test () {.used.} =
  #  echo "hello"
  var
    ci: CodeInfo
    decodedInstructionsCount = 0
    dInsts: array[10, DInst]
    buf = [byte 0xe9, 0x51, 0x34, 0x12, 0x00]
  #@ci.codeOffset = cast[uint](test)
  ci.codeOffset = 0x0
  ci.code = addr buf
  ci.codeLen = sizeof(buf)
  ci.dt = Decode32Bits
  ci.features = DF_STOP_ON_RET
  let res = distorm_decompose(addr ci, addr dInsts[0], 10, addr decodedInstructionsCount)
  assert res == DECRES_SUCCESS
  assert decodedInstructionsCount == 1
  echo dInsts[0]

