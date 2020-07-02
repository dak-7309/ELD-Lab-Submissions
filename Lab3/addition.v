`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.08.2019 19:26:19
// Design Name: 
// Module Name: addition
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

module addition(input a, input b, input c, output sum, output carry);
    assign sum = a^b^c;
    assign carry = (a&b)|(c&(a^b));
    
endmodule



