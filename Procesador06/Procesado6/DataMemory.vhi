
-- VHDL Instantiation Created from source file DataMemory.vhd -- 16:58:07 11/04/2016
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT DataMemory
	PORT(
		address : IN std_logic_vector(4 downto 0);
		dato : IN std_logic_vector(31 downto 0);
		WE : IN std_logic;
		rst : IN std_logic;          
		DataToMem : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	Inst_DataMemory: DataMemory PORT MAP(
		address => ,
		dato => ,
		WE => ,
		rst => ,
		DataToMem => 
	);


