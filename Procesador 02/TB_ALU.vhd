LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY TB_ALU IS
END TB_ALU;
 
ARCHITECTURE behavior OF TB_ALU IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ALU
    PORT(
         A : IN  std_logic_vector(31 downto 0);
         B : IN  std_logic_vector(31 downto 0);
         ALUOP : IN  std_logic_vector(5 downto 0);
         ALUResult : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(31 downto 0) := (others => '0');
   signal B : std_logic_vector(31 downto 0) := (others => '0');
   signal ALUOP : std_logic_vector(5 downto 0) := (others => '0');

 	--Outputs
   signal ALUResult : std_logic_vector(31 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ALU PORT MAP (
          A => A,
          B => B,
          ALUOP => ALUOP,
          ALUResult => ALUResult
        );
 

   -- Stimulus process
   stim_proc: process
   begin		
		A <= "00000000000000000000000000000001";
		B <= "00000000000000000000000000000010";
		ALUOP <= "000000";
      wait for 40 ns;
		
		ALUOP <= "000001";
      wait for 40 ns;

		ALUOP <= "000010";
      wait for 40 ns;

		ALUOP <= "000011";
      wait for 40 ns;
		
		ALUOP <= "000110";
      wait for 40 ns;	

		ALUOP <= "000111";
      wait for 40 ns;	

      -- insert stimulus here 

      wait;
   end process;

END;
