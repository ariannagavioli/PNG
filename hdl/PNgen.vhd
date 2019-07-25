library IEEE;
use IEEE.std_logic_1164.all;

entity PNgen is
	port (
			clk		: in std_logic;
			resetn	: in std_logic;
			load	: in std_logic;
			enable	: in std_logic;
			seed	: in std_logic_vector(14 downto 0);
			stream	: out std_logic
	);
end PNgen;

architecture rtl of PNgen is

component dff

	port (
		clk		: in std_logic;
		rstn	: in std_logic;
		din		: in std_logic;
		qout	: out std_logic
	);

end component;

component binMux

	port (
		in1 	: in std_logic;
		in2		: in std_logic;
		sel		: in std_logic;
		output	: out std_logic
	);

end component;

-- Each stage output
signal qouts	: std_logic_vector(14 downto 0);

-- Each stage input
signal dins		: std_logic_vector(14 downto 0);

-- Vector used to compute the feedback value
signal xors		: std_logic_vector(4 downto 0);

begin
	GEN: for i in 0 to 14 generate
	
		-- For each stage of the generator we need a multiplexer that 
		-- conveys the right input signal and a flip flop that stores
		-- the value of the correspondent stage
		
		-- First stage receives in input either the seed bit
		-- or the feedback
		FIRST: if i = 0 generate
				MUX1:	binMux port map(xors(4),seed(i),load,dins(i));
				FF1: 	dff port map (clk,resetn,dins(i),qouts(i));
		end generate FIRST;
				
		-- All of the other stages receive in input either the seed bit
		-- or the previous stage output
		INTERNAL: if i > 0 and i < 14 generate
				MUXI:	binMux port map(qouts(i-1),seed(i),load,dins(i));
				FFI: 	dff port map (clk,resetn,dins(i),qouts(i));
		end generate INTERNAL;
		
		LAST: if i = 14 generate
				MUXL:	binMux port map(qouts(i-1),seed(i),load,dins(i));
				FFL: 	dff port map (clk,resetn,dins(i),qouts(i));
		end generate LAST;
		
	end generate GEN;
	
	stream <= (enable and qouts(14));
	
	-- The xor vector is used to build the feedback signal
	-- according to the carachteristic polynomial
	xors(0) <= qouts(14) xor qouts(9);
	xors(1) <= xors(0) xor qouts(7);
	xors(2) <= xors(1) xor qouts(6);
	xors(3) <= xors(2) xor qouts(5);
	xors(4) <= xors(3) xor qouts(1);
		
end rtl;