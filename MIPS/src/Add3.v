module adder_3(input [23:0] a, output reg [23:0] sum);
    always @(*) begin
        sum <= a + 3'd3;
    end
endmodule
