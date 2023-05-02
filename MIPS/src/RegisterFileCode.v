module registerFile(R1,R2,W1,D1,We,Out1,Out2,clk);
	input [2:0] R1,R2;
	input [2:0] W1;
	input We;
	input clk;
	input [23:0] D1; 
	output reg [23:0] Out1,Out2;																								 
	
	reg [23:0] rf[7:0];
	
	initial begin
		rf[0]=0;
		rf[1]=0;
		rf[2]=0;
		rf[3]=0;
		rf[4]=0;								 
		rf[5]=0;
		rf[6]=0;
		rf[7]=0;
	end

	assign	Out1 = rf[R1];
	assign	Out2 = rf[R2];
	
	always@(posedge clk) begin
		if (We && W1>0) rf[W1] <= D1;			

	end

endmodule
	
