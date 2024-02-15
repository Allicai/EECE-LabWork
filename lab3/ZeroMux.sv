`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/15/2024 03:32:34 AM
// Design Name: 
// Module Name: ZeroMux
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


module ZeroMux(
input logic [15:0] rd1,
input logic alusrc1,
output logic [15:0] input1
    );
    
    always_comb
        if (alusrc1)
            input1 = 0;
        else 
            input1 = rd1;
endmodule
