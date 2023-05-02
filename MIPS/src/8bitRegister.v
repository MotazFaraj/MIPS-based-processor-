module reg_8bit (input clk, input en, input [7:0] in, output reg [7:0] out);
  always @(posedge clk) begin

	if (en)begin
      out <= in;
  end else 
        out <= 0;
    end 
endmodule					   				  