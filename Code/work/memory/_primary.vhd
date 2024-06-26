library verilog;
use verilog.vl_types.all;
entity memory is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        op_code         : in     vl_logic_vector(1 downto 0);
        mem_addr        : in     vl_logic_vector(8 downto 0);
        mem_wr_data     : in     vl_logic_vector(511 downto 0);
        mem_rd_data     : out    vl_logic_vector(511 downto 0)
    );
end memory;
