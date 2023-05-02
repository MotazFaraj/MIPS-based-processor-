module registerFile_tb;
    reg clk;
    reg [2:0] R1,R2;
    reg [2:0] W1;
    reg We;
    reg [31:0] D1;
    wire [31:0] Out1,Out2;

    // Instantiate the DUT
    registerFile dut (
        .R1(R1),
        .R2(R2),
        .W1(W1),
        .D1(D1),
        .We(We),
        .Out1(Out1),
        .Out2(Out2),
        .clk(clk)
    );

    // Clock generator
    always begin
        #5 clk = ~clk;
    end

    // Test case 1: Write to register 0
    initial begin
        W1 = 3'b000;
        We = 1'b1;
        D1 = 32'b10101010101010101010101010101010;
        #10;
        assert(Out1 == 32'b10101010101010101010101010101010)
        $display("Test Case 1: Write to register 0 - PASSED");
    end

    // Test case 2: Read from register 0
    initial begin
        R1 = 3'b000;
        R2 = 3'b000;
        We = 1'b0;
        D1 = 32'b00000000;
        #10;
        assert(Out1 == 32'b10101010101010101010101010101010)
        assert(Out2 == 32'b10101010101010101010101010101010)
        $display("Test Case 2: Read from register 0 - PASSED");
    end

    // Test case 3: Write to register 1
    initial begin
        W1 = 3'b001;
        We = 1'b1;
        D1 = 32'b11111111111111111111111111111111;
        #10;
        assert(Out1 == 32'b10101010101010101010101010101010)
        assert(Out2 == 32'b10101010101010101010101010101010)
        $display("Test Case 3: Write to register 1 - PASSED");
    end
																			       // Test case 4: Read from register 1
    initial begin
        R1 = 3'b001;
        R2 = 3'b001;
        We = 1'b0;
        D1 = 32'b00000000;
        #10;
        assert(Out1 == 32'b11111111111111111111111111111111)
        assert(Out2 == 32'b11111111111111111111111111111111)
        $display("Test Case 4: Read from register 1 - PASSED");
    end

endmodule
