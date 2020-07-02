`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.09.2019 18:05:57
// Design Name: 
// Module Name: clk_div
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

module clk_div
    #(
        parameter divide_by = 19 
      )
      ( input clk_in,
      output clk_out );
      reg [divide_by-1:0] count = 0 ;
      
      always @ (posedge clk_in)
      begin
        count = count+1 ;
      end
      
      assign clk_out = count[divide_by-1] ;
      
endmodule
