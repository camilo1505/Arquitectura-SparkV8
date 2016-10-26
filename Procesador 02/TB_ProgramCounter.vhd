
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
 
ENTITY TB_ProgramCounter IS
END TB_ProgramCounter;
 


ARCHITECTURE behavior OF TB_ProgramCounter IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ProgramCounter
    PORT(
         PC_in : IN  std_logic_vector(31 downto 0);
         rst : IN  std_logic;
         clk : IN  std_logic;
         PC_out : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal PC_in : std_logic_vector(31 downto 0) := (others => '0');
   signal rst : std_logic := '0';
   signal clk : std_logic := '0';

 	--Outputs
   signal PC_out : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ProgramCounter PORT MAP (
          PC_in => PC_in,
          rst => rst,
          clk => clk,
          PC_out => PC_out
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      PC_in <= "00000000000000000000000000000001";
		rst <= '0';
      wait for 40 ns;
		PC_in <= "00000000000000000000000010000011";
      wait for 40 ns;
		rst <= '1';
      wait;
   end process;

END;
