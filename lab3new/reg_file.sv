`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/03/2023 10:25:49 AM
// Design Name: 
// Module Name: reg_file
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


module regfile(
input logic rst, clk, wr_en,
input logic [2:0] rd0_addr, rd1_addr, wr_addr,
input logic [15:0] wr_data,
output logic [15:0] rd0_data, rd1_data);

    reg [15:0] mem [0:7];
    always @ (posedge clk)
    begin
        if (rst)
            for (int i = 0; i < 16; i = i + 1)
                begin
                    mem[i] <= 0;
                end
       else if (wr_en)
        mem[wr_addr] = wr_data;

    end
        assign rd0_data = mem[rd0_addr];
        assign rd1_data = mem[rd1_addr];
endmodule
