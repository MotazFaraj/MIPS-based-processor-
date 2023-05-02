module PC (input clk,input [23:0] in,output reg [23:0] out);  
	initial begin
		out=0;
	end

	always@(posedge clk) begin
		out<=in;
	end
endmodule