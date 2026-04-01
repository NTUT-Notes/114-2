Library ieee;
Use ieee.std_logic_1164.all;

-- This component follows the rule of MSB downto LSB
-- Input:  { a3 a2 a1 a0 }
-- Output: { a, b, c, d, e, f, g }

Entity segment7 Is Port (
  data_in : in std_logic_vector(3 downto 0);
  data_out : out std_logic_vector(6 downto 0)
);
end Entity;

architecture BlingBling of segment7 is
begin
	-- a
	data_out(6) <= (                      (    data_in(2)) and (not data_in(1)) and (not data_in(0)) )
	            or ( (    data_in(3)) and (    data_in(2)) and (not data_in(1))                      )
				   or ( (not data_in(3)) and (not data_in(2)) and (not data_in(1)) and (    data_in(0)) )
				   or ( (    data_in(3)) and (not data_in(2)) and (    data_in(1)) and (    data_in(0)) );
   -- b
	data_out(5) <= ( (    data_in(3)) and (data_in(2))                      and (not data_in(0)) )
				   or (                      (data_in(2)) and (    data_in(1)) and (not data_in(0)) )
					or ( (    data_in(3))                  and (    data_in(1)) and (    data_in(0)) )
					or ( (not data_in(3)) and (data_in(2)) and (not data_in(1)) and (    data_in(0)) );
	
	-- c
	data_out(4) <= ( (not data_in(3)) and (not data_in(2)) and (data_in(1)) and (not data_in(0)) )
	            or ( (    data_in(3)) and (    data_in(2))                  and (not data_in(0)) )
				   or ( (    data_in(3)) and (    data_in(2)) and (data_in(1))                      );

	-- d
	data_out(3) <= (                      (not data_in(2)) and (not data_in(1)) and (    data_in(0)) )
			      or ( (not data_in(3)) and (    data_in(2)) and (not data_in(1)) and (not data_in(0)) )
	            or (                      (    data_in(2)) and (    data_in(1)) and (    data_in(0)) )
					or ( (    data_in(3)) and (not data_in(2)) and (    data_in(1)) and (not data_in(0)) );
	
	-- e
	data_out(2) <= ((not data_in(3))                                           and (data_in(0)) )
				   or ((not data_in(3)) and (    data_in(2)) and (not data_in(1))                  )
					or (                     (not data_in(2)) and (not data_in(1)) and (data_in(0)) );
	-- f
	data_out(1) <= ((not data_in(3)) and (not data_in(2))                      and (data_in(0)) )
				   or ((not data_in(3)) and (not data_in(2)) and (    data_in(1))                  )
					or ((not data_in(3))                      and (    data_in(1)) and (data_in(0)) )
					or ((    data_in(3)) and (    data_in(2)) and (not data_in(1))                  );
	-- g
	data_out(0) <= ((not data_in(3)) and (not data_in(2)) and (not data_in(1))                  )
				   or ((not data_in(3)) and (    data_in(2)) and (    data_in(1)) and (data_in(0)) );
		
end architecture;