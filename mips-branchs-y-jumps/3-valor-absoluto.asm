.data
msg: .asciiz "Ingrese un numero para saber su valor absoluto: " 
response: .asciiz "El valor absoluto es "

.text
.globl main
main:
  li $v0, 4 # codigo para imprimir string
  la $a0, msg # carga msg en $a0
  syscall # imprime el mensaje
  
  li $v0, 5 # codigo para leer input del usuario
  syscall # lee input del usuario
  move $t0, $v0 # guarda en $t0 el input del usuario

  bgez $t0, exit # if ($t0 >= 0) goto exit

loop:
  addi $t1, $t1, 1 # $t1 += 1
  addi $t0, $t0, 1 # $t0 += 1

  bne $t0, $zero, loop # if ($t0 != 0) goto loop

  add $t0, $t0, $t1 # else $t0 += $t1

exit:
  li $v0, 4 # codigo para imprimir string
  la $a0, response # carga response en $a0
  syscall # imprime el mensaje
  li $v0, 1 # codigo para imprimr numero
  move $a0, $t0 # mueve el valor de $t0 a $a0 para poder imprimirlo
  syscall # imprime el numero

  li $v0, 10 # codigo para cerrar el programa
  syscall # cierra el programa