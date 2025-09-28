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

El proyecto está organizado en tres carpetas, cada una conteniendo un proyecto de Quartus completo y funcional:

/
├── 📁 ascendente/
│   ├── counter_ascendente.vhd
│   ├── contador_top_ascendente.vhd
│   └── ... (archivos de proyecto y simulación)
│
├── 📁 descendente/
│   ├── counter_descendente.vhd
│   ├── contador_top_descendente.vhd
│   └── ... (archivos de proyecto y simulación)
│
└── 📁 controlado/
├── counter_modulo_N.vhd
├── contador_top.vhd
└── ... (archivos de proyecto y simulación)

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

