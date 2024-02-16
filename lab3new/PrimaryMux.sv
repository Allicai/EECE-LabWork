`timescale 1ns / 1ps


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
