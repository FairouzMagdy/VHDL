library ieee;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity cla_16_tb is
end cla_16_tb;

architecture TB_ARCHITECTURE of cla_16_tb is
	-- Component declaration of the tested unit
	component cla_16
	port(
		A : in STD_LOGIC_VECTOR(15 downto 0);
		B : in STD_LOGIC_VECTOR(15 downto 0);
		Cin : in STD_LOGIC;
		S : out STD_LOGIC_VECTOR(15 downto 0);
		Cout : out STD_LOGIC;
		GII : out STD_LOGIC;
		PII : out STD_LOGIC );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal A : STD_LOGIC_VECTOR(15 downto 0);
	signal B : STD_LOGIC_VECTOR(15 downto 0);
	signal Cin : STD_LOGIC;
	-- Observed signals - signals mapped to the output ports of tested entity
	signal S : STD_LOGIC_VECTOR(15 downto 0);
	signal Cout : STD_LOGIC;
	signal GII : STD_LOGIC;
	signal PII : STD_LOGIC;

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : cla_16
		port map (
			A => A,
			B => B,
			Cin => Cin,
			S => S,
			Cout => Cout,
			GII => GII,
			PII => PII
		);

stim_proc: process
begin
wait for 10 ns;
 
A <= "0000000000000001";
B <= "0000000000000010";
Cin <= '0';
wait for 10 ns;
 
A <= "0000000000000101";
B <= "0000000000000011";
Cin <= '1';
wait for 10 ns;
 
A <= "0000000000001010";
B <= "0000000000000010";
Cin <= '0';
wait for 10 ns;
 
A <= "0000000000011010";
B <= "0000000000011110";
Cin <= '0';
wait for 10 ns;
 
A <= "0000000000011111";
B <= "0000001110000010";
Cin <= '0';
wait for 10 ns;
 
A <= "1111111111111111";
B <= "0000011000000010";
Cin <= '0'; 
wait;
end process;
end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_cla_16 of cla_16_tb is
	for TB_ARCHITECTURE
		for UUT : cla_16
			use entity work.cla_16(behavioral);
		end for;
	end for;
end TESTBENCH_FOR_cla_16;

