module ControlUnit(
    input [4:0] opcode,
    input [1:0] cond,
    input zeroFlag,
	input sfInput,
    output reg sfEnable,
    output reg [1:0] RegDst,
    output reg [1:0] WBdata,
    output reg [1:0] PCSrc,
    output reg RegWr,
    output reg ExtOp,
    output reg ALuSre,
    output reg MemRd,
    output reg MemWr,
    output reg [2:0] AluOp
);
    reg [16:0] opcode_decoder;

    always @(*) begin
        opcode_decoder = 16'b0;
        case (opcode)
            5'b00000: opcode_decoder[0] <= 1'b1;//AND
            5'b00001: opcode_decoder[1] <= 1'b1;//CAS
            5'b00010: opcode_decoder[2] <= 1'b1;//Lws
            5'b00011: opcode_decoder[3] <= 1'b1;//ADD
            5'b00100: opcode_decoder[4] <= 1'b1;//SUB
            5'b00101: opcode_decoder[5] <= 1'b1;//CMP
            5'b00110: opcode_decoder[6] <= 1'b1;//JR
            5'b00111: opcode_decoder[7] <= 1'b1;//ANDI
            5'b01000: opcode_decoder[8] <= 1'b1;//ADDI
            5'b01001: opcode_decoder[9] <= 1'b1;//Lw
            5'b01010: opcode_decoder[10] <= 1'b1;//Sw
            5'b01011: opcode_decoder[11] <= 1'b1;//BEQ
            5'b01100: opcode_decoder[12] <= 1'b1;//J
            5'b01101: opcode_decoder[13] <= 1'b1;//JAL
            5'b01110: opcode_decoder[14] <= 1'b1;//LUI
            5'b01111: opcode_decoder[15] <= 1'b1;//SUBSF
            5'b10000: opcode_decoder[16] <= 1'b1;//SUBISF
            // other opcodes
            default: opcode_decoder <= 16'b0;
        endcase
    	case (opcode) 
            5'b00000: AluOp <= 3'b010;//AND
            5'b00001: AluOp <= 3'b011;//CAS
            5'b00010: AluOp <= 3'b000;//Lws
            5'b00011: AluOp <= 3'b000;//ADD
            5'b00100: AluOp <= 3'b001;//SUB
            5'b00101: AluOp <= 3'b100;//CMP
            5'b00110: AluOp <= 3'b000;//JR
            5'b00111: AluOp <= 3'b010;//ANDI
            5'b01000: AluOp <= 3'b000;//ADDI
            5'b01001: AluOp <= 3'b000;//Lw
            5'b01010: AluOp <= 3'b000;//Sw
            5'b01011: AluOp <= 3'b100;//BEQ
            5'b01100: AluOp <= 3'b000;//J
            5'b01101: AluOp <= 3'b000;//JAL
            5'b01110: AluOp <= 3'b000;//LUI
            5'b01111: AluOp <= 3'b110;//SUBSF
            5'b10000: AluOp <= 3'b110;//SUBISF
            // other opcodes
    	endcase	 
		
	   	if((opcode >= 5'b00000 && opcode <= 5'b01011)||(opcode >= 5'b01111 && opcode <= 5'b10000)) begin
			   sfEnable <= 	sfInput;
		end
		else sfEnable <= 0;
			   
		   
	
    end
    // Map the outputs to the correct bit of the opcode_decoder
	always @(*) begin
		
		if ((cond == 2'b00) || (cond == 2'b10) && (zeroFlag == 0) || (cond == 2'b01) && (zeroFlag == 1)) begin
			
			 MemRd <= (opcode_decoder[2]) | (opcode_decoder[9]);
			
			 MemWr <= opcode_decoder[10];
			
			 RegWr <= opcode_decoder[0] | opcode_decoder[1] | opcode_decoder[2] | opcode_decoder[3] | opcode_decoder[4] | opcode_decoder[7] | opcode_decoder[8] | opcode_decoder[9] |
						   opcode_decoder[13] | opcode_decoder[14] | opcode_decoder[15] | opcode_decoder[16];
						   
			 ALuSre <= opcode_decoder[7] | opcode_decoder[8] | opcode_decoder[9] | opcode_decoder[10] | opcode_decoder[16];
			
			 WBdata[1] <= (opcode_decoder[13] | opcode_decoder[14]);	
			 WBdata[0] <= (opcode_decoder[2] | opcode_decoder[9] | opcode_decoder[14]);
			
			 PCSrc[1] <= (opcode_decoder[6] | (opcode_decoder[11] & zeroFlag));
			 PCSrc[0] <= (opcode_decoder[6] | opcode_decoder[13] | opcode_decoder[12]);
			
			 RegDst[1] <= (opcode_decoder[13] | opcode_decoder[14]) ;
			 RegDst[0] <= (opcode_decoder[14] | opcode_decoder[0] | opcode_decoder[1] | opcode_decoder[2] | opcode_decoder[3] | opcode_decoder[4]);
			 ExtOp <= ~(opcode_decoder[7]);
		end	 
		else if (((cond == 2'b10) && (zeroFlag == 1)) || (cond == 2'b11) || ((cond == 2'b01) && (zeroFlag == 0))) begin
			 MemRd <= 0;
			 MemWr <= 0;
			 RegWr <= 0;
			 ALuSre <= 0;
			 WBdata[1] <= 0;
			 WBdata[0] <= 0;
			 PCSrc[1] <= 0;
			 PCSrc[0] <= 0;
			 RegDst[1] <= 0;
			 RegDst[0] <= 0;
			 ExtOp <= 0;
		end	
	end
endmodule