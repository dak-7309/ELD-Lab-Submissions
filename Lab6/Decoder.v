`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.09.2019 20:02:17
// Design Name: 
// Module Name: Decoder
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



module Decoder(
    input clk,
    input [3:0] Row,
    output reg [3:0] Col,
    output clking,
    output reg [3:0] DecodeOut,
    input enter         
    );
    
    
    reg [3:0] temp;
    reg [19:0] sclk = 0 ;
   
    always @ (posedge clk)
    begin
        if (sclk == 20'b00011000011010100000)
            begin
                Col <= 4'b0111;
                sclk <= sclk + 1'b1;
                temp[0] <= 1'b1;
            end
       else if(sclk ==20'b00011000011010101000)
            begin
                if (Row==4'b0111) begin
                DecodeOut <= 4'b0001;
            end
            else if (Row == 4'b1011) begin 
                DecodeOut <= 4'b0100;
            end
            else if (Row == 4'b1101) begin 
                DecodeOut <= 4'b0111;
            end
            else if (Row == 4'b1110) begin 
                DecodeOut <= 4'b0000;
            end
            else begin
                temp[0] = 1'b0;
           end
            sclk <= sclk + 1'b1;
        end
        else if (sclk == 20'b00110000110101000000) begin
            Col <= 4'b1011;
            sclk <= sclk +1'b1;
            temp[1]<= 1'b1;
        end
        else if (sclk == 20'b00110000110101001000) begin 
            if (Row==4'b0111) begin
                DecodeOut <= 4'b0010;
            end
            else if (Row == 4'b1011) begin 
                DecodeOut <= 4'b0101;
            end
            else if (Row == 4'b1101) begin 
                DecodeOut <= 4'b1000;
            end
            else if (Row == 4'b1110) begin 
                DecodeOut <= 4'b1111;
            end
            else
            begin  
               temp[1] <= 1'b0; 
            end
            sclk <= sclk + 1'b1;
        end
        
        
        else if (sclk == 20'b01001001001111100000) begin
            Col <= 4'b1101;
            sclk <= sclk +1'b1;
            temp[2]<= 1'b1;
        end
        else if (sclk == 20'b01001001001111101000) begin 
            if (Row==4'b0111) begin
                DecodeOut <= 4'b0011;
            end
            else if (Row == 4'b1011) begin 
                DecodeOut <= 4'b0110;
            end
            else if (Row == 4'b1101) begin 
                DecodeOut <= 4'b1001;
            end
            else if (Row == 4'b1110) begin 
                DecodeOut <= 4'b1110;
            end
            else
            begin
                temp[2]<=1'b0;
            end
            sclk <= sclk + 1'b1;
        end
        
        
        else if (sclk == 20'b01100001101010000000) begin
            Col <= 4'b1110;
            sclk <= sclk +1'b1;
            temp[3]<= 1'b1;
        end
        else if (sclk == 20'b01100001101010001000) begin 
            if (Row==4'b0111) begin
                DecodeOut <= 4'b1010;
            end
            else if (Row == 4'b1011) begin 
                DecodeOut <= 4'b1011;
            end
            else if (Row == 4'b1101) begin 
                DecodeOut <= 4'b1100;
            end
            else if (Row == 4'b1110) begin 
                DecodeOut <= 4'b1101;
            end
            else
            begin
                temp[3] <= 1'b0;
            end
            sclk <= 20'b00000000000000000000;
        end
        
        
        else begin 
        sclk <= sclk + 1'b1;
       end
   end
    
    assign clking = temp[0]|temp[1]|temp[2]|temp[3]|enter; 
endmodule

