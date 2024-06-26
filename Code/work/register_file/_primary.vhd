library verilog;
use verilog.vl_types.all;
entity register_file is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        op_code         : in     vl_logic_vector(1 downto 0);
        read_addr       : in     vl_logic_vector(1 downto 0);
        write_addr      : in     vl_logic_vector(1 downto 0);
        write_data      : in     vl_logic_vector(511 downto 0);
        read_data       : out    vl_logic_vector(511 downto 0)
    );
end register_file;
