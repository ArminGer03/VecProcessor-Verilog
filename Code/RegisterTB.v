module register_tb;
    // Inputs
    reg clk;
    reg rst;
    reg [1:0] op_code;
    reg [1:0] read_addr;
    reg [1:0] write_addr;
    reg [511:0] write_data;

    // Outputs
    wire [511:0] read_data;

    // Instantiate the register file module
    register_file rf (
        .clk(clk),
        .rst(rst),
        .op_code(op_code),
        .read_addr(read_addr),
        .write_addr(write_addr),
        .write_data(write_data),
        .read_data(read_data)
    );

    // Clock generation
    always #5 clk = ~clk; // 10 ns clock period

    // Test sequence
    initial begin
        // Initialize inputs
        clk = 0;
        rst = 1;
        op_code = 0;
        read_addr = 0;
        write_addr = 0;
        write_data = 0;

        //Test1: Reset the register file
        #10;
        rst = 0;
        #50;
        rst = 1;

        //Test2: reading from register 0 and 1
        op_code = 2'b01; // Read operation
        read_addr = 2'b00;
        #10 $display("test2 Read data A1: %d", read_data);
        #10;
        op_code = 2'b01; // Read operation
        read_addr = 2'b01;
        #10 $display("test2 Read data A2: %d", read_data);

        // Test3: writing to register 2 and reading from it.
        #50;
        op_code = 2'b00; // Write operation
        write_addr = 2'b10;
        write_data = 512'd123456;
        #10;
        op_code = 2'b01; // Read operation
        read_addr = 2'b10;
        #10 $display("test3 Read A3: %d", read_data);

        // Test4: writing to register 0 and 1
        #50;
        op_code = 2'b00; // Write operation
        write_addr = 2'b00;
        write_data = 512'd12;
        #10;
        op_code = 2'b00; // write operation
        write_addr = 2'b01;
        write_data = 512'd11;
        #10;
        // Test ALU operation (addition)
        op_code = 2'b10; // ALU add operation
        #10;
        op_code = 2'b01; // Read operation
        read_addr = 2'b10;
        #10 $display("test4 Read A3 after sum: %d", read_data);

        // Test ALU operation (multiplication)
        #10;
        op_code = 2'b11; // ALU multiply operation
        #10;
        op_code = 2'b01; // Read operation
        read_addr = 2'b10;
        #10 $display("test4 Read A3 after mul: %d", read_data);

        #20;
        // stop simulation
        $stop;
    end
endmodule

