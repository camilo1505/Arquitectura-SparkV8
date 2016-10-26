
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY TB_Sumador IS
END TB_Sumador;
 
ARCHITECTURE behavior OF TB_Sumador IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Sumador
    PORT(
         A : IN  std_logic_vector(31 downto 0);
         B : IN  std_logic_vector(31 downto 0);
         C : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(31 downto 0) := (others => '0');
   signal B : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal C : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Sumador PORT MAP (
          A => A,
          B => B,
          C => C
        );
 

   -- Stimulus process
   stim_proc: process
   begin		
      A <= "00000000000000000000000000000001";
		B <= "00000000010000000001000000000001";
      wait for 40 ns;
		A <= "00000000000000000000001000110110";
		B <= "00000000000000000000000000000001";


      wait;
   end process;

END;
