module vector_processor(
    input clk,
    input rst,
    input [1:0] op_code,
    input [1:0] reg_addr_to_write,
    input [1:0] reg_addr_to_read,
    input [8:0] mem_addr
);
    wire [511:0] mem_out_to_reg_file;
    wire [511:0] reg_out_to_mem;

    register_file rf (
        .clk(clk),
        .rst(rst),
        .op_code(op_code),
        .read_addr(reg_addr_to_read),
        .write_addr(reg_addr_to_write),
        .write_data(mem_out_to_reg_file),
        .read_data(reg_out_to_mem)
    );

    memory mem(
        .clk(clk),
        .rst(rst),
        .op_code(op_code),
        .mem_addr(mem_addr),
        .mem_wr_data(reg_out_to_mem),
        .mem_rd_data(mem_out_to_reg_file)
    );

endmodule