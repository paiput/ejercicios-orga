# tiene que ser divisible por 4 siempre
# si es divisible por 4 y NO por 100 es bisiesto
# si es divisible por 100 y TAMBIEN por 400 es bisiesto
.data
msg: .asciiz "Ingrese un anio para saber si es bisiesto o no: "
msgIsLeapYear: .asciiz " es anio bisiesto\n"
msgIsNotLeapYear: .asciiz " no es anio bisiesto\n"

.text
.globl main
main:
  li $v0, 4 # codigo para imprimir string
  la $a0, msg # carga msg en $a0 para imprimirlo
  syscall # imprime el mensaje

  li $v0, 5 # codigo para leer input del usuario
  syscall # lee input del usuario

  move $t0, $v0 # guarda en $t0 el input del usuario
  rem $t1, $t0, 4 # $t1 = $t0 % 4
  beq $t1, $zero, step2 # if ($t1 == 0) goto step2
  j isNotLeapYear # else goto isNotLeapYear

step2:
  rem $t1, $t0, 100 # $t1 = $t0 % 100
  bne $t1, $zero, isLeapYear # if ($t0 != 0) goto isLeapYear
  j step3 # else goto isNotLeapYear

step3:
  rem $t1, $t0, 400 # $t1 = $t0 % 400
  beq $t0, $zero, isLeapYear # if ($t0 == 0) goto isLeapyear
  j isNotLeapYear # else goto isNotLeapYear

isNotLeapYear:
  li $v0, 1 # codigo para imprimir numero
  move $a0, $t0 # carga el valor de $t0 en $a0
  syscall # imprime el valor de $a0
  li $v0, 4 # codigo para imprimir string
  la $a0, msgIsNotLeapYear # carga el mensaje en $a0
  syscall # imprime el string
  j exit # goto exit

isLeapYear:
  li $v0, 1 # codigo para imprimir numero
  move $a0, $t0 # carga el valor de $t0 en $a0
  syscall # imprime el valor de $a0
  li $v0, 4 # codigo para imprimir string
  la $a0, msgIsLeapYear # carga el mensaje en $a0
  syscall # imprime el mensaje
  j exit # goto exit

exit:
  li $v0, 10 # codigo para cerrar el programa
  syscall # cierra el programa