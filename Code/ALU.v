module alu(
    input clk,
    input rst,
    input [511:0] A1,
    input [511:0] A2,
    input [511:0] A3,
    input [511:0] A4,
    input [1:0] op,
    output reg [511:0] write_on_A3,
    output reg [511:0] write_on_A4
);
    always @(clk) begin
        if(rst) begin
            case (op)
                2'b10: begin
                    {write_on_A4, write_on_A3} <= A1 + A2;
                end
                2'b11: begin
                    {write_on_A4, write_on_A3} <= A1 * A2;
                end
                default: begin
                    write_on_A3 <= A3;
                    write_on_A4 <= A4;
                end
            endcase
        end
        
    end
endmodule
