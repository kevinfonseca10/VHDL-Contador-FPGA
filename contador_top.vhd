LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY contador_top IS
    PORT (
        clk     : IN  STD_LOGIC;
        rst     : IN  STD_LOGIC;
        ena     : IN  STD_LOGIC;
        HEX0    : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
        LEDR    : OUT STD_LOGIC_VECTOR(4 DOWNTO 0)
    );
END ENTITY contador_top;

ARCHITECTURE structural OF contador_top IS
    SIGNAL contador_salida : STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL fin_conteo_sig  : STD_LOGIC;

    COMPONENT counter_modulo_N IS
        PORT (
            clk        : IN  STD_LOGIC;
            rst        : IN  STD_LOGIC;
            ena        : IN  STD_LOGIC;
            endCounter : OUT STD_LOGIC;
            q          : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
        );
    END COMPONENT;

    COMPONENT bin_to_sseg IS
        PORT (
            bin  : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
            sseg : OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
        );
    END COMPONENT;

BEGIN
    mi_contador: counter_modulo_N
        PORT MAP (
            clk => clk,
            rst => rst,
            ena => ena,
            q   => contador_salida,
            endCounter => fin_conteo_sig
        );

    mi_decodificador: bin_to_sseg
        PORT MAP (
            bin  => contador_salida,
            sseg => HEX0
        );

    LEDR(3 DOWNTO 0) <= contador_salida;
    LEDR(4)          <= fin_conteo_sig;
END ARCHITECTURE structural;