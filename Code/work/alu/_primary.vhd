library verilog;
use verilog.vl_types.all;
entity alu is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        A1              : in     vl_logic_vector(511 downto 0);
        A2              : in     vl_logic_vector(511 downto 0);
        A3              : in     vl_logic_vector(511 downto 0);
        A4              : in     vl_logic_vector(511 downto 0);
        op              : in     vl_logic_vector(1 downto 0);
        write_on_A3     : out    vl_logic_vector(511 downto 0);
        write_on_A4     : out    vl_logic_vector(511 downto 0)
    );
end alu;
