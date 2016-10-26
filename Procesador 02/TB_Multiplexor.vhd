
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY TB_Multiplexor IS
END TB_Multiplexor;
 
ARCHITECTURE behavior OF TB_Multiplexor IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Multiplexor
    PORT(
         A : IN  std_logic_vector(31 downto 0);
         B : IN  std_logic_vector(31 downto 0);
         selector : IN  std_logic;
         Mux_out : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(31 downto 0) := (others => '0');
   signal B : std_logic_vector(31 downto 0) := (others => '0');
   signal selector : std_logic := '0';

 	--Outputs
   signal Mux_out : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Multiplexor PORT MAP (
          A => A,
          B => B,
          selector => selector,
          Mux_out => Mux_out
        );

 

   -- Stimulus process
   stim_proc: process
   begin		
      A <= "00000000000000000000001000110110";
		B <= "00000000100000000000000000110110";
		selector <= '1';
      wait for 40 ns;	
		selector <= '0';
      -- insert stimulus here 

      wait;
   end process;

END;
