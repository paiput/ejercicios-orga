4. Traducir de código máquina a ensamblador de MIPS: `0x01095022`.
```
0000
0001
0000
1001
0101
0000
0010
0010
```

```
  op      rs      rt      rd    shamt   funct
000000   01000   01001   01010  00000   100010
----__   __---   -____   ----_  ___--   --____

decimal:
op   rs   rt   rd   shamt   funct
0    8    9    10   0       34
```

```
sub $t2, $t0, $t1

sub     $t2,   $t0,   $t1
funct   rd     rs     rt
```
