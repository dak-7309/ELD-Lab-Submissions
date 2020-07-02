`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.09.2019 18:08:35
// Design Name: 
// Module Name: bin_to_bcd
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


module bin_to_bcd(

    input [7:0] number , 
    output reg [3:0] thousands, 
    output reg [3:0] hundreds, 
    output reg [3:0] tens, 
    output reg [3:0] ones
    );

    reg [19:0] shift = 0;
    integer i;
    
    always @(number)
    begin
        
        shift[19:8] = 0;
        shift[7:0] = number;
        
        for (i=0; i<8; i=i+1)
        begin
            if (shift[11:8] >= 5)
                shift[11:8] = shift[11:8] + 3;
    
            if (shift[15:12] >= 5)
                shift[15:12] = shift[15:12] + 3;
    
            if (shift[19:16] >= 5)
                shift[19:16] = shift[19:16] + 3;
                
            shift = shift << 1;
        end
    
        thousands <= 4'b0000; // as an 8-bit number can be stored in 3 digit BCD code.
        hundreds <= shift[19:16];
        tens <= shift[15:12];
        ones <= shift[11:8];
    
    end
    
endmodule
