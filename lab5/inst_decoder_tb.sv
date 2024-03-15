`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/15/2024 02:45:47 PM
// Design Name: 
// Module Name: inst_decoder_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module inst_decoder_tb();
logic [6:0] immediate;
logic [5:0] nzimm;
logic [8:0] offset;
logic [3:0] opcode;
logic RegWrite, RegDst, ALUSrc1, ALUSrc2, MemWrite,  MemToReg, Regsrc;
logic [15:0] instr_i;
logic [3:0] ALUOp;
logic [3:0] opcode0;

instruction_decoder UUT(
    .immediate(immediate),
    .nzimm(nzimm),
    .offset(offset),
    .opcode(opcode),
    .RegWrite(RegWrite),
    .RegDst(RegDst),
    .ALUSrc1(ALUSrc1),
    .ALUSrc2(ALUSrc2),
    .MemWrite(MemWrite),
    .MemToReg(MemToReg),
    .Regsrc(Regsrc),
    .instr_i(instr_i),
    .ALUOp(ALUOp),
    .opcodeO(opcodeO)
    );

//initial begin
//    clk = 0;
//    forever #5 clk = ~clk;
//end

initial begin
    opcode=4'b0000; RegWrite=1; RegDst=1; ALUSrc1=0; ALUSrc2=1; ALUOp=0; MemWrite=0; MemToReg=1; Regsrc=0;
    #10
    opcode=4'b0001; RegWrite=0; RegDst=1; ALUSrc1=0; ALUSrc2=1; ALUOp=0; MemWrite=1; MemToReg=0; Regsrc=0;
    #10
    opcode=4'b0010; RegWrite=1; RegDst=1; ALUSrc1=0; ALUSrc2=0; ALUOp=0; MemWrite=0; MemToReg=0; Regsrc=1;
    #10
    opcode=4'b0011; RegWrite=1; RegDst=1; ALUSrc1=0; ALUSrc2=1; ALUOp=0; MemWrite=0; MemToReg=0; Regsrc=1;
    #10
    opcode=4'b0100; RegWrite=1; RegDst=1; ALUSrc1=0; ALUSrc2=0; ALUOp=4'b0010; MemWrite=0; MemToReg=0; Regsrc=1; 
    #10
    opcode=4'b0101; RegWrite=1; RegDst=1; ALUSrc1=0; ALUSrc2=1; ALUOp=4'b0010; MemWrite=0; MemToReg=0; Regsrc=1;
    #10
    opcode=4'b0110; RegWrite=1; RegDst=1;  ALUSrc1=0; ALUSrc2=0; ALUOp=4'b0011; MemWrite=0; MemToReg=0; Regsrc=1;
    #10
    opcode=4'b0111; RegWrite=1; RegDst=1; ALUSrc1=0; ALUSrc2=0; ALUOp=0; MemWrite=0; MemToReg=0; Regsrc=1;
    #10 $finish;
end
endmodule
