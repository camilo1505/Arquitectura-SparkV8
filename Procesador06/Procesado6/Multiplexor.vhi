
-- VHDL Instantiation Created from source file Multiplexor.vhd -- 17:15:38 11/04/2016
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT Multiplexor
	PORT(
		A : IN std_logic_vector(31 downto 0);
		B : IN std_logic_vector(31 downto 0);
		selector : IN std_logic;          
		Mux_out : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	Inst_Multiplexor: Multiplexor PORT MAP(
		A => ,
		B => ,
		selector => ,
		Mux_out => 
	);


