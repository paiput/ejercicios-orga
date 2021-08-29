.data
promptMsg: .asciiz "Ingrese un anio, si el programa devuelve 1 es bisiesto, y si devuelve 0, no: \n"

.text
.globl main
main:
  li, $v0, 4 # codigo para imprimir texto
  la, $a0, promptMsg # carga el input en $a0
  syscall # lo imprime

  li, $v0, 5 # codigo para leer input
  syscall # lo lee

  move $a0, $v0 # guarda el input en $a0
  jal isLeapYearFunc # isLeapYearFunc($a0) $a0 contiene el valor que ingireso el usuario

  move $a0, $v0 # guarda en $a0 el retorno de la funcion

  li $v0, 1 # codigo para imprimir numero
  syscall # lo imprime

  li $v0, 10 # codigo para cerrar el programa
  syscall # lo cierra

isLeapYearFunc:
  rem $t0, $a0, 4 # $t1 = $t0 % 4
  beq $t0, $zero, step2 # if ($t1 == 0) goto step2
  j isNotLeapYear # else goto isNotLeapYear

  step2:
    rem $t0, $a0, 100 # $t1 = $t0 % 100
    bne $t0, $zero, isLeapYear # if ($t0 != 0) goto isLeapYear
    j step3 # else goto isNotLeapYear

  step3:
    rem $t0, $a0, 400 # $t1 = $t0 % 400
    beq $t0, $zero, isLeapYear # if ($t0 == 0) goto isLeapyear
    j isNotLeapYear # else goto isNotLeapYear

  isNotLeapYear:
    li $v0, 0 # retorna 0
    jr $ra # va a la direccion de retorno

  isLeapYear:
    li $v0, 1 # retorna 1
    jr $ra # va a la direccion de retorno