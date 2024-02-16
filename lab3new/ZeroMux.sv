`timescale 1ns / 1ps



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
