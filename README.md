# distorm3.nim
distorm3 disassembler wrapper for Nim


### Installation
```sh
# nimble install distorm3
```

### Usage
```nim
import distorm3

var
  decodedInstructionsCount = 0'u32
  decodedInsts: array[10, DInst]
  buf = [byte 0xe9, 0x51, 0x34, 0x12, 0x00]
  ci = CodeInfo(
    codeOffset: 0x0,
    code: addr buf,
    codeLen: sizeof(buf),
    dt: Decode64Bits,
    features: DF_STOP_ON_RET
  )
let res = distorm_decompose(addr ci, addr decodedInsts[0], sizeof(dInsts).uint32, addr decodedInstructionsCount)
assert res == DECRES_SUCCESS
for i in 0..<decodedInstructionsCount:
  echo decodedInsts[i].opcode
```
