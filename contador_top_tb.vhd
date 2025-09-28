LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

-- La entidad del testbench siempre es vacía
ENTITY contador_top_tb IS
END ENTITY contador_top_tb;

ARCHITECTURE behavior OF contador_top_tb IS
    -- Componente a probar (Unit Under Test - UUT)
    COMPONENT contador_top IS
        PORT (
            clk     : IN  STD_LOGIC;
            rst     : IN  STD_LOGIC;
            ena     : IN  STD_LOGIC;
            HEX0    : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
            LEDR    : OUT STD_LOGIC_VECTOR(4 DOWNTO 0)
        );
    END COMPONENT;

    -- Señales para conectar al UUT
    SIGNAL tb_clk : STD_LOGIC := '0';
    SIGNAL tb_rst : STD_LOGIC;
    SIGNAL tb_ena : STD_LOGIC;
    SIGNAL tb_HEX0: STD_LOGIC_VECTOR(6 DOWNTO 0);
    SIGNAL tb_LEDR: STD_LOGIC_VECTOR(4 DOWNTO 0);

    -- Constante para el periodo del reloj (ej: 20 ns para 50 MHz)
    CONSTANT CLK_PERIOD : TIME := 20 ns;

BEGIN
    -- Instanciar la unidad bajo prueba
    UUT: contador_top 
        PORT MAP (
            clk  => tb_clk,
            rst  => tb_rst,
            ena  => tb_ena,
            HEX0 => tb_HEX0,
            LEDR => tb_LEDR
        );

    -- Proceso para generar el reloj
    clk_process: PROCESS
    BEGIN
        tb_clk <= '0';
        WAIT FOR CLK_PERIOD / 2;
        tb_clk <= '1';
        WAIT FOR CLK_PERIOD / 2;
    END PROCESS;

    -- Proceso para generar los estímulos de prueba
    stimulus_process: PROCESS
    BEGIN
        -- 1. Aplicar reset inicial
        tb_rst <= '1';
        tb_ena <= '0';
        WAIT FOR 40 ns; -- Esperar un par de ciclos

        -- 2. Quitar el reset y habilitar el conteo
        tb_rst <= '0';
        tb_ena <= '1';
        -- Esperar 12 ciclos de reloj (240 ns) para ver la cuenta pasar de 9 a 0
        WAIT FOR 240 ns; 

        -- 3. Deshabilitar el conteo para ver si se detiene
        tb_ena <= '0';
        WAIT FOR 100 ns;

        -- 4. Volver a habilitar el conteo
        tb_ena <= '1';
        WAIT FOR 100 ns;

        -- Detener la simulación
        WAIT;
    END PROCESS;

END ARCHITECTURE;