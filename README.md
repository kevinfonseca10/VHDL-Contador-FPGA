# VHDL - Contadores Digitales para FPGA

## Descripción

Este repositorio contiene la implementación en VHDL de tres tipos de contadores digitales de 4 bits, diseñados para ser sintetizados en una tarjeta FPGA Terasic DE0 con un chip Altera Cyclone III. El proyecto fue desarrollado como parte del **Taller de Flip-Flops y Contadores** del curso de Diseño de Sistemas Digitales en la Pontificia Universidad Javeriana.

Cada contador fue diseñado, simulado en ModelSim y probado físicamente en la FPGA.

---

## Características

Se implementaron tres módulos de contador independientes:

* **Contador Ascendente (0-15):** Un contador *free-run* de 4 bits que cuenta de `0x0` a `0xF` y se reinicia.
* **Contador Descendente (15-0):** Una modificación del contador anterior para realizar una cuenta descendente de `0xF` a `0x0`.
* **Contador Controlado (0-9):** Un contador BCD que cuenta de 0 a 9, se reinicia y genera una señal `endCounter` al alcanzar la cuenta máxima.


## Características

Se implementaron tres módulos de contador independientes:

* **Contador Ascendente (0-15):** Un contador *free-run* de 4 bits que cuenta de `0x0` a `0xF` y se reinicia.
* **Contador Descendente (15-0):** Una modificación del contador anterior para realizar una cuenta descendente de `0xF` a `0x0`.
* **Contador Controlado (0-9):** Un contador BCD que cuenta de 0 a 9, se reinicia y genera una señal `endCounter` al alcanzar la cuenta máxima.

---

## Estructura del Repositorio

Este repositorio contiene 3 proyectos de Quartus independientes, organizados en las siguientes carpetas. Cada carpeta es un experimento autocontenido.

### 📁 `/controlado`
Contiene el proyecto para un contador BCD que cuenta de **0 a 9** y se reinicia.
* **Archivos VHDL:** `counter_modulo_N.vhd`, `contador_top.vhd`, `bin_to_sseg.vhd`
* **Configuración:** `counter_modulo_N.qsf`

### 📁 `/ascendente`
Contiene el proyecto para un contador binario *free-run* que cuenta de **0 a 15 (F)**.
* **Archivos VHDL:** `counter_ascendente.vhd`, `contador_top_ascendente.vhd`, `bin_to_sseg.vhd`
* **Configuración:** `counter_ascendente.qsf`

### 📁 `/descendente`
Contiene el proyecto para un contador binario que cuenta de forma descendente de **15 (F) a 0**.
* **Archivos VHDL:** `counter_descendente.vhd`, `contador_top_descendente.vhd`, `bin_to_sseg.vhd`
* **Configuración:** `counter_descendente.qsf`

---


## Componentes VHDL Principales

* `counter_*.vhd`: Contiene la lógica de comportamiento de cada contador (la lógica secuencial).
* `bin_to_sseg.vhd`: Un decodificador combinacional que convierte la salida binaria de 4 bits del contador a las señales de un display de 7 segmentos.
* `contador_top_*.vhd`: La entidad de nivel superior de cada proyecto, que conecta el contador correspondiente con el decodificador y los puertos de la FPGA (diseño estructural).

---

## Hardware y Software

* **FPGA:** Terasic DE0
* **Chip:** Altera Cyclone III (EP3C16F484C6)
* **Software de Diseño:** Altera Quartus II v13.1
* **Software de Simulación:** ModelSim-Altera

---

## Autor(es)

* **Kevin Fonseca Escamilla**
* **Sofia Durán Guerrero**

