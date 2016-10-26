
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 

 
ENTITY TBinstructionMemory IS
END TBinstructionMemory;
 
ARCHITECTURE behavior OF TBinstructionMemory IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT instructionMemory
    PORT(
         address : IN  std_logic_vector(31 downto 0);
         reset : IN  std_logic;
         outInstruction : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal address : std_logic_vector(31 downto 0) := (others => '0');
   signal reset : std_logic := '0';

 	--Outputs
   signal outInstruction : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: instructionMemory PORT MAP (
          address => address,
          reset => reset,
          outInstruction => outInstruction
        );

 

   -- Stimulus process
   stim_proc: process
   begin		
      
		address <= x"00000000";
      wait for 100 ns;	

      wait;
   end process;

END;
