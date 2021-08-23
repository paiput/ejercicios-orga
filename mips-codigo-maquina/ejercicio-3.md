3. Traducir de ensamblador de MIPS a código máquina: `sw $t0, 1200($t1)`.

opcode sw = 0x2B = 00101011

rs = $t1
rt = $t0

```
  op      rs       rt          imm
101011   01001   01000   0000010010110000
----__   __---   -____   ----____----____
0xAD0908B0
  -_-_-_-_
```

```
sw   $t0,   1200($t1)
op   rt     immm  rs
```