----------------------------------------------------------------------------------
-- Engineer: Jorch Mendoza Ch
-- 
-- Create Date: 09.09.2020 12:28:55
-- Design Name: FSM 1 - LAB 2 PARTE 1
-- Module Name: FSM 1 - Behavioral
-- Project Name: GUIAS DE LABORATORIO
-- Description: Una Maquina de Estados con descripcion estructural, 
-- se prueban circuitos secuenciales.

-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
----------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

entity ESTA_DOS is
        port(clk,X: in std_logic;
        S,V: out std_logic;
        ESTADO: out std_logic_vector(2 downto 0);
        CLEAR: in std_logic
        );
end ESTA_DOS;

architecture Behavioral of ESTA_DOS is

type estados is (S0, S1, S2, S3, S4, S5, S6);
signal E_SIG,E_ACT: estados;

begin
PROC1: process(clk)
        begin
            if rising_edge(clk) then
                E_ACT <= E_SIG; 
            end if;
        end process;
    
PROC2: process(X,E_ACT)
        begin
            if CLEAR='1' then
               ESTADO<="000";
               S <= '0';
               V<='0';
               else 
                case E_ACT is
                        when S0 => ESTADO<="000";if X = '0' then E_SIG <= S1; S <= '1' ; V<='0'; else E_SIG <= S2; S <= '0' ; V<='0';end if;
                        when S1 => ESTADO<="001";if X = '0' then E_SIG <= S3; S <= '1' ; V<='0'; else E_SIG <= S4; S <= '0' ; V<='0';end if;
                        when S2 => ESTADO<="010";if X = '0' then E_SIG <= S4; S <= '0' ; V<='0'; else E_SIG <= S4; S <= '1' ; V<='0';end if;
                        when S3 => ESTADO<="011";if X = '0' then E_SIG <= S5; S <= '0' ; V<='0'; else E_SIG <= S5; S <= '1' ; V<='0';end if;
                        when S4 => ESTADO<="100";if X = '0' then E_SIG <= S5; S <= '1' ; V<='0'; else E_SIG <= S6; S <= '0' ; V<='0';end if;
                        when S5 => ESTADO<="101";if X = '0' then E_SIG <= S0; S <= '1' ; V<='0'; else E_SIG <= S0; S <= '1' ; V<='0';end if;
                        when S6 => ESTADO<="110";if X = '0' then E_SIG <= S0; S <= '1' ; V<='0'; else E_SIG <= S0; S <= '0' ; V<='1';end if;
                 end case;
            end if;
       
end process;

end Behavioral;