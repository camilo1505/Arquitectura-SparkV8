
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity Procesador6 is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
			  Result : out  STD_LOGIC_VECTOR(31 downto 0));
end Procesador6;

architecture Behavioral of Procesador6 is

COMPONENT Win_man
	PORT(
		rs1 : IN std_logic_vector(4 downto 0);
		rs2 : IN std_logic_vector(4 downto 0);
		rsd : IN std_logic_vector(4 downto 0);
		op : IN std_logic_vector(1 downto 0);
		op3 : IN std_logic_vector(5 downto 0);
		cwp : IN std_logic;          
		ncwp : OUT std_logic;
		srs1 : OUT std_logic_vector(5 downto 0);
		srs2 : OUT std_logic_vector(5 downto 0);
		RegO7 : OUT std_logic_vector(5 downto 0);
		srd : OUT std_logic_vector(5 downto 0)
		);
	END COMPONENT;
	
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
	
COMPONENT ALU
	PORT(
		A : IN std_logic_vector(31 downto 0);
		B : IN std_logic_vector(31 downto 0);
		carry : IN std_logic;
		ALUOP : IN std_logic_vector(5 downto 0);          
		ALUResult : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
COMPONENT ExtSign
	PORT(
		Ext_in : IN std_logic_vector(12 downto 0);          
		Ext_out : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
COMPONENT MuxRF
	PORT(
		rsd : IN std_logic_vector(5 downto 0);
		RegO7 : IN std_logic_vector(5 downto 0);
		rfDest : IN std_logic;          
		nRds : OUT std_logic_vector(5 downto 0)
		);
	END COMPONENT;
	
COMPONENT instructionMemory
	PORT(
		address : IN std_logic_vector(31 downto 0);
		reset : IN std_logic;          
		outInstruction : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

COMPONENT ProgramCounter
	PORT(
		PC_in : IN std_logic_vector(31 downto 0);
		rst : IN std_logic;
		clk : IN std_logic;          
		PC_out : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
COMPONENT Sumador
	PORT(
		A : IN std_logic_vector(31 downto 0);
		B : IN std_logic_vector(31 downto 0);          
		C : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
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
	
COMPONENT UC
	PORT(
		op : IN std_logic_vector(1 downto 0);
		op3 : IN std_logic_vector(5 downto 0);          
		ALUOP : OUT std_logic_vector(5 downto 0)
		);
	END COMPONENT;

	
COMPONENT SEU22
	PORT(
		Ext_in : IN std_logic_vector(21 downto 0);          
		Ext_out : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
COMPONENT SEU30
	PORT(
		Ext_in : IN std_logic_vector(29 downto 0);          
		Ext_out : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
COMPONENT MuxRFSource
	PORT(
		DataMemory : IN std_logic_vector(31 downto 0);
		AluResult : IN std_logic_vector(31 downto 0);
		PC : IN std_logic_vector(31 downto 0);
		RFSource : IN std_logic_vector(1 downto 0);          
		DataOut : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
COMPONENT MuxPC
	PORT(
		PCdisp30 : IN std_logic_vector(31 downto 0);
		PCdisp22 : IN std_logic_vector(31 downto 0);
		PC1 : IN std_logic_vector(31 downto 0);
		Address : IN std_logic_vector(31 downto 0);
		PCSource : IN std_logic_vector(1 downto 0);          
		PCout : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
COMPONENT MuxAlu
	PORT(
		crs2 : IN std_logic_vector(31 downto 0);
		imm : IN std_logic_vector(31 downto 0);
		selector : IN std_logic;          
		op2 : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
COMPONENT DataMemory
	PORT(
		address : IN std_logic_vector(4 downto 0);
		dato : IN std_logic_vector(31 downto 0);
		WE : IN std_logic;
		rst : IN std_logic;          
		DataToMem : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

signal smuxnpc,snpcpc,spcim,sins : std_logic_vector(31 downto 0);
signal sro7,nrs1,nrs2,nrd,ssrd : std_logic_vector(5 downto 0);
signal snzvc : std_logic_vector(3 downto 0);
signal scwp,sncwp,scarry : std_logic;

begin

Inst_Win_man: Win_man PORT MAP(
		rs1 => sins(18 downto 14) ,
		rs2 => sins(4 downto 0),
		rsd => sins(29 downto 25),
		op => sins(31 downto 30),
		op3 => sins(24 downto 19),
		cwp => scwp,
		ncwp => sncwp,
		srs1 => nrs1,
		srs2 => nrs2,
		RegO7 => sro7,
		srd => ssrd
	);
	
Inst_PSR: PSR PORT MAP(
		rst => reset,
		clk => clk,
		nzvc => ,
		ncwp => sncwp ,
		cwp => scwp,
		icc => ,
		carry => 
	);
	 
Inst_PSRModifier: PSRModifier PORT MAP(
		ALUResult => ,
		oper131 => ,
		oper231 => ,
		rst => ,
		ALUOP => ,
		nzvc => 
	);


Inst_ALU: ALU PORT MAP(
		A => ,
		B => ,
		carry => ,
		ALUOP => ,
		ALUResult => 
	);

Inst_ExtSign: ExtSign PORT MAP(
		Ext_in => sins(12 downto 0),
		Ext_out => ses
	);

Inst_MuxRF: MuxRF PORT MAP(
		rsd => ,
		RegO7 => ,
		rfDest => ,
		nRds => 
	);
	
Inst_ProgramCounter: ProgramCounter PORT MAP(
		PC_in => ,
		rst => ,
		clk => ,
		PC_out =>
	);

Inst_NProgramCounter: ProgramCounter PORT MAP(
		PC_in => ,
		rst => ,
		clk => ,
		PC_out => 
	);
	
Inst_Sumador22: Sumador PORT MAP(
		A => ,
		B => ,
		C => 
	);
	
Inst_Sumador30: Sumador PORT MAP(
		A => ,
		B => ,
		C => 
	);
	
Inst_Sumador1bit: Sumador PORT MAP(
		A => ,
		B => ,
		C => 
	);
	
	
Inst_instructionMemory: instructionMemory PORT MAP(
		address => spcim,
		reset => reset,
		outInstruction => sins
	);
	
Inst_RF: RF PORT MAP(
		rs1 => nrs1,
		rs2 => nrs2,
		rd => nrd,
		rst => ,
		we => ,
		DataWrite => ,
		Crs1 => ,
		Crd => ,
		Crs2 => 
	);
	
Inst_UC: UC PORT MAP(
		op => ,
		op3 =>,
		ALUOP => 
	);
	
Inst_SEU22: SEU22 PORT MAP(
		Ext_in => ,
		Ext_out => 
	);
	
Inst_SEU30: SEU30 PORT MAP(
		Ext_in => ,
		Ext_out => 
	);
	
Inst_MuxRFSource: MuxRFSource PORT MAP(
		DataMemory => ,
		AluResult => ,
		PC => ,
		RFSource => ,
		DataOut => 
	);
	
Inst_MuxPC: MuxPC PORT MAP(
		PCdisp30 => ,
		PCdisp22 => ,
		PC1 => ,
		Address => ,
		PCSource => ,
		PCout => 
	);
	
Inst_MuxAlu: MuxAlu PORT MAP(
		crs2 => ,
		imm => ,
		selector => ,
		op2 => 
	);

Inst_MuxRF: MuxRF PORT MAP(
		rsd => ssrd,
		RegO7 => sro7,
		rfDest => nrd,
		nRds => 
	);


Inst_DataMemory: DataMemory PORT MAP(
		address => ,
		dato => ,
		WE => ,
		rst => ,
		DataToMem => 
	);

	
Result<=Resultado;
end Behavioral;

