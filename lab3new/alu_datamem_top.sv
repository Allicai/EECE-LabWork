`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/18/2022 09:58:38 AM
// Design Name: 
// Module Name: alu_datamem_top
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


module alu_datamem_top(input clk,	// clock for vio and regfile
        input logic reset,
		output logic ovf_ctrl,
		output logic take_branch,
		output logic [3:0] disp_en,		// 7-Segment display enable
		output logic [6:0] seg7_output    // LD3
    );
    
    logic [15:0] alu_input1, alu_input2,alu_input2_instr_src;
    logic [15:0] alu_output;
    logic [3:0] ALUOp;
    logic RegWrite;
    logic alu_ovf_flag, alu_take_branch;
    

    logic [2:0] regfile_ReadAddress1;	//source register1 address
    logic [2:0] regfile_ReadAddress2;	//source register2 address
    logic [2:0] regfile_WriteAddress;	//destination register address
    logic [15:0] regfile_WriteData;		//result data
    logic [15:0] regfile_ReadData1;		//source register1 data
    logic [15:0] regfile_ReadData2;		//source register2 data
    logic ALUSrc1, ALUSrc2;
    logic [15:0] DataMemOut;
    logic [15:0] zero_register = 0;
    logic MemWrite;
    
	assign ovf_ctrl = alu_ovf_flag;
	assign take_branch = alu_take_branch;
	
    // Instantiate RegFile module here
    regfile reg1(.rst(reset),.clk(clk),.wr_en(RegWrite),.rd0_addr(regfile_ReadAddress1),
    .rd1_addr(regfile_ReadAddress2),.wr_addr(regfile_WriteAddress),
    .wr_data(regfile_WriteData),.rd0_data(regfile_ReadData1),.rd1_data(regfile_ReadData2)
    );
    //Instantiate muxes here
    TwoToOneMux mux1(.a(regfile_ReadData1),.b(zero_register),.sel_mux(ALUSrc1),.out(alu_input1));
    TwoToOneMux mux2(.a(regfile_ReadData2),.b(alu_input2_instr_src),.sel_mux(ALUSrc2),.out(alu_input2));
   //Instantiate the sixteenbit_alu module here	
    alu sixteenbit_alu(
        .s(ALUOp),
        .a(alu_input1),
        .b(alu_input2),
        .f(alu_output),
        .ovf(alu_ovf_flag),
        .take_branch(alu_take_branch)
        );
        
    data_memory data(.clk(clk),
                  .we(MemWrite),
                  .a(alu_output),
                  .d(regfile_ReadData2),
                  .spo(DataMemOut));
                  
    TwoToOneMux mux3(.a(alu_output),.b(DataMemOut),.sel_mux(MemToReg),.out(regfile_WriteData));
   
    Adaptor_display display(
		.clk(clk), 					// system clock
		.input_value(alu_output),	// 16-bit input [15:0] value to display
		.disp_en(disp_en),			// output [3:0] 7 segment display enable
		.seg7_output(seg7_output)	// output [6:0] 7 segment signals
	);

    //Instantiate the VIO core here
    //Find the instantiate template from Sources Pane, IP sources -> Instantiation Template -> vio_0.veo (double click to open the file)        
    vio_0 vio (
          .clk(clk),                // input logic clk
          .probe_in0(regfile_WriteData),    // input logic [15 : 0] probe_in0
          .probe_in1(regfile_ReadData1),    // input logic [0 : 0] probe_in1
          .probe_in2(regfile_ReadData2),    // input logic [0 : 0] probe_in2
          .probe_in3(alu_input1),
          .probe_in4(alu_input2),
          .probe_in5(alu_take_branch),
          .probe_in6(alu_ovf_flag),
          .probe_in7(alu_output),
          .probe_in8(DataMemOut),
          .probe_out0(RegWrite),  // output logic [15 : 0] probe_out0
          .probe_out1(alu_input2_instr_src),  // output logic [15 : 0] probe_out1
          .probe_out2(ALUSrc1),
          .probe_out3(ALUSrc2),
          .probe_out4(ALUOp),
          .probe_out5(MemWrite),
          .probe_out6(MemToReg),
          .probe_out7(regfile_ReadAddress1),
          .probe_out8(regfile_ReadAddress2),
          .probe_out9(regfile_WriteAddress)
        );
endmodule

