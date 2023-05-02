module ALU(input [23:0] A, B, // input operands
           input [2:0] opcode,  // operation to perform
           output reg [23:0] result, // result of operation
           output reg zero); // flag to indicate zero result

// operation codes
parameter ADD = 3'b000;
parameter SUB = 3'b001;
parameter AND = 3'b010;
parameter MAX = 3'b011;
parameter CMP = 3'b100;
parameter EQUAL = 3'b101;
parameter SUBSF = 3'b110;
//assign zero = 1'd0;
always @(*) begin
    case (opcode)
        ADD: result = A + B;
        SUB: result = A - B;
        AND: result = A & B;
        MAX: result = (A > B) ? A : B;
        CMP: zero = (A > B) ? 1'd0 : 1'd1;	
        EQUAL: zero = (A==B) ? 1'd1 : 1'd0;
		SUBSF: 
			begin
				result = A - B; 
				zero = (A==B) ? 1'd1:1'd0;
			end
    endcase

end
endmodule
