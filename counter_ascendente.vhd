LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY counter_ascendente IS
    PORT (
        clk : IN  STD_LOGIC;
        rst : IN  STD_LOGIC;
        ena : IN  STD_LOGIC;
        q   : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
    );
END ENTITY counter_ascendente;

ARCHITECTURE behavioral OF counter_ascendente IS
    SIGNAL count_reg : UNSIGNED(3 DOWNTO 0) := (OTHERS => '0');
BEGIN
    counter_process: PROCESS (clk, rst)
    BEGIN
        IF rst = '1' THEN
            count_reg <= (OTHERS => '0');
        ELSIF rising_edge(clk) THEN
            IF ena = '1' THEN
                count_reg <= count_reg + 1;
            END IF;
        END IF;
    END PROCESS;

    q <= STD_LOGIC_VECTOR(count_reg);
END ARCHITECTURE behavioral;