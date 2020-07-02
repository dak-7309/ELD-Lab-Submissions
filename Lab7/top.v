`timescale 1ns / 1ps

module top(
    input clk,
    input enable,
    input srst,
    output reg f,
    output empty,
    output [3:0] anode,
    output [7:0] cathode
    );
    
    reg [3:0] addr = 4'd0;
    wire [17:0] douta;
    wire [17:0] doutb;
    wire full;
    
    wire clk_5M;
    wire clk_deb,clk1K;

    clk_wiz_0 clk_gen_5M(.clk_out1(clk_5M),.clk_in1(clk));
    clk_div #(12) u2(.clk_in(clk_5M),.clk_out(clk1K));
    clk_div #(19) u(.clk_in(clk), .clk_out(clk_deb));
    
    blk_mem_gen_0 alphabets (.clka(clk),.addra(addr),.douta(douta));
    blk_mem_gen_1 numbers(.clka(clk),.addra(addr),.douta(doutb));
    
    wire en;
    debouncer d(.clk_in(clk_deb), .rst(enable), .rst_out(en));
    
    reg wr_en = 1'b1;
    wire [15:0] dout;
    wire [3:0] data_count;
   
    always @(posedge clk_deb)
    begin
        if(data_count<5)
            f = 0;
        else if(data_count== 4'd5 || srst==1'b1)
            f = 1;
    end
    
    always @(posedge clk_deb)
    begin
        if(wr_en)
        begin
            if(addr <= 4'd4 )
                begin
                    addr = addr + 1;
                end
            if( addr >4'd4)
                wr_en = 0;
        end
        
        if(srst)
            begin
                addr = 0;
                wr_en = 1;
            end
        
    end
    
    wire [3:0] ones; 
    wire [3:0] tens; 
    wire [3:0] hundreds; 
    wire [3:0] thousands;
    
    bin2bcd btb(.number(douta+doutb), .ones(ones), .tens(tens), .hundreds(hundreds), .thousands(thousands));
    
    
    wire [15:0] sum;
    assign sum = {ones,tens,hundreds,thousands};
    
    fifo_generator_0 fifo (
        .clk(clk_deb),                
        .srst(srst),              
        .din(sum),                
        .wr_en(wr_en),            
        .rd_en(en),            
        .dout(dout),           
        .full(full),           
        .empty(empty),            
        .data_count(data_count)  
    );
    
    ssd s(.clk(clk1K), .ones(dout[15:12]), .tens(dout[11:8]), .hundreds(dout[7:4]), .thousands(dout[3:0]), .anode(anode), .cathode(cathode));
    
endmodule
