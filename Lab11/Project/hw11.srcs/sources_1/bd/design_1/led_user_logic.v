`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.11.2019 00:01:41
// Design Name: 
// Module Name: led_user_logic
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


module led_user_logic #
(
parameter integer C_LED_WIDTH=4
)
(
input clk,
input reset,
input [C_LED_WIDTH-1:0] data,
output reg [C_LED_WIDTH-1:0] LED
    );
    
always @(posedge clk)
begin
    if(reset==1'b0)
        LED<=0;
    else
        LED<=data;
    
end
 
endmodule
