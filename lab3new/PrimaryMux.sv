`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/03/2023 10:59:33 AM
// Design Name: 
// Module Name: PrimaryMux
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


module TwoToOneMux(
input logic [15:0] a, b,
input logic sel_mux,
output logic [15:0] out
    );
    always_comb
        if (sel_mux)
            out = b;
        else
            out = a;
endmodule
