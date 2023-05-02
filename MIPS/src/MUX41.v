module mux4x1(input [23:0] in1, input [23:0] in2,input [23:0] in3,input [23:0] in4, input [1:0] select, output reg [23:0] out);
    always @(*) begin
        if (select==0) begin
            out <= in1;
        end else if (select==1)  begin
            out <= in2;
        end else if (select==2)  begin
            out <= in3;
		end else begin
            out <= in4;
        end
    end
endmodule