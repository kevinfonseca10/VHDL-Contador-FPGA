LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY contador_top_ascendente IS
    PORT (
        clk     : IN  STD_LOGIC;
        rst     : IN  STD_LOGIC;
        ena     : IN  STD_LOGIC;
        HEX0    : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
        LEDR    : OUT STD_LOGIC_VECTOR(4 DOWNTO 0)
    );
END ENTITY contador_top_ascendente;

ARCHITECTURE structural OF contador_top_ascendente IS
    SIGNAL contador_salida : STD_LOGIC_VECTOR(3 DOWNTO 0);

    COMPONENT counter_ascendente IS
        PORT (
            clk : IN  STD_LOGIC;
            rst : IN  STD_LOGIC;
            ena : IN  STD_LOGIC;
            q   : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
        );
    END COMPONENT;

    COMPONENT bin_to_sseg IS
        PORT (
            bin  : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
            sseg : OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
        );
    END COMPONENT;

BEGIN
    mi_contador: counter_ascendente
        PORT MAP (
            clk => clk, rst => rst, ena => ena,
            q   => contador_salida
        );

    mi_decodificador: bin_to_sseg
        PORT MAP (
            bin  => contador_salida,
            sseg => HEX0
        );

    LEDR(3 DOWNTO 0) <= contador_salida;
    LEDR(4)          <= '0'; -- Mantenemos este LED apagado
END ARCHITECTURE structural;