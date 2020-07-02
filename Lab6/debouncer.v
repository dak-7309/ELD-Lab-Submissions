`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.09.2019 20:04:50
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
    input clk_in,
    input clr_i,
    output clr_o
    );
    
    reg d1, d2, d3;
    
    always @(posedge clk_in)
    begin
        d1 <= clr_i;
        d2 <= d1;
        d3 <= d2;
    end
    
    assign clr_o = d1 && d2 && !d3;
endmodule