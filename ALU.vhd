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
use IEEE.NUMERIC_STD.ALL;    -- libreria para usar operaciones aritmerticas +,-

entity ALU is 

Port (A,B: in std_logic_vector(3 downto 0); 
    Cin: in std_logic; 
    Control: in std_logic_vector(2 downto 0); 
    ALU_out: out std_logic_vector(3 downto 0); 
    Cout: out std_logic);
end entity ALU;

architecture Behavioral of ALU is 

signal As,Bs: unsigned(3 downto 0); 
signal Cins: unsigned(3 downto 0); 
signal resultado: unsigned(3 downto 0);
signal vcry : unsigned(4 downto 0);--vector carry

begin  
    As<=unsigned(A);
    Bs<=unsigned(B);
    Cins<="000"& Cin;
    
    PROC1:process(As,Bs,Cins,Control) is
            begin
              case Control is 
                    when "000"=>resultado<=As + Bs + Cins;
                                vcry <= ('0' & As) + ('0' & Bs) + ('0' & Cins);     
                    when "001"=>resultado<=As - Bs - Cins;
                                vcry <= ('0' & As) - ('0' & Bs) - ('0' & Cins);         
                    when "010"=>resultado<=As OR Bs;--A or B                 
                    when "011"=>resultado<=As AND Bs;--A and B
                    when "100"=>resultado<=As sll 1;--Dezplazamiento de la izquierda 0011    0110
                    when "101"=>resultado<=As srl 1;--Dezplazamiento de la derecha  0011   0001
                    when "110"=>resultado<=As rol 1;--Rotacion a la izquierda  0011  0110 
                    when "111"=>resultado<=As ror 1;--Rotacion a la derecha 1001     1100
                    when others => resultado <= "ZZZZ";--Para otra combinacion realizara la suma
              end case;
    end process;
    
    WITH control SELECT
           Cout <=     vcry(4)     WHEN "000",
                       vcry(4)    WHEN "001",
                       '0'     WHEN OTHERS;
         
    ALU_out<= std_logic_vector(resultado);
    
end Behavioral;

