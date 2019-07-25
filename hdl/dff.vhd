library IEEE;
use IEEE.std_logic_1164.all;

entity dff is
	port (
		clk		: in std_logic;
		rstn	: in std_logic;
		din		: in std_logic;
		qout	: out std_logic
	);
end dff;

architecture rtl of dff is

	begin
	
	dff_proc : process(clk,rstn)
		begin
		
			-- If reset then the output is reset to zero
			if (rstn = '0') then
				qout <= '0';
			
			-- Otherwise if the clock strikes, the output is updated
			elsif(rising_edge(clk)) then
				qout <= din;
				
			end if;
			
		end process dff_proc;
	
end rtl;