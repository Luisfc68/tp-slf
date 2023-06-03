# TP Seminario de lenguajes formales
Este trabajo práctico consiste en la creación de la gramática de un analizador sintáctico la cual debe cumplir con unas condiciones dadas por la consigna. El requerimiento mínimo es que la gramática ofrezca suficientes herramientas para poder escribir el código de un programa que permita ingresar dos números, realizar una operación entre ellos y mostrar el resultado. Evitando errores como la división por cero.

## Requerimientos del proyecto
- Docker
- Una consola que soporte el comando `make`

## Correr el proyecto
1. `git clone https://github.com/Luisfc68/tp-slf.git`
2. `make env-build`
3. `make env-<windows|linux>`

## Usar el proyecto
En el contenedor que se crea al correr el proyecto hay tres comandos principales para trabajar, todos ellos explican su funcionamiento al usar la opción `--help`

- `build-grammar`: construye la gramática especificada, para ejecutar este comando hay que estar en un directorio que contenga un directorio llamado `grammars`
- `test-grammar`: analiza el archivo especificado con la gramática especificada, para ejecutar este comando hay que estar en un directorio que contenga a los directorios `grammars` e `inputs`
- `generate-tree`: analiza el archivo especificado con la gramática especificada y genera una salida que consiste en una imagen del árbol de derivación de dicha entrada, para ejecutar este comando hay que estar en un directorio que contenga a los directorios `grammars` e `inputs`

