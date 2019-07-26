library IEEE;
use IEEE.std_logic_1164.all;

entity PNgenTB is
end PNgenTB;

architecture test of PNgenTB is

	-----------------------------------------------------------------------------------
    -- Testbench constants
    -----------------------------------------------------------------------------------
	constant T_CLK   : time := 10 ns; -- Clock period
	constant T_RESET : time := 10 ns; -- Period before the reset deassertion
	-----------------------------------------------------------------------------------
    -- Testbench signals
    -----------------------------------------------------------------------------------
 
	signal clk_tb : std_logic := '0';
	signal resetn_tb : std_logic := '0';
	signal load_tb : std_logic := '0';
	signal enable_tb : std_logic := '1';
	signal q_tb : std_logic;
	signal seed_tb : std_logic_vector(14 downto 0);
	signal end_sim : std_logic := '1';
	
	component PNgen is
		port (
			clk		: in std_logic;
			resetn	: in std_logic;
			load	: in std_logic;
			enable	: in std_logic;
			seed	: in std_logic_vector(14 downto 0);
			stream	: out std_logic
		);
	end component;
	
	begin
	
	clk_tb <= (not(clk_tb) and end_sim) after T_CLK / 2;  
	resetn_tb <= '1' after T_RESET;
	
	PNgen_test : PNgen
		port map(
				clk		=> clk_tb,
				resetn	=> resetn_tb,
				load	=> load_tb,
				enable	=> enable_tb,
				seed	=> seed_tb,
				stream	=> q_tb
				);
				
	tb_proc: process(clk_tb, resetn_tb)
	
	variable t : integer := 0;
		
		begin
		
		if(resetn_tb = '0') then
			t := 0;
			
		elsif(rising_edge(clk_tb)) then
			case(t) is
				when 1 => enable_tb <= '1'; load_tb <= '1'; seed_tb <= "000000000000001";
				when 2 => load_tb <= '0';
				when 32785 => end_sim <= '0';
				when others => null;
			end case;
			t := t+1;
		end if;
		
	end process;

end test;