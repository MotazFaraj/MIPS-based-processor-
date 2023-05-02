module sign_ext(in,out,extOp);

input [9:0] in;
input extOp;
output reg [23:0] out;

always@(*)begin	 
	if(extOp)begin		
		out <= {{14{in[9]}}, in};
	end else begin
		out <= {{14{0}}, in};	
	end
	
end

	
endmodule
