2. Identificar qué unidades funcionales del datapath de MIPS intervienen en un `lw`, `sw`, `add`, `addi` y `beq`.

Para todas estas instrucciones las unidades funcionales que intervienen son:
  - PC (Program Counter)
  - Adder del PC
  - Instruction Memory (memoria de instrucciones)
  - Control (unidad de control)
  - Registers (memoria de registros)
  - ALU (Aritmetic Logic Unit)

Para el `add` solo intervienen las unidades funcionales mencionadas previamente.

Luego, para `lw` y `sw` intervienen también:
 - Sign-extend (extensor de signo)
 - Data memory (memoria de datos)

En el caso de `addi` solo interviene también el extensor de signo.

Y finalmente en el caso de `beq`, intervienen:
 - Sign-extend (extensor de signo)
 - Shift left 2
 - Adder para setear el _branch target_