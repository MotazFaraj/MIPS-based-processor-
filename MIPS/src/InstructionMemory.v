`define PROGRAM_1 // <<<<<<<<<<<< CHANGE TEST PROGRAM HERE!	 

module InsMem(ReadAddress, Instruction);  
input [23:0] ReadAddress;						   
output [23:0] Instruction;
reg [23:0] Instruction;						
always @(ReadAddress)
begin
case(ReadAddress)
	
`ifdef PROGRAM_1						 
	0:  Instruction = 24'b00_01101_00000000000000110;	//main:JAL  loadInt	
	3:  Instruction = 24'b00_01100_00000000000000011;	//end:J end
	6:  Instruction = 24'b00_00000_0_001_001_000_0000000;//loadInt:AND R1,R1,R0	
	9:  Instruction = 24'b00_01110_00000000000010010;//LUI R1, 0x12	
	12:  Instruction = 24'b00_01000_0_001_001_0000000011;// ADDI R1, R1, 0x003
	15:  Instruction = 24'b00_00110_0_000_111_000_0000000;// JR		
	
`else
//-----------------------------------------------------
`ifdef PROGRAM_2 	
	0:  Instruction = 24'b00_01101_00000000000000110;	//JAL storeString	
	3:  Instruction = 24'b00_01101_00000000001111000;	//JAL strlen
	6:  Instruction = 24'b00_00000_0_001_001_000_0000000;//storeString: AND R1,R1,R0	
	9:  Instruction = 24'b00_01000_0_001_001_0001101000;//ADDI R1,R1,#68	
	12:  Instruction = 24'b00_01010_0_001_000_0000000000;// SW R1,0(R0)
	15:  Instruction = 24'b00_00000_0_001_001_000_0000000;// AND R1,R1,R0	
	18:  Instruction = 24'b00_01000_0_001_001_0001100101;//ADDI R1,R1,#65	
	21:  Instruction = 24'b00_01010_0_001_000_0000000001;//SW R1,1(R0)						
	27:  Instruction = 24'b00_00000_0_001_001_000_0000000;//AND R1,R1,R0	
	30:  Instruction = 24'b00_01000_0_001_001_0001101100;//ADDI R1,R1,#6C
	33: Instruction = 24'b00_01010_0_001_000_0000000010;//SW R1,2(R0)	
	36: Instruction = 24'b00_00000_0_001_001_000_0000000;//AND R1,R1,R0	
	39: Instruction = 24'b00_01000_0_001_001_0001101100;//ADDI R1,R1,#6C	
	42: Instruction = 24'b00_01010_0_001_000_0000000011;// SW R1,3(R0)	
	45: Instruction = 24'b00_00000_0_001_001_000_0000000;//AND R1,R1,R0	
	48: Instruction = 24'b00_01000_0_001_001_0001101111;//ADDI R1,R1,#6F		
	51: Instruction = 24'b00_01010_0_001_000_0000000100;//SW R1,4(R0)	
	54: Instruction = 24'b00_00000_0_001_001_000_0000000;//AND R1,R1,R0	
	57: Instruction = 24'b00_01000_0_001_001_0000100000;//ADDI R1,R1,#20
	60: Instruction = 24'b00_01010_0_001_000_0000000101;//SW R1,5(R0)	
	63: Instruction = 24'b00_00000_0_001_001_000_0000000;//AND R1,R1,R0		
	66: Instruction = 24'b00_01000_0_001_001_0001110111;//ADDI R1,R1,#77	
	69: Instruction = 24'b00_01010_0_001_000_0000000110;//SW R1,6(R0)	
	72: Instruction = 24'b00_00000_0_001_001_000_0000000;//AND R1,R1,R0	
	75: Instruction = 24'b00_01000_0_001_001_0001101111;//ADDI R1,R1,#6F	
	78: Instruction = 24'b00_01010_0_001_000_0000000111;// SW R1,7(R0)	
	81: Instruction = 24'b00_00000_0_001_001_000_0000000;//AND R1,R1,R0
	84: Instruction = 24'b00_01000_0_001_001_0001110010;// ADDI R1,R1,#72	
	87: Instruction = 24'b00_01010_0_001_000_0000001000;//SW R1,8(R0)	
	90: Instruction = 24'b00_00000_0_001_001_000_0000000;//AND R1,R1,R0	
	93: Instruction = 24'b00_01000_0_001_001_0001101100;//ADDI R1,R1,#6C		
	96: Instruction = 24'b00_01010_0_001_000_0000001001;//SW R1,9(R0)	
	99: Instruction = 24'b00_00000_0_001_001_000_0000000;//AND R1,R1,R0	
	102: Instruction = 24'b00_01000_0_001_001_0001100100;//ADDI R1,R1,#64		
	105: Instruction = 24'b00_01010_0_001_000_0000001010;//SW R1,A(R0)	
	108: Instruction = 24'b00_00000_0_001_001_000_0000000;//AND R1,R1,R0		
	111: Instruction = 24'b00_01000_0_001_001_0000000000;//ADDI R1,R1,#0		
	114: Instruction = 24'b00_01010_0_001_000_0000001011;//SW R1,B(R0)		
	117: Instruction = 24'b00_00110_0_000_111_000_0000000;//JR	
	120: Instruction = 24'b00_00000_0_001_001_000_0000000 ;//strlen:AND R1,R1,R0	
	123: Instruction = 24'b00_00000_0_011_011_000_0000000;//AND R3,R3,R0	
	126: Instruction = 24'b00_01001_0_010_001_0000000000;//loop: LW R2,0(R1)	
	129: Instruction = 24'b00_01111_1_000_010_000_0000000;//SUBSF R0,R2,R0		
	132: Instruction = 24'b01_01011_0_010_000_0000001001;//BEQ R2,R0,end		
	135: Instruction = 24'b00_01000_0_011_011_0000000001;//ADDI R3,R3,#1		
	138: Instruction = 24'b00_01000_0_001_001_0000000001;//ADDI R1,R1,#1
	141: Instruction = 24'b00_01100_00000000001111110;//J loop	
	144: Instruction = 24'b00_00110_0_000_111_000_0000000;//end:  JR		
`endif																	 
`endif
	default: Instruction = 0; //NOOP
endcase
end
endmodule