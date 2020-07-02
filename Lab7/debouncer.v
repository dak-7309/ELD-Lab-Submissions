`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.09.2019 16:01:33
// Design Name: 
// Module Name: debouncer
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


module debouncer(
    input clk_in,input rst,output rst_out
    );
    reg d1,d2,d3;
    
    always@(posedge clk_in)
    begin
        d1<=rst;
        d2<=d1;
        d3<=d2;
    end
    assign rst_out=d1&d2&~d3;
endmodule
