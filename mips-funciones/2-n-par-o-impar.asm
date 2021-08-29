.data
msg: .asciiz "Ingrese un numero, si el programa devuelve 1, es par, si devuelve 0, es impar: \n"

.text
.globl main
main:
  li $v0, 4 # codigo para imprimir string
  la $a0, msg # carga msg en $a0
  syscall # imprime msg

  li $v0, 5 # codigo para leer input del usuario
  syscall # lee input del usuario

  move $a0, $v0 # guarda el input en $a0
  jal funcIsEven # isLeapYearFunc($a0) $a0 contiene el valor que ingireso el usuario

  move $a0, $v0 # guarda en $a0 el valor de retorno de la funcion
  
  li $v0, 1 # codigo para imprimir numero
  syscall # imprime el numero

  li, $v0, 10 # codigo para cerrar el programa
  syscall # cierra el programa

funcIsEven:
  rem $v0, $a0, 2 # $v0 = $a0 % 2
  beq $v0, 0, isEven # if ($v0 == 0) goto isEven
  j isOdd # else goto isOdd

  isEven:
    li $v0, 1 # retorna 1
    jr $ra # va a la direccion de retorno
  
  isOdd:
    li $v0, 0 # retorna 0
    jr $ra # va a la direccin de retorno