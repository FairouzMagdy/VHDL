library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity ADD_SUB is
	port( M : in STD_LOGIC;
	A : in STD_LOGIC_VECTOR(7 downto 0);
	B : in STD_LOGIC_VECTOR(7 downto 0);
	CARRY : out STD_LOGIC;
	V : out STD_LOGIC;
	SUM : out STD_LOGIC_VECTOR(7 downto 0)
	);
end ADD_SUB;

architecture ADD_SUB_ARCH of ADD_SUB is
	component xorgate is
		port(
		A : in STD_LOGIC;
		B : in STD_LOGIC;
		C : out STD_LOGIC
		);
	end component;
	component FA is
		port(
		X : in STD_LOGIC;
		Y : in STD_LOGIC;
		Z : in STD_LOGIC;
		S : out STD_LOGIC;
		C : out STD_LOGIC
		);
	end component;
signal C:std_logic_vector (8 downto 1);
signal temp:std_logic_vector (7 downto 0);
begin
	XOR_G1: xorgate port map(M,B(0),temp(0));
	XOR_G2: xorgate port map(M,B(1),temp(1));
	XOR_G3: xorgate port map(M,B(2),temp(2));
	XOR_G4: xorgate port map(M,B(3),temp(3));  
	XOR_G5: xorgate port map(M,B(4),temp(4));
	XOR_G6: xorgate port map(M,B(5),temp(5));
	XOR_G7: xorgate port map(M,B(6),temp(6));
	XOR_G8: xorgate port map(M,B(7),temp(7));
	FA_G1: FA port map (M,A(0),temp(0),SUM(0),C(1));
	FA_G2: FA port map (C(1),A(1),temp(1),SUM(1),C(2));
	FA_G3: FA port map (C(2),A(2),temp(2),SUM(2),C(3));
	FA_G4: FA port map (C(3),A(3),temp(3),SUM(3),C(4));	
	FA_G5: FA port map (C(4),A(4),temp(4),SUM(4),C(5));
	FA_G6: FA port map (C(5),A(5),temp(5),SUM(5),C(6));
	FA_G7: FA port map (C(6),A(6),temp(6),SUM(6),C(7));
	FA_G8: FA port map (C(7),A(7),temp(7),SUM(7),C(8));
	CARRY<=C(8);
	V<= C(7) XOR C(8);
end ADD_SUB_ARCH;