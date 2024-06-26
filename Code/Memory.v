module memory(
    input clk,
    input rst,
    input [1:0] op_code,
    input [8:0] mem_addr,
    input [511:0] mem_wr_data,
    output reg [511:0] mem_rd_data
);
    reg [31:0] mem_array [511:0];
    integer i;
    integer j;
    integer k;
    reg [511:0] dummy;

    initial begin
        for (i = 0; i < 512; i = i + 1) begin
            mem_array[i] <= 32'b0;
        end

        mem_array[0] <= 32'd1234;

        mem_array[16] <= 32'd8765;
    end

    always @(posedge clk) begin
        if (!rst) begin
            for (i = 0; i < 512; i = i + 1) begin
                mem_array[i] <= 32'b0;
            end
        end 
        
        else if (op_code == 2'b01) begin
            #1;
            for (j = 0; j < 16; j = j + 1) begin
                mem_array[mem_addr + j] <= mem_wr_data[(j*32) +: 32];
            end
        end


        else if (op_code == 2'b00) begin
            for (k = 0; k < 16; k = k + 1) begin
                mem_rd_data[(k*32) +: 32] <= mem_array[mem_addr + k];
            end
        end
    end

endmodule