`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.09.2019 19:59:42
// Design Name: 
// Module Name: top
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


module top(

    input clk_100M,
    inout [7:0] JA,
    output [3:0] anode,
    output [7:0] cathode,
    input enter


    );
    
    wire clk_5ms, clk_1K, clk_7M;
    wire [3:0] decode;
    
    clk_wiz_0 c11(.clk_in1(clk_100M),.clk_out1(clk_7M));
    clk_div #(13) u1( .clk_in(clk_7M) , .clk_out(clk_1K));
    clk_div #(15) u2(.clk_in(clk_7M),.clk_out(clk_5ms));
    
    Decoder s11(.clk(clk_100M),.Row(JA[7:4]),.Col(JA[3:0]),.DecodeOut(decode),.clking(bouncer),.enter(enter));
    
    wire temp_bouncer;
    debouncer d1(.clk_in(clk_5ms),.clr_o(temp_bouncer),.clr_i(bouncer));
    
    wire [7:0] number;
    wire [3:0] ones,tens,hundreds,thousands;
    
    fsm_moore_ccd moore(.clk(temp_bouncer),.din(decode),.present_state(number),.enter(enter));
   
   reg [3:0] first,second,third,fourth;

    always @( * )
    if ( number == 8'd6)
        first <= 4'd1;
    else if ( number == 8'd4)
        first<= 4'd0;
    else if (number == 8'd5 )
        first <= 4'd7;
    else
        first <= 4'd0;    
        
        
        
    always @( * )
    if ( number == 8'd6)
        second <= 4'd2;
    else if ( number == 8'd4)
        second<= 4'd4;
    else if (number == 8'd5 )
        second <= 4'd2;
    else
        second <= 4'd0;    
        
        
        
   always @( * )
    if ( number == 8'd6)
        third <= 4'd3;
    else if ( number == 8'd4)
        third<= 4'd5;
    else if (number == 8'd5 )
        third <= 4'd4;     
    else
        third <= 4'd0;  
     
     

   always @( * )
    if ( number == 8'd6)
        fourth <= 4'd3;
    else if ( number == 8'd4)
        fourth<= 4'd6;
    else if (number == 8'd5 )
        fourth <= 4'd8;
    else
        fourth <= 4'd0;
   
     
    sevenSeg s1(.clk(clk_1K),.ones(fourth),.tens(third),.thousands(first),.hundreds(second),.anode(anode),.cathode(cathode));


endmodule
