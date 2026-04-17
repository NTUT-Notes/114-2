Library ieee;
Use ieee.std_logic_1164.all;

Package package_lab4 Is 
	
	Component mux2to1 
		Port(
        w : In  std_logic_vector (1 downto 0);
        s : In  std_logic_vector (0 downto 0);
	     f : Out std_logic
      );
	End Component;
	
	Component mux4to1
		Port(
	     w : In  std_logic_vector (3 downto 0);
        s : In  std_logic_vector (1 downto 0);
	     f : Out std_logic
	  );
	 End Component;
	 
	 Component fulladd 
      Port(cin, x, y :In  std_logic;
		     s, cout   :Out std_logic
      );
    End Component;
	 
	 Component alu1bit
	    Port(
	    	a, b      : In  std_logic;
			ctrl         : In  std_logic_vector (3 downto 0);
			cin       : In  std_logic;
			cout      : Out std_logic;
			result    : Out std_logic;
			adderRes  : Out std_logic;
			setLt     : In  std_logic;
			overflow  : Out std_logic
		);
    End Component;
	 
	 Component alu7bit
		Port(
			a, b      : In  std_logic_vector (6 downto 0);
			ctrl      : In  std_logic_vector (3 downto 0);
			cin       : In  std_logic;
			cout      : Out std_logic;
			result    : Out std_logic_vector (6 downto 0);
			overflow  : Out std_logic
		);
	 End Component;
	 
	 Component segment7 
		Port (
		  data_in : in std_logic_vector(3 downto 0);
		  data_out : out std_logic_vector(6 downto 0)
		);
	End Component;
	 
			
End package_lab4;