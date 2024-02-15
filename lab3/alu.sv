`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/06/2024 05:32:44 PM
// Design Name: 
// Module Name: alu
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


module alu (
    input logic signed [15:0] a,
    input logic signed [15:0] b,
    input logic [3:0] s,
    output logic [15:0] f,
    output logic take_branch,
    output logic ovf
);

always @(*) begin
    
    case(s)
        // ADD(i) (addition with immediate)
        4'b0000: begin
            f = a + b;
            ovf = (b[15] == a[15] && f[15] != b[15]);
            take_branch = 0;
        end
        
        // INV (bitwise inversion of b)
        4'b0001: begin
            f = ~b;
            ovf = 0;
            take_branch = 0;
        end
        
        // AND(i) (bitwise AND with immediate)
        4'b0010: begin
            f = a & b;
            ovf = 0;
            take_branch = 0;
        end
        
        // OR(i) (bitwise OR with immediate)
        4'b0011: begin
            f = a | b;
            ovf = 0;
            take_branch = 0;
        end
        
        // SRA (arithmetic shift right)
        4'b0100: begin
            f = a >>> b;
            ovf = 0;
            take_branch = 0;
        end
        
        // SLL (logical shift left)
        4'b0101: begin
            f = a << b;
            ovf = 0;
            take_branch = 0;
        end
        
        // BEQZ (branch if equal to zero)
        4'b0110: begin
            f = 0;
            ovf = 0;
            take_branch = (a == 0);
        end
        
        // BNEZ (branch if not equal to zero)
        4'b0111: begin
            f = 0;
            ovf = 0;
            take_branch = (a != 0);
        end
        
        // XOR (bitwise XOR)
        4'b1000: begin
            f = a ^ b;
            ovf = 0;
            take_branch = 0;
        end
        
        // Default case
        default: begin
            f = 0;
            ovf = 0;
            take_branch = 0;
        end
    endcase
end

endmodule
