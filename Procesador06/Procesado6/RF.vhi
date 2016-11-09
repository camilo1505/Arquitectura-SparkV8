
-- VHDL Instantiation Created from source file RF.vhd -- 17:24:25 11/04/2016
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT RF
	PORT(
		rs1 : IN std_logic_vector(5 downto 0);
		rs2 : IN std_logic_vector(5 downto 0);
		rd : IN std_logic_vector(5 downto 0);
		rst : IN std_logic;
		we : IN std_logic;
		DataWrite : IN std_logic_vector(31 downto 0);          
		Crs1 : OUT std_logic_vector(31 downto 0);
		Crd : OUT std_logic_vector(31 downto 0);
		Crs2 : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	Inst_RF: RF PORT MAP(
		rs1 => ,
		rs2 => ,
		rd => ,
		rst => ,
		we => ,
		DataWrite => ,
		Crs1 => ,
		Crd => ,
		Crs2 => 
	);


