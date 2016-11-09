
-- VHDL Instantiation Created from source file PSR.vhd -- 17:12:37 11/04/2016
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT PSR
	PORT(
		rst : IN std_logic;
		clk : IN std_logic;
		nzvc : IN std_logic_vector(3 downto 0);
		ncwp : IN std_logic;          
		cwp : OUT std_logic;
		icc : OUT std_logic_vector(3 downto 0);
		carry : OUT std_logic
		);
	END COMPONENT;

	Inst_PSR: PSR PORT MAP(
		rst => ,
		clk => ,
		nzvc => ,
		ncwp => ,
		cwp => ,
		icc => ,
		carry => 
	);


