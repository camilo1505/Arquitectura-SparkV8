
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_procesador6 IS
END tb_procesador6;
 
ARCHITECTURE behavior OF tb_procesador6 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Procesador6
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
   uut: Procesador6 PORT MAP (
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
