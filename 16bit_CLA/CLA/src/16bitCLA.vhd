library IEEE;
use IEEE.STD_LOGIC_1164.all;
entity CLA_16 is 
	Port ( A : in STD_LOGIC_VECTOR (15 downto 0);
	B : in STD_LOGIC_VECTOR (15 downto 0);
	Cin : in STD_LOGIC;
	S : out STD_LOGIC_VECTOR (15 downto 0);
	Cout : out STD_LOGIC;
	GII: out STD_LOGIC;
	PII: out STD_LOGIC
	);
end CLA_16;
architecture BEHAVIORAL of CLA_16 is
	component CLA_4 is
		Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
		B : in STD_LOGIC_VECTOR (3 downto 0);
		Cin : in STD_LOGIC;
		S : out STD_LOGIC_VECTOR (3 downto 0);
		Cout : out STD_LOGIC;
		GI:	out STD_LOGIC;
		PI:	out STD_LOGIC
		);
	end component;
signal c : std_logic_vector(4 downto 0) := (others => '0');
begin
c(0) <= Cin;
gen: for i in 0 to 3 generate -- Generate each 4-bit adder result and carry out
      add16: CLA_4 port map( a => a((4*(i+1))-1 downto 4*i), 
                              b => b((4*(i+1))-1 downto 4*i), 
                              cin => c(i), 
                              s => S((4*(i+1))-1 downto 4*i), 
                              cout => c(i+1));
end generate;
Cout <= c(4);

end BEHAVIORAL;
