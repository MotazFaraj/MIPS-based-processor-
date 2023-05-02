module adder(input [23:0] a, input [23:0] b, output reg [23:0] sum);
    always @(*) begin
        sum <= a + b;
    end
endmodule
