`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/03/2023 11:17:53 AM
// Design Name: 
// Module Name: alu_reg_file_tb
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


module alu_reg_file_tb();

logic rst, clk, wr_en;
logic [2:0] rd0_addr, rd1_addr, wr_addr;
logic [15:0] wr_data, rd0_data, rd1_data;

logic alusrc1; // input
logic alusrc2; // input
logic[15:0] aluSrcInput;

logic [15:0] a, b, f; //result 
logic [2:0] s; //input
logic ovf, take_branch; // result


regfile reggy(rst, clk, wr_en, rd0_addr, rd1_addr, wr_addr, wr_data, rd0_data, rd1_data);
TwoToOneMux zeroMux(.a(rd0_data), .b(0), .sel_mux(alusrc1), .out(a));
TwoToOneMux sourceMux(.a(rd1_data), .b(aluSrcInput), .sel_mux(alusrc2), .out(b));
alu alu1(a, b, s, ovf, take_branch, f);

initial begin
    rst = 1;
    #10 rst = 0;
end
initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin
    #10 wr_en = 0; alusrc1 = 1; aluSrcInput = 15; alusrc2 = 1; s = 0;
    #10 wr_en = 1; wr_addr = 2; wr_data = f;
    #10 wr_en = 0; alusrc1 = 1; aluSrcInput = 17; alusrc2 = 1; s = 0;
    #10 wr_en = 1; wr_addr = 3; wr_data = f;
    #10 wr_en = 0; alusrc1 = 0; alusrc2 = 0; rd0_addr = 2; rd1_addr = 3; s = 0;
    #10 wr_en = 1; wr_addr = 0; wr_data = 90;
    #10 wr_en = 0; alusrc1 = 0; rd0_addr = 0; aluSrcInput = 9; alusrc2 = 1; s = 0;
    #10 wr_en = 0; alusrc1 = 1; alusrc2 = 0; rd1_addr = 2; s = 0;
    #10 $finish;
end




endmodule
