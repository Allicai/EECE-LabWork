`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/22/2024 08:10:19 PM
// Design Name: 
// Module Name: program_counter
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

module program_counter(
input logic clk, rst,
output logic [7:0] pc);

    always @(posedge clk, posedge rst)
        begin
        if (rst)
            begin
                pc = 0;
            end
        else
            begin
                pc = pc + 8'd1;
            end
        end
endmodule
