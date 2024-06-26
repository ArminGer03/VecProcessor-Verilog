module memory_tb;
    reg clk;
    reg rst;
    reg [1:0] op_code;
    reg [8:0] mem_addr;
    reg [511:0] mem_wr_data;
    wire [511:0] mem_rd_data;
   
    // Instantiate the memory module
    memory mem (
        .clk(clk),
        .rst(rst),
        .op_code(op_code),
        .mem_addr(mem_addr),
        .mem_wr_data(mem_wr_data),
        .mem_rd_data(mem_rd_data)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns period
    end

    initial begin
        // Initialize inputs
        rst = 1;
        op_code = 2'b00;
        mem_addr = 9'b0;
        mem_wr_data = 512'b0;

        // Reset the memory
        #10 rst = 0;

        // Write operation
        #10;
        mem_addr = 9'b000000000; // Starting address
        mem_wr_data = 512'hDEADBEEFCAFEBABE0123456789ABCDEFDEADBEEFCAFEBABE0123456789ABCDEFDEADBEEFCAFEBABE0123456789ABCDEFDEADBEEFCAFEBABE0123456789ABCDEF; // Some test data
        op_code = 2'b01; // Write
        #10;

        // Read operation
        #10;
        op_code = 2'b00; // Read
        mem_addr = 9'b000000000; // Starting address
        #10;

        // Display read data
        $display("Read Data: %h", mem_rd_data);

        // Check if read data matches written data
        if (mem_rd_data == 512'hDEADBEEFCAFEBABE0123456789ABCDEFDEADBEEFCAFEBABE0123456789ABCDEFDEADBEEFCAFEBABE0123456789ABCDEFDEADBEEFCAFEBABE0123456789ABCDEF) begin
            $display("Test Passed");
        end else begin
            $display("Test Failed");
        end

        #10;
        op_code = 2'b00; // Read
        mem_addr = 9'b000001111; // Starting address
        #10;

        // Display read data
        $display("Read Data: %h", mem_rd_data);

        // Check if read data matches written data
        if (mem_rd_data == 512'hDEADBEEF) begin
            $display("Test Passed");
        end else begin
            $display("Test Failed");
        end

        // End the simulation
        #20;
        $stop;
    end
endmodule