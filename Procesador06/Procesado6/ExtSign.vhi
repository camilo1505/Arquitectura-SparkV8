
-- VHDL Instantiation Created from source file ExtSign.vhd -- 17:15:19 11/04/2016
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT ExtSign
	PORT(
		Ext_in : IN std_logic_vector(12 downto 0);          
		Ext_out : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	Inst_ExtSign: ExtSign PORT MAP(
		Ext_in => ,
		Ext_out => 
	);


