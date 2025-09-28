LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

-- La entidad del testbench siempre es vacía
ENTITY contador_top_ascendente_tb IS
END ENTITY contador_top_ascendente_tb;

ARCHITECTURE behavior OF contador_top_ascendente_tb IS

    -- 1. Declarar el componente que vamos a probar (nuestro diseño completo)
    COMPONENT contador_top_ascendente IS
        PORT (
            clk     : IN  STD_LOGIC;
            rst     : IN  STD_LOGIC;
            ena     : IN  STD_LOGIC;
            HEX0    : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
            LEDR    : OUT STD_LOGIC_VECTOR(4 DOWNTO 0)
        );
    END COMPONENT;

    -- 2. Crear señales para conectar al componente
    SIGNAL tb_clk : STD_LOGIC := '0';
    SIGNAL tb_rst : STD_LOGIC;
    SIGNAL tb_ena : STD_LOGIC;
    SIGNAL tb_HEX0: STD_LOGIC_VECTOR(6 DOWNTO 0);
    SIGNAL tb_LEDR: STD_LOGIC_VECTOR(4 DOWNTO 0);

    -- Constante para definir el periodo del reloj
    CONSTANT CLK_PERIOD : TIME := 20 ns;

BEGIN

    -- 3. Instanciar el componente (Unit Under Test - UUT)
    UUT: contador_top_ascendente
        PORT MAP (
            clk  => tb_clk,
            rst  => tb_rst,
            ena  => tb_ena,
            HEX0 => tb_HEX0,
            LEDR => tb_LEDR
        );

    -- 4. Proceso para generar el reloj
    clk_process: PROCESS
    BEGIN
        tb_clk <= '0';
        WAIT FOR CLK_PERIOD / 2;
        tb_clk <= '1';
        WAIT FOR CLK_PERIOD / 2;
    END PROCESS;

    -- 5. Proceso para generar los estímulos (las pruebas)
    stimulus_process: PROCESS
    BEGIN
        -- Prueba 1: Reset Inicial
        tb_rst <= '1';
        tb_ena <= '0';
        WAIT FOR 40 ns; -- Esperar 2 ciclos de reloj

        -- Prueba 2: Conteo Completo (0 a F)
        tb_rst <= '0';
        tb_ena <= '1';
        -- Esperamos 17 ciclos (340 ns) para ver el ciclo completo de 0 a 15 y el reinicio a 0
        WAIT FOR 340 ns;

        -- Prueba 3: Pausar el conteo
        tb_ena <= '0';
        WAIT FOR 100 ns; -- El contador debe congelarse

        -- Prueba 4: Reanudar el conteo
        tb_ena <= '1';
        WAIT FOR 100 ns; -- El contador debe continuar desde donde se quedó

        -- Detener la simulación
        WAIT;
    END PROCESS;

END ARCHITECTURE;