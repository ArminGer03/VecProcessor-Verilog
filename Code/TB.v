module vector_tb;
    reg clk;
    reg rst;
    reg [1:0] op_code;
    reg [1:0] reg_addr_to_write;
    reg [1:0] reg_addr_to_read;
    reg [8:0] mem_addr;

    vector_processor vp(
        .clk(clk),
        .rst(rst),
        .op_code(op_code),
        .reg_addr_to_write(reg_addr_to_write),
        .reg_addr_to_read(reg_addr_to_read),
        .mem_addr(mem_addr)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns period
    end

    initial begin
        // Initialize inputs
        rst = 1;
        mem_addr = 9'b0;
        reg_addr_to_write = 2'b00;
        op_code = 2'b00; // load from memory 0 to register 0 (A1)
        

        #6
        mem_addr = 9'b000010000;
        reg_addr_to_write = 2'b01;
        #4 op_code = 2'b00; // load from memory 16 to register 1 (A2)

        #10;
        op_code = 2'b10; // add A2 with A1 and store in A3 and A4


        #10;
        mem_addr = 9'b000100000;
        reg_addr_to_read = 2'b10;
        op_code = 2'b01; // store register 2 (A3) to memory 32 
// ----------------
        #10
        mem_addr <= 9'b000100000;
        reg_addr_to_write <= 2'b01;
        op_code <= 2'b00; // load from memory 32 to register 1 (A2)

        #10;
        op_code <= 2'b11; // multiply A2 with A1 and store in A3 and A4

        #20;
        mem_addr <= 9'b001000000;
        reg_addr_to_read <= 2'b10;
        op_code <= 2'b01; // store register 2 (A3) to memory 64
// ----------------
        #10
        mem_addr <= 9'b001000000;
        reg_addr_to_write <= 2'b00;
        op_code <= 2'b00; // load from memory 64 to register 0 (A1)

        #10;
        op_code <= 2'b11; // multiply A2 with A1 and store in A3 and A4

        #20;
        mem_addr <= 9'b001000000;
        reg_addr_to_read <= 2'b10;
        op_code <= 2'b01; // store register 2 (A3) to memory 64
// ----------------
        #10
        mem_addr <= 9'b001000000;
        reg_addr_to_write <= 2'b01;
        op_code <= 2'b00; // load from memory 64 to register 1 (A2)

        #10;
        op_code <= 2'b11; // multiply A2 with A1 and store in A3 and A4

        #20;
        mem_addr <= 9'b001000000;
        reg_addr_to_read <= 2'b10;
        op_code <= 2'b01; // store register 2 (A3) to memory 64
// ----------------
        #10
        mem_addr <= 9'b001000000;
        reg_addr_to_write <= 2'b00;
        op_code <= 2'b00; // load from memory 64 to register 0 (A1)

        #10;
        op_code <= 2'b11; // multiply A2 with A1 and store in A3 and A4

        #20;
        mem_addr <= 9'b001000000;
        reg_addr_to_read <= 2'b10;
        op_code <= 2'b01; // store register 2 (A3) to memory 64

        // End the simulation
        #20;
        $stop;
    end

endmodule
