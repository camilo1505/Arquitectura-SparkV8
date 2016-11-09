
-- VHDL Instantiation Created from source file PSRModifier.vhd -- 17:13:13 11/04/2016
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT PSRModifier
	PORT(
		ALUResult : IN std_logic_vector(31 downto 0);
		oper131 : IN std_logic;
		oper231 : IN std_logic;
		rst : IN std_logic;
		ALUOP : IN std_logic_vector(5 downto 0);          
		nzvc : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;

	Inst_PSRModifier: PSRModifier PORT MAP(
		ALUResult => ,
		oper131 => ,
		oper231 => ,
		rst => ,
		ALUOP => ,
		nzvc => 
	);


