`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.09.2019 17:51:47
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
    input clk,
    inout [7:0] JA,
    output [3:0] anode,
    output [7:0] cathode,
    output [6:0] cathode1,
    output anode1
    );
    wire [3:0] ones,tens,hundreds,thousands;
    wire clk_1k;
//    wire [1:0] second = 2'b10;
    reg [7:0] result;
    wire clk_5M;
    clk_wiz_0 c11(.clk_in1(clk),.clk_out1(clk_5M));
    clk_div #(13) u1( .clk_in(clk_5M) , .clk_out(clk_1K));
   clk_div #(15) u2(.clk_in(clk_5M),.clk_out(clk_5ms));
   
    wire [3:0] decode,decode1;    
    wire bouncer;
    Decoder d0(.clk(clk),.Row(JA[7:4]),.Col(JA[3:0]),.DecodeOut(decode),.clking(bouncer));
    
    
    
     
    
    
    
    
    
    
   wire bouncing;
//   wire bool;
   
   
   
   reg [3:0] first1,second1;
   reg count;
   
   wire temp_bouncer;
   debouncer d1(.clk_in(clk_5ms),.clr_o(temp_bouncer),.clr_i(bouncer));
   
   always @ (posedge temp_bouncer)
   begin
    count <= count +1'd1;
       if (count == 1'd1)
       begin 
            first1 <= decode;
       end
      
   end
           
   always @ (posedge temp_bouncer)
   begin
    count <= count +1'd1;
       if (count == 1'd0)
       begin 
            second1 <= decode;
       end
   end            
            
       
    always@(*)
    begin
            result = first1*second1;
    end
   sevensegment s2(.clk(clk_1K),.ones(second1),.tens(first1),.anode(anode1),.cathode(cathode1));

    
    wire [7:0] result_temp = result;
    bin_to_bcd b1(.number(result_temp),.ones(ones),.tens(tens),.hundreds(hundreds),.thousands(thousands));
    sevenSeg s1(.clk(clk_1K),.ones(ones),.tens(tens),.thousands(thousands),.hundreds(hundreds),.anode(anode),.cathode(cathode));
    
    
    
    
    
endmodule

