`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.09.2019 17:53:23
// Design Name: 
// Module Name: sevensegment
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

module sevensegment(

    input clk, 
    input [3:0] ones, 
    input [3:0] tens,
    output [7:0] cathode,
    output  anode
    );
    
    reg [6:0] cathode_temp = 7'b0000000;
    reg  anode_temp = 1'b0;
    reg  count = 0;  
     
    always @(posedge clk)
    begin
        count = count + 1;
    end

  always @(posedge clk)
    begin
       case(count)
       1'b0:
       begin
            case(ones)
                4'd0 : cathode_temp = 7'b1111110; //to display 0
                4'd1 : cathode_temp = 7'b0110000; //to display 1
                4'd2 : cathode_temp = 7'b1101101;
                4'd3 : cathode_temp = 7'b1111001;
                4'd4 : cathode_temp = 7'b0110011;
                4'd5 : cathode_temp = 7'b1011011;
                4'd6 : cathode_temp = 7'b1011111;
                4'd7 : cathode_temp = 7'b1110000;
                4'd8 : cathode_temp = 7'b1111111;
                4'd9 : cathode_temp = 7'b1111011;
                4'd10 : cathode_temp = 7'b1110111;
                4'd11 : cathode_temp = 7'b0011111;
                4'd12 : cathode_temp = 7'b1001110;
                4'd13 : cathode_temp = 7'b0111101;
                4'd14 : cathode_temp = 7'b1101111;
                4'd15 : cathode_temp = 7'b1000111;
                default : cathode_temp = 7'b0000000; 
           endcase
          
          anode_temp = 1'b0;  
         end
         
        1'b1:
        begin
             case(tens)
                4'd0 : cathode_temp = 7'b1111110; //to display 0
                4'd1 : cathode_temp = 7'b0110000; //to display 1
                4'd2 : cathode_temp = 7'b1101101;
                4'd3 : cathode_temp = 7'b1111001;
                4'd4 : cathode_temp = 7'b0110011;
                4'd5 : cathode_temp = 7'b1011011;
                4'd6 : cathode_temp = 7'b1011111;
                4'd7 : cathode_temp = 7'b1110000;
                4'd8 : cathode_temp = 7'b1111111;
                4'd9 : cathode_temp = 7'b1111011;
                4'd10 : cathode_temp = 7'b1110111;
                4'd11 : cathode_temp = 7'b0011111;
                4'd12 : cathode_temp = 7'b1001110;
                4'd13 : cathode_temp = 7'b0111101;
                4'd14 : cathode_temp = 7'b1101111;
                4'd15 : cathode_temp = 7'b1000111;
                default : cathode_temp = 7'b0000000;
             endcase
            
          anode_temp = 1'b1;
         end
         
        
       endcase
      end  
     
     assign anode = anode_temp;
     assign cathode = cathode_temp;

endmodule

