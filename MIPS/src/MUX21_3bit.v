module mux2x1_3bit(input [2:0] in1, input [2:0] in2, input select, output reg [2:0] out);
    always @(*) begin
        if (select) begin
            out <= in2;
        end else begin
            out <= in1;
        end
    end
endmodule