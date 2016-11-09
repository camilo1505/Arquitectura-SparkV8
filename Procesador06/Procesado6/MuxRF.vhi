
-- VHDL Instantiation Created from source file MuxRF.vhd -- 17:17:21 11/04/2016
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT MuxRF
	PORT(
		rsd : IN std_logic_vector(5 downto 0);
		RegO7 : IN std_logic_vector(5 downto 0);
		rfDest : IN std_logic;          
		nRds : OUT std_logic_vector(5 downto 0)
		);
	END COMPONENT;

	Inst_MuxRF: MuxRF PORT MAP(
		rsd => ,
		RegO7 => ,
		rfDest => ,
		nRds => 
	);


