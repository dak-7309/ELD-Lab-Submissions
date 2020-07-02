module tester(

    );
    reg clk = 0;
    reg s_aresetn = 0;
    reg [3:0] inform = 0;
    reg data_valid = 0;
    
    wire [31:0] Q,X,T,N;
    wire q_valid;
    
    
    always #2 clk = !clk ;
    
    ready_valid u1(
        .clk(clk),
        .s_aresetn( s_aresetn),
        .inform(inform),
        .data_valid(data_valid),
//        .out_valid(data_valid),
        .X(X),
        .T(T),
        .N(N),
        .Q(Q),
        .q_valid(q_valid)
    );
    initial
    begin
        
        
        #100 s_aresetn <= 1;
        #10 inform <= 4'd0;
            data_valid <= 1;
        #4 data_valid <= 0;
    end             
endmodule