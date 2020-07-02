`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.08.2019 19:27:02
// Design Name: 
// Module Name: papa
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



module papa(input [3:0] a, input [3:0] b, input S, output [3:0] out, output V);
    wire C1,C2,C3,C4;

    assign x0=b[0]^S;
    assign x1=b[1]^S;
    assign x2=b[2]^S;
    assign x3=b[3]^S;
    
    addition 
    A0(.a(x0),.b(a[0]),.c(S),.sum(out[0]),.carry(C1)),
    A1(.a(x1),.b(a[1]),.c(C1),.sum(out[1]),.carry(C2)), 
    A2(.a(x2),.b(a[2]),.c(C2),.sum(out[2]),.carry(C3)), 
    A3(.a(x3),.b(a[3]),.c(C3),.sum(out[3]),.carry(C4));
    
    assign V = C3^C4;
    
endmodule
