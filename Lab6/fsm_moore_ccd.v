`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.09.2019 20:06:18
// Design Name: 
// Module Name: fsm_moore_ccd
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



module fsm_moore_ccd(
    input clk,
    input enter,
    input [3:0] din,
    output reg [3:0] present_state
    );

    reg [3:0] next_state;
    parameter s0=4'd0, s1=4'd1, s2=4'd2, s3=4'd3, s4=4'd4, s5=4'd5, s6=4'd6, s7=4'd7, s8=4'd8, s9=4'd9, s10=4'd10, s11=4'd11, s12=4'd12;
    
//    s4- invalid
//    s6- pass
//    s5- fail

    always @(posedge clk)
    begin 
        present_state <= next_state;       
    end
    
    always @( present_state )
    begin 
        case ( present_state ) 
            s0 :if ( enter )
                    next_state <= s4; 
                else if (din == 4'd12)
                    next_state <= s1;
                 else
                    next_state <= s7;
                    
            s1 :if ( enter )
                    next_state <= s4; 
                else if (din == 4'd12)
                    next_state <= s2;
                 else
                    next_state <= s8;


            s2 :if ( enter )
                    next_state <= s4; 
                 else if ( din == 4'd13 )
                    next_state <= s3;
                 else 
                    next_state <= s9;


            s3: if ( enter )
                    next_state <= s6;
                  else 
                    next_state <= s10;


            s7 : if ( enter )
                    next_state <= s4;
                else 
                    next_state <=s8;

            
            s8: if ( enter ) 
                    next_state <= s4;
                else
                    next_state <=  s9;


            s9 :if ( enter )
                    next_state <= s5;
                else
                    next_state <= s10;
            

            s10 : if ( enter )
                    next_state <= s4;
                  else 
                    next_state <= s10;


            s4 : if ( din == 4'd12 ) 
                    next_state  <= s1;
                else 
                    next_state <= s7;


            s6 : if ( din == 4'd12 ) 
                    next_state  <= s1;
                else 
                    next_state <= s7;
                    
                    
            s5 : if ( din == 4'd12 ) 
                    next_state  <= s1;
                else 
                    next_state <= s7;        
           
            default : next_state <= s0;

        endcase 
    end


endmodule

