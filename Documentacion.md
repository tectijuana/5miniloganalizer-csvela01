# Mini Log Analyzer en ARM64
## Velazquez Guevara Yahir Antonio 21212061
# Descripción

Este proyecto implementa un analizador de logs en **ensamblador ARM64 bajo Linux**.
El programa procesa códigos HTTP desde un archivo de entrada y detecta la ocurrencia de tres errores consecutivos.

---

# Objetivo

Desarrollar un programa en bajo nivel que:

* Lea datos desde un archivo (`logs.txt`)
* Procese números en formato ASCII
* Detecte errores HTTP (≥ 400)
* Identifique **3 errores consecutivos**
* Imprima los errores detectados
* Genere una alerta al cumplirse la condición

## Variante D
Detectar tres errores consecutivos.

# Tecnologías utilizadas

* Ensamblador ARM64
* Syscalls de Linux
* GNU Assembler (`as`)
* Linker (`ld`)
* Makefile
* Git y GitHub

---

#  Estructura del proyecto

```text
.
├── src/
│   ├── analyzer.s
│   └── logs.txt
├── Makefile
├── README.md
└── .gitignore
```

---

# Compilación y ejecución

### Compilar

```bash
make
```

### Ejecutar

```bash
make run
```

---

# Conjunto de datos utilizado

```text
100
101
102
103
200
201
202
203
204
205
206
207
208
226
300
301
302
303
304
305
307
308
400
401
402
403
404
405
406
407
408
409
410
411
412
413
414
415
416
417
418
421
422
423
424
425
426
428
429
431
451
500
501
502
503
504
505
506
507
508
510
511
```

---

# Análisis

El conjunto de datos incluye todos los rangos de códigos HTTP:

* **1xx** → Informativos
* **2xx** → Éxito
* **3xx** → Redirección
* **4xx** → Error del cliente
* **5xx** → Error del servidor

El programa considera error cualquier código **≥ 400**, por lo que detecta correctamente errores de cliente y servidor.

---

# Ejemplo de salida

```text
400
401
402
ALERTA: 3 errores consecutivos
```

---

## Funcionamiento del programa

1. **Lectura de datos**

   * Se usa la syscall `read` para cargar el archivo en memoria.

2. **Parseo de números**

   * Conversión manual de ASCII a entero.
   * Construcción del número dígito por dígito.

3. **Evaluación**

   * Si el número ≥ 400 → error.
   * Se incrementa un contador de errores consecutivos.

4. **Detección**

   * Si el contador llega a 3 → se activa la alerta.

5. **Salida**

   * Se imprimen los errores usando la syscall `write`.


# Conclusión

Este proyecto demuestra el uso de:

* Registros en ARM64
* Acceso a memoria
* Estructuras iterativas
* Saltos condicionales
* Conversión de datos
* Uso de syscalls en Linux

## Link del video
https://asciinema.org/a/zQKjqYQb95MPjYbk
