----------------------------------------------------------------------------------
-- Engineer: Jorch Mendoza Ch
-- 
-- Create Date: 09.09.2020 12:28:55
-- Design Name: ALU - LAB 1 PARTE 2
-- Module Name: ALU - Behavioral
-- Project Name: GUIAS DE LABORATORIO
-- Description: Un Alu de 3 Bits.
-- 

-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity ALU_TB is
end ALU_TB;

architecture Behavioral of ALU_TB is

component ALU
        Port (A,B: in std_logic_vector(3 downto 0); 
              Cin: in std_logic; 
              Control: in std_logic_vector(2 downto 0); 
              ALU_out: out std_logic_vector(3 downto 0); 
              Cout: out std_logic); 
end component;

signal As,Bs: STD_LOGIC_VECTOR(3 downto 0);
signal Cins: std_logic;
signal Controls: STD_LOGIC_VECTOR(2 downto 0);
signal ALU_outs: STD_LOGIC_VECTOR(3 downto 0);
signal Couts: STD_LOGIC;

begin

DUT: ALU port map (

Control => Controls,
A => As,
B => Bs,
Cin =>Cins,
ALU_out =>ALU_outs,
Cout => Couts);

process
    begin
    --SUMA
    Controls <= "000";    As <= "0011";    Bs <= "0011";    Cins <= '1';
    wait for 20 ns;
    
    --RESTA
    Controls <= "001";    As <= x"F";    Bs <= "0011";    Cins <= '1';
    wait for 20 ns;
    
    --A OR B
    Controls <= "010";    As <= "1000";    Bs <= "0011";    Cins <= '0';
    wait for 20 ns;
    
    --A AND B   
    Controls <= "011";    As <= "0011";    Bs <= "0100";    Cins <= '0';
    wait for 20 ns;
    
    --DESPLAZAMIENTO A LA IZQUIERDA  
    Controls <= "100";    As <= "1110";    Cins <= '0';    
    wait for 20 ns;
    
    --DESPLAZAMIENTO A LA DERECHA  
    Controls <= "101";    As <= "1110";    Cins <= '0';   
     wait for 20 ns;
     
    --ROTACION A LA IZQUIERDA  
    Controls <= "110";    As <= "1110";    Cins <= '0';    
    wait for 20 ns;
    
    --ROTACION A LA DERECHA  
    Controls <= "111";    As <= "1110";    Cins <= '0';    
    wait;
    
end process;
end Behavioral;

