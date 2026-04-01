Library ieee;
Use ieee.std_logic_1164.all;

-- This component follows the rule of MSB downto LSB
-- Input:  { a3 a2 a1 a0 }
-- Output: { a, b, c, d, e, f, g }

Entity main_1 Is Port (
  data_in : in std_logic_vector(3 downto 0);
  s0 : out std_logic_vector(6 downto 0)
);
end Entity;

architecture BlingBling of main_1 is
begin
	-- a
	s0(6) <= (                      (    data_in(2)) and (not data_in(1)) and (not data_in(0)) )
	            or ( (    data_in(3)) and (    data_in(2)) and (not data_in(1))                      )
				   or ( (not data_in(3)) and (not data_in(2)) and (not data_in(1)) and (    data_in(0)) )
				   or ( (    data_in(3)) and (not data_in(2)) and (    data_in(1)) and (    data_in(0)) );
   -- b
	s0(5) <= ( (    data_in(3)) and (data_in(2))                      and (not data_in(0)) )
				   or (                      (data_in(2)) and (    data_in(1)) and (not data_in(0)) )
					or ( (    data_in(3))                  and (    data_in(1)) and (    data_in(0)) )
					or ( (not data_in(3)) and (data_in(2)) and (not data_in(1)) and (    data_in(0)) );
	
	-- c
	s0(4) <= ( (not data_in(3)) and (not data_in(2)) and (data_in(1)) and (not data_in(0)) )
	            or ( (    data_in(3)) and (    data_in(2))                  and (not data_in(0)) )
				   or ( (    data_in(3)) and (    data_in(2)) and (data_in(1))                      );

	-- d
	s0(3) <= (                      (not data_in(2)) and (not data_in(1)) and (    data_in(0)) )
			      or ( (not data_in(3)) and (    data_in(2)) and (not data_in(1)) and (not data_in(0)) )
	            or (                      (    data_in(2)) and (    data_in(1)) and (    data_in(0)) )
					or ( (    data_in(3)) and (not data_in(2)) and (    data_in(1)) and (not data_in(0)) );
	
	-- e
	s0(2) <= ((not data_in(3))                                           and (data_in(0)) )
				   or ((not data_in(3)) and (    data_in(2)) and (not data_in(1))                  )
					or (                     (not data_in(2)) and (not data_in(1)) and (data_in(0)) );
	-- f
	s0(1) <= ((not data_in(3)) and (not data_in(2))                      and (data_in(0)) )
				   or ((not data_in(3)) and (not data_in(2)) and (    data_in(1))                  )
					or ((not data_in(3))                      and (    data_in(1)) and (data_in(0)) )
					or ((    data_in(3)) and (    data_in(2)) and (not data_in(1))                  );
	-- g
	s0(0) <= ((not data_in(3)) and (not data_in(2)) and (not data_in(1))                  )
				   or ((not data_in(3)) and (    data_in(2)) and (    data_in(1)) and (data_in(0)) );
		
end architecture;