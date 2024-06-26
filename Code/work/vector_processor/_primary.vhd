library verilog;
use verilog.vl_types.all;
entity vector_processor is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        op_code         : in     vl_logic_vector(1 downto 0);
        reg_addr_to_write: in     vl_logic_vector(1 downto 0);
        reg_addr_to_read: in     vl_logic_vector(1 downto 0);
        mem_addr        : in     vl_logic_vector(8 downto 0)
    );
end vector_processor;
