
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 

 
ENTITY TBProcesador2 IS
END TBProcesador2;
 
ARCHITECTURE behavior OF TBProcesador2 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Procesador2
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         Result : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';

 	--Outputs
   signal Result : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant clk_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Procesador2 PORT MAP (
          clk => clk,
          reset => reset,
          Result => Result
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
		reset <= '1';
		wait for 40 ns;
		reset <= '0';
      wait;
   end process;

END;
