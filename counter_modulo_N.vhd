LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY counter_modulo_N IS
    PORT (
        clk        : IN  STD_LOGIC;
        rst        : IN  STD_LOGIC;
        ena        : IN  STD_LOGIC;
        endCounter : OUT STD_LOGIC;
        q          : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
    );
END ENTITY counter_modulo_N;

ARCHITECTURE behavioral OF counter_modulo_N IS
    SIGNAL count_reg : UNSIGNED(3 DOWNTO 0) := (OTHERS => '0');
    CONSTANT MAX_COUNT : UNSIGNED(3 DOWNTO 0) := "1001"; 
BEGIN
    counter_process: PROCESS (clk, rst)
    BEGIN
        IF rst = '1' THEN
            count_reg <= (OTHERS => '0');
        ELSIF rising_edge(clk) THEN
            IF ena = '1' THEN
                IF count_reg = MAX_COUNT THEN
                    count_reg <= (OTHERS => '0');
                ELSE
                    count_reg <= count_reg + 1;
                END IF;
            END IF;
        END IF;
    END PROCESS;

    endCounter <= '1' WHEN count_reg = MAX_COUNT ELSE '0';
    q <= STD_LOGIC_VECTOR(count_reg);
END ARCHITECTURE behavioral;