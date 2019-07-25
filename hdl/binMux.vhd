library IEEE;
use IEEE.std_logic_1164.all;

entity binMux is
	port (
		in1 	: in std_logic;
		in2		: in std_logic;
		sel		: in std_logic;
		output	: out std_logic
	);
end binMux;

architecture bhv of binMux is

begin
	mux_process: process(in1,in2,sel)
	begin
	
		-- In the first case, if sel is 0 the mux conveys the first input signal
		if(sel = '0') then
			output <= in1;
			
		-- If sel is 1 the mux conveys the second input signal
		else
			output <= in2;
			
		end if;
	end process;
end bhv;