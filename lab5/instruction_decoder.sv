`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/17/2023 11:26:41 AM
// Design Name: 
// Module Name: instruction_decoder
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

module instruction_decoder(
input logic [6:0] immediate,
input logic [5:0] nzimm,
input logic [8:0] offset,
input logic [3:0] opcode,
output logic RegWrite, RegDst, ALUSrc1, ALUSrc2, MemWrite,  MemToReg, Regsrc,
output logic [15:0] instr_i,
output logic [3:0] ALUOp,
output logic [3:0] opcodeO);
    always_comb
        case (opcode)
            0: begin
               RegWrite = 1;
               RegDst = 1;
               ALUSrc1 = 0;
               ALUSrc2 = 1;
               ALUOp = 0;
               MemWrite = 0;
               MemToReg = 1;
               Regsrc = 0;
               instr_i = 16'(immediate);
               opcodeO = opcode;
               end
            1: begin
               RegWrite = 0;
               RegDst = 0;
               ALUSrc1 = 0;
               ALUSrc2 = 1;
               ALUOp = 0;
               MemWrite = 1;
               MemToReg = 0;
               Regsrc = 0;
               instr_i = 16'(immediate);
               opcodeO = opcode;
               end
            2: begin
               RegWrite = 1;
               RegDst = 1;
               ALUSrc1 = 0;
               ALUSrc2 = 0;
               ALUOp = 0;
               MemWrite = 0;
               MemToReg = 0;
               Regsrc = 1;
               opcodeO = opcode;
               end
            3: begin
               RegWrite = 1;
               RegDst = 1;
               ALUSrc1 = 0;
               ALUSrc2 = 1;
               ALUOp = 0;
               MemWrite = 0;
               MemToReg = 0;
               Regsrc = 1;
               instr_i = 16'(nzimm);
               opcodeO = opcode;
               end
            4: begin
               RegWrite = 1;
               RegDst = 1;
               ALUSrc1 = 0;
               ALUSrc2 = 0;
               ALUOp = 2;
               MemWrite = 0;
               MemToReg = 0;
               Regsrc = 1;
               opcodeO = opcode;
               end
            5: begin
               RegWrite = 1;
               RegDst = 1;
               ALUSrc1 = 0;
               ALUSrc2 = 1;
               ALUOp = 2;
               MemWrite = 0;
               MemToReg = 0;
               Regsrc = 1;
               instr_i = 16'(immediate);
               opcodeO = opcode;
               end
            6: begin
               RegWrite = 1;
               RegDst = 1;
               ALUSrc1 = 0;
               ALUSrc2 = 0;
               ALUOp = 3;
               MemWrite = 0;
               MemToReg = 0;
               Regsrc = 1;
               opcodeO = opcode;
               end
            7: begin
               RegWrite = 1;
               RegDst = 1;
               ALUSrc1 = 0;
               ALUSrc2 = 0;
               ALUOp = 8;
               MemWrite = 0;
               MemToReg = 0;
               Regsrc = 1;
               opcodeO = opcode;
               end
            8: begin
               RegWrite = 1;
               RegDst = 1;
               ALUSrc1 = 0;
               ALUSrc2 = 1;
               ALUOp = 4;
               MemWrite = 0;
               MemToReg = 0;
               Regsrc = 1;
               instr_i = 16'(nzimm);
               opcodeO = opcode;
               end
            9: begin
               RegWrite = 1;
               RegDst = 1;
               ALUSrc1 = 0;
               ALUSrc2 = 1;
               ALUOp = 5;
               MemWrite = 0;
               MemToReg = 0;
               Regsrc = 1;
               instr_i = 16'(nzimm);
               opcodeO = opcode;
               end
            10: begin
               RegWrite = 0;
               RegDst = 0;
               ALUSrc1 = 0;
               ALUSrc2 = 1;
               ALUOp = 6;
               MemWrite = 0;
               MemToReg = 0;
               Regsrc = 0;
               instr_i = 16'(offset);
               opcodeO = opcode;
               end
            11: begin
               RegWrite = 0;
               RegDst = 0;
               ALUSrc1 = 0;
               ALUSrc2 = 1;
               ALUOp = 7;
               MemWrite = 0;
               MemToReg = 0;
               Regsrc = 0;
               instr_i = 16'(offset);
               opcodeO = opcode;
               end
            default: begin
               RegWrite = 0;
               RegDst = 0;
               ALUSrc1 = 0;
               ALUSrc2 = 0;
               ALUOp = 0;
               MemWrite = 0;
               MemToReg = 0;
               Regsrc = 0;
               opcodeO = opcode;
               end
            endcase
endmodule
