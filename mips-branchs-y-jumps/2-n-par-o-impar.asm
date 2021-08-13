# Escribir un programa en MIPS que decida si un número es par o no.
.data
msg: .asciiz "Ingrese un numero para saber si es par o impar: "
msgIsEven: .asciiz " es par\n"
msgIsOdd: .asciiz " es impar\n"

.text
.globl main
main:
  li $v0, 4 # codigo para imprimir string
  la $a0, msg # carga msg en $a0
  syscall # imprime msg

  li $v0, 5 # codigo para leer input del usuario
  syscall # lee input del usuario
  
  move $t0, $v0 # guarda en $t0 el input del usuario
  rem $t1, $t0, 2 # $t1 = $t0 % 2
  beq $t1, $zero, isEven # if ($t1 == 0) goto isEven
  j isOdd # else goto isOdd

isEven:
  li $v0, 1 # codigo para imprimir numero
  move $a0, $t0 # carga el valor de $t0 en $a0
  syscall # imprime el valor de $a0
  li $v0, 4 # codigo para imprimir string
  la $a0, msgIsEven # carga el mensaje en $a0
  syscall # imprime el string
  j exit # goto exit

isOdd:
  li $v0, 1 # codigo para imprimir numero
  move $a0, $t0 # carga el valor de $t0 en $a0
  syscall # imprime el valor de $a0
  li $v0, 4 # codigo para imprimir string
  la $a0, msgIsOdd # carga el mensaje en $a0
  syscall # imprime el string
  j exit # goto exit

exit:
  li $v0, 10 # codigo para cerrar el programa
  syscall # cierra el programa