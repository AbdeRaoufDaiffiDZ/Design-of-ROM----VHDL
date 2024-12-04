library ieee; -- define the ieee library to be included in the code
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity ROM is 
port(
clk,RD: in std_logic; 
addr: in integer range 0 to 3 ;  -- defin the address bus with 4 lines
Data_out: out std_logic_vector(7 downto 0)  -- define the data bus with  8 bits in a location ( 8 bits word)
);
end entity;

architecture arc of ROM is
type my_rom is ARRAY(0 to 3)  of std_logic_vector( 7 downto 0);
constant ROM: my_rom := (x"A5",x"B7",x"E9",x"F1");  -- define the rom array with the data given, silce its a rom read only memory
begin
	process(clk,rd) is  -- process for reading 
	begin
		if(RD = '0') then -- if reading is not enabled then output a high impedence 
			Data_out <= (others =>'Z');
		else 
			if (clk'event and clk = '0') then  -- if reading is enabled then output the data in the given address
				Data_out <= ROM(addr);
				end if;
		end if;
	end process;
end arc;