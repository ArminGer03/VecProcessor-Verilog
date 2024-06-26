module register_file(
    input clk,
    input rst,
    input [1:0] op_code,
    input [1:0] read_addr,
    input [1:0] write_addr,
    input [511:0] write_data,
    output reg [511:0] read_data
);
    reg [511:0] registers [3:0];
    wire [511:0] A3_res;
    wire [511:0] A4_res;

    initial begin
        $monitor("time: %t\nA1: %d\nA2: %d\nA3: %d\nA4: %d\n-------",$time, registers[0],registers[1],registers[2],registers[3]);
    end

    alu alu_unit(
        .clk(clk),
        .rst(rst),
        .A1(registers[0]),
        .A2(registers[1]),
        .A3(registers[2]),
        .A4(registers[3]),
        .op(op_code),
        .write_on_A3(A3_res),
        .write_on_A4(A4_res)
    );

    always @(posedge clk) begin
        if (!rst) begin
            registers[0] <= 512'b0;
            registers[1] <= 512'b0;
            registers[2] <= 512'b0;
            registers[3] <= 512'b0;
        end 
        else begin
            case (op_code)
                2'b00: begin
                    #1 registers[write_addr] <= write_data;
                end
                2'b01: begin
                    read_data <= registers[read_addr];
                end
                default: begin
                    registers[2] <= A3_res;
                    registers[3] <= A4_res;
                end
            endcase
        end
    end

endmodule