//-----------------------------------------------------------------------------
//
// Title       : No Title
// Design      : MIPS
// Author      : 3arbeeed
// Company     : 3arbeedCo
//
//-----------------------------------------------------------------------------
//
// File        : C:\Users\3arbeeed\Documents\Architecture\MIPS\compile\CPU.v
// Generated   : Fri Feb 10 21:59:32 2023
// From        : C:\Users\3arbeeed\Documents\Architecture\MIPS\src\CPU.bde
// By          : Bde2Verilog ver. 2.01
//
//-----------------------------------------------------------------------------
//
// Description : 
//
//-----------------------------------------------------------------------------

`ifdef _VCP
`else
`define library(a,b)
`endif


// ---------- Design Unit Header ---------- //
`timescale 1ps / 1ps

module CPU (clk) ;

// ------------ Port declarations --------- //
input clk;
wire clk;

// ----------- Signal declarations -------- //
wire AluSre;
wire ExtOp;
wire MemRd;
wire MemWr;
wire RegWr;
wire sfEnable;
wire Zflag;
wire [23:0] adderBUS;
wire [23:0] ALUbBUS;
wire [2:0] AluOp;
wire [23:0] ALUresultBUS;
wire [23:0] D1BUS;
wire [23:0] InstructionBUS;
wire [23:0] memReadBUS;
wire [23:0] Out1BUS;
wire [23:0] Out2BUS;
wire [23:0] PCbus;
wire [23:0] PCplus3;
wire [1:0] PCSrc;
wire [23:0] PCSrcBUS;
wire [2:0] R1;
wire [2:0] R7;
wire [7:0] reg_8bit_in;
wire [1:0] RegDst;
wire [2:0] Rt;
wire [2:0] RWBUS;
wire [23:0] shiftLeft4BUS;
wire [23:0] signExtBUS;
wire [1:0] WBdata;
wire [7:0] zeroflagBUS;

// -------- Component instantiations -------//

adder U11
(
	.a(PCplus3),
	.b(signExtBUS),
	.sum(adderBUS)
);



// synthesis translate_off
`library("U12","MIPS")
// synthesis translate_on
data_memory U12
(
	.address(ALUresultBUS),
	.write_data(Out2BUS),
	.mem_write(MemWr),
	.mem_read(MemRd),
	.clk(clk),
	.read_data(memReadBUS)
);



mux4x1_3bit U13
(
	.in1(InstructionBUS[15:13]),
	.in2(InstructionBUS[15:13]),
	.in3(R7),
	.in4(R1),
	.select(RegDst),
	.out(RWBUS)
);



sign_ext U14
(
	.in(InstructionBUS[9:0]),
	.out(signExtBUS),
	.extOp(ExtOp)
);



adder_3 U15
(
	.a(PCbus),
	.sum(PCplus3)
);



registerFile U19
(
	.R1(InstructionBUS[12:10]),
	.R2(Rt),
	.W1(RWBUS),
	.D1(D1BUS),
	.We(RegWr),
	.Out1(Out1BUS),
	.Out2(Out2BUS),
	.clk(clk)
);



// synthesis translate_off
`library("U2","MIPS")
// synthesis translate_on
PC U2
(
	.clk(clk),
	.in(PCSrcBUS),
	.out(PCbus)
);



ALU U20
(
	.A(Out1BUS),
	.B(ALUbBUS),
	.opcode(AluOp),
	.result(ALUresultBUS),
	.zero(Zflag)
);



ControlUnit U21
(
	.opcode(InstructionBUS[21:17]),
	.cond(InstructionBUS[23:22]),
	.zeroFlag(zeroflagBUS[0]),
	.sfInput(InstructionBUS[16]),
	.sfEnable(sfEnable),
	.RegDst(RegDst),
	.WBdata(WBdata),
	.PCSrc(PCSrc),
	.RegWr(RegWr),
	.ExtOp(ExtOp),
	.ALuSre(AluSre),
	.MemRd(MemRd),
	.MemWr(MemWr),
	.AluOp(AluOp)
);



mux2x1 U24
(
	.in1(Out2BUS),
	.in2(signExtBUS),
	.select(AluSre),
	.out(ALUbBUS)
);



InsMem U26
(
	.ReadAddress(PCbus),
	.Instruction(InstructionBUS)
);



mux4x1 U3
(
	.in1(PCplus3),
	.in2({PCbus[23:17], InstructionBUS[16:0]}),
	.in3(adderBUS),
	.in4(Out1BUS),
	.select(PCSrc),
	.out(PCSrcBUS)
);



mux4x1 U4
(
	.in1(ALUresultBUS),
	.in2(memReadBUS),
	.in3(PCplus3),
	.in4(shiftLeft4BUS),
	.select(WBdata),
	.out(D1BUS)
);



shift_left_4 U5
(
	.a(signExtBUS),
	.b(shiftLeft4BUS)
);



mux2x1_3bit U6
(
	.in1(InstructionBUS[15:13]),
	.in2(InstructionBUS[9:7]),
	.select(RegDst[0]),
	.out(Rt)
);



_1x8uExt U8
(
	.in(Zflag),
	.out(reg_8bit_in)
);



reg_8bit U9
(
	.clk(clk),
	.en(sfEnable),
	.in(reg_8bit_in),
	.out(zeroflagBUS)
);



endmodule 
