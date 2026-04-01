Library ieee;
Use ieee.std_logic_1164.all;

Entity main_2 Is Port (
  data_in : in std_logic_vector(1 downto 0);
  s1 : out std_logic_vector(6 downto 0);
  s0 : out std_logic_vector(6 downto 0)
);

end Entity;

architecture BlingBling of main_2 is
begin
	-- a
	s0(6) <=  ( (data_in(0))     and (not data_in(1)) );
   -- b
	s0(5) <=  ( (data_in(0)) and (not data_in(0)));
	
	-- c
	s0(4) <=  ( (not data_in(0))     and (data_in(1)) );
						 
	-- d
	s0(3) <= ( (data_in(0))     and (not data_in(1)) );
	
	-- e
	s0(2) <= ( (data_in(0))     and (not data_in(1)) );
	-- f
	s0(1) <= ( ( not data_in(0))     and (data_in(1)) );
	-- g
	s0(0) <= ( (data_in(0)) and (not data_in(0)));
	
	-- another seg
	
	-- a
	s1(6) <=  ( (not data_in(0))     and (data_in(1)) );
   -- b
	s1(5) <=  ( (data_in(0)) and (not data_in(0)));
	
	-- c
	s1(4) <=  ( (data_in(0)) and (not data_in(0)));
						 
	-- d
	s1(3) <= ( (not data_in(0))     and (data_in(1)) )
	                or ( (data_in(0))     and (not data_in(1)) );
	-- e
	s1(2) <= ( (not data_in(0))     and (data_in(1)) )
	                or ( (data_in(0))     and (not data_in(1)) );
	-- f
	s1(1) <= ( (not data_in(0))     and (data_in(1)) );
	
	-- g
	s1(0) <= ( (not data_in(0))     and (data_in(1)) );	 

end architecture;