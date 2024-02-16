`timescale 1ns / 1ps



module alu(
input logic signed [15:0] a,
input logic [15:0] b,
input logic [3:0] s,
output logic ovf, take_branch,
output logic [15:0] f
    );
    
    always_comb
        case(s)
            0 : begin
                   f = a + b;
                   take_branch = 0;
                   if ((a[15] & b[15] & ~f[15]) | (~a[15] & ~b[15] & f[15]))
                        ovf = 1;
                   else
                        ovf = 0;
                end
            1 : begin
                    f = ~b;
                    take_branch = 0;
                    ovf = 0;
                end
            2 : begin
                    f = a & b;
                    take_branch = 0;
                    ovf = 0;
                end
            3 : begin
                    f = a | b;
                    take_branch = 0;
                    ovf = 0;
                end
            4 : begin
                    f = a >>> b;
                    take_branch = 0;
                    ovf = 0;
                end
            5 : begin
                    f = a << b;
                    take_branch = 0;
                    ovf = 0;
                end
            6 : begin
                    f = 0;
                    if (a == 0)
                        take_branch = 1;
                    else
                        take_branch = 0;
                    ovf = 0;
                end
            7 : begin
                    f = 0;
                    if (a != 0)
                        take_branch = 1;
                    else
                        take_branch = 0;
                    ovf = 0;
                end
            default : begin
                        f = a ^ b;
                        take_branch = 0;
                        ovf = 0;
                    end
            endcase
endmodule
