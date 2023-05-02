module mux4x1_3bit(input [2:0] in1, input [2:0] in2,input [2:0] in3,input [2:0] in4, input [1:0] select, output reg [2:0] out);
    always @(*) begin
        if (select==0) begin
            out <= in1;
        end else if (select==1)  begin
            out <= in2;
        end else if (select==2)  begin
            out <= 3'b111;
		end else begin
            out <= 3'b001;
        end
    end
endmodule