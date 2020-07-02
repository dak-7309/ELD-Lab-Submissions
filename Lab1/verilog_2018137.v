`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.08.2019 15:09:05
// Design Name: 
// Module Name: priority_encoder
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


module priority_encoder(output[1:0] E_output, input [3:0] E_input );
    or o1(E_output[1],E_input[3],E_input  [2]);
    not n1(N,E_input[2]);
    and a1(A,N,E_input[1]);
    or o2(E_output[0],A,E_input[3]);
    
endmodule
