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

entity FSM_TB is
end FSM_TB;

architecture Behavioral of FSM_TB is

component ESTA_DOS
        port(clk,X: in std_logic;
        S,V: out std_logic;
        ESTADO: out std_logic_vector(2 downto 0);
        CLEAR: in std_logic);
end component;

signal CLEARs: std_logic:='0';
signal clks: std_logic := '1';
signal Xs,Ss,Vs: std_logic;
signal ESTADOS: std_logic_vector(2 downto 0);

begin
    DUT: ESTA_DOS port map (
        CLEAR=>CLEARs,
        clk=>clks,
        S=>Ss,
        V=>Vs,
        X=>Xs,
        ESTADO=>ESTADOS);
        clks<= not clks after 5 ns;

process
    begin
        Xs<='1','0'after 10 ns, '1'after 20 ns,'1'after 30 ns;
        CLEARs<='0','1' after 200 ns;
        wait;
end process;

end Behavioral;
