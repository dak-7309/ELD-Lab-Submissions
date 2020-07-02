`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.09.2019 17:54:57
// Design Name: 
// Module Name: sevenSeg
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


module sevenSeg(
    input clk,
    input [3:0] ones,
    input [3:0] tens,
    input [3:0] hundreds,
    input [3:0] thousands,
    output [3:0] anode,
    output [7:0] cathode
    );
    
    reg [6:0] cathode_temp = 7'b1111111;
    reg [3:0] anode_temp = 4'b1110;
    reg [1:0]  count = 0;
    always @(posedge clk)
    begin 
    count = count + 1;
    end
    always @ (posedge clk)
    begin 
    case(count)
    2'b00:
    begin
    case(ones)
        4'd0 : cathode_temp = 7'b0000001;
        4'd1:cathode_temp = 7'b1001111;
        4'd2:cathode_temp = 7'b0010010;
        4'd3:cathode_temp = 7'b0000110;
        4'd4:cathode_temp = 7'b1001100;
        4'd5:cathode_temp = 7'b0100100;
        4'd6:cathode_temp = 7'b0100000;
        4'd7:cathode_temp = 7'b0001111;
        4'd8:cathode_temp = 7'b0000000;
        4'd9 :cathode_temp = 7'b0000100;
        
        
        default:cathode_temp = 7'b1111111;
    endcase
    anode_temp = 4'b1110;
    end    
    2'b01:
    begin
    case(tens)
        4'd0 : cathode_temp = 7'b0000001;
        4'd1:cathode_temp = 7'b1001111;
        4'd2:cathode_temp = 7'b0010010;
        4'd3:cathode_temp = 7'b0000110;
        4'd4:cathode_temp = 7'b1001100;
        4'd5:cathode_temp = 7'b0100100;
        4'd6:cathode_temp = 7'b0100000;
        4'd7:cathode_temp = 7'b0001111;
        4'd8:cathode_temp = 7'b0000000;
        4'd9 :cathode_temp = 7'b0000100;
        default:cathode_temp = 7'b1111111;
    endcase
    anode_temp = 4'b1101;
    end
    
    2'b10:
    begin
    case(hundreds)
        4'd0 : cathode_temp = 7'b0000001;
        4'd1:cathode_temp = 7'b1001111;
        4'd2:cathode_temp = 7'b0010010;
        4'd3:cathode_temp = 7'b0000110;
        4'd4:cathode_temp = 7'b1001100;
        4'd5:cathode_temp = 7'b0100100;
        4'd6:cathode_temp = 7'b0100000;
        4'd7:cathode_temp = 7'b0001111;
        4'd8:cathode_temp = 7'b0000000;
        4'd9 :cathode_temp = 7'b0000100;
        default:cathode_temp = 7'b1111111;
    endcase
    anode_temp = 4'b1011;
    end
    
    2'b11:
    begin
    case(thousands)
        4'd0 : cathode_temp = 7'b0000001;
        4'd1:cathode_temp = 7'b1001111;
        4'd2:cathode_temp = 7'b0010010;
        4'd3:cathode_temp = 7'b0000110;
        4'd4:cathode_temp = 7'b1001100;
        4'd5:cathode_temp = 7'b0100100;
        4'd6:cathode_temp = 7'b0100000;
        4'd7:cathode_temp = 7'b0001111;
        4'd8:cathode_temp = 7'b0000000;
        4'd9 :cathode_temp = 7'b0000100;
        default:cathode_temp = 7'b1111111;
    endcase
    anode_temp = 4'b0111;
    
    end
    endcase 
    end
    
    assign anode = anode_temp;
    assign cathode = {cathode_temp,1'b1};
    
endmodule
