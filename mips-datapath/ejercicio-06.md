6. Marcar el camino crítico para las instrucciones `lw`, `sw`, `add` y `beq` en el diagrama del *datapath* sacado del libro de Patterson (el que está en el blog). El camino crítico es el camino más largo que recorre una instrucción de inicio a fin. Usar los tiempos de propagación del ejercicio 8.

|Instr Mem|Add|Mux|ALU|Reg File|Data Mem|Sign extend|Shift left 2|
|---|---|---|---|---|---|---|---|
|200ps|70ps|20ps|90ps|90ps|250ps|15ps|10ps|

### Camino de `lw`:

![datapath](./img/ej6a.png)

Tiempo total de ejecución = Instr Mem + Add + Mux + Mux + Sign extend + Mux + ALU + Data Mem + Mux + Reg File

Tiempo total de ejecución = 200ps + 70ps + 20ps + 20ps + 15ps + 20ps + 90ps + 250ps + 20ps + 90ps

Tiempo total de ejecución = 795ps

### Camino de `sw`