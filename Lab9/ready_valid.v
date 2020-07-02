module ready_valid(
        input clk,
    input s_aresetn,
    input [3:0] inform,
    input data_valid,
    output reg [31:0] X=0,
    output reg [31:0] T=0,
    output reg [31:0] N=0,
    output wire [31:0] Q,
    output wire q_valid

    );
    
    reg data_valid_prev=0 ;
        
    always@(posedge clk) begin
    if (data_valid_prev == 0&& data_valid==1 ) begin
           
            N=N+1;
            if (inform[3]==1'b0) begin
                X=32'd1;
                T=32'd1;
                N=32'd4;
            end
            
            else if (inform[0]==1'b1) begin 
                T = T+1;
                X = X + inform[1];
            end
        end
    end
    
    
    
    always@(posedge clk) begin
        data_valid_prev <= data_valid;
    end
    
    reg valid_x = 0;
    reg valid_t = 0;
    reg valid_n = 0;
        
    wire ready_x, ready_t, ready_n;
    
    
    reg [1:0] count_valid_x = 0;
    reg [1:0] count_valid_t = 0;
    reg [1:0] count_valid_n = 0 ;
    reg [1:0] count_valid_x_reg =0;
    reg [1:0] count_valid_t_reg =0; 
    reg [1:0]count_valid_n_reg=0;
    
    
    
    always@(posedge clk) begin 
        count_valid_x_reg = count_valid_x;
        
    end
    
    always@(posedge clk) begin 
        count_valid_t_reg = count_valid_t;
        
    end
    
    always@(posedge clk) begin 
        count_valid_n_reg = count_valid_n;
        
    end
    ////////////////////////////////////////////////
    always@(*) begin
        if (ready_x == 1'b1 && valid_x== 1'b1) 
            count_valid_x = 2;
        else if (count_valid_x_reg==2)
            count_valid_x=3;
            
    
    end 
    
    always@(*) begin
        if (data_valid_prev==1'b0 && data_valid == 1'b1)
            valid_x=1;
        else if (count_valid_x_reg==2)
            valid_x=0;
    end
    /////////////////////////////////////////
    always@(*) begin
        if (ready_t == 1'b1 && valid_t== 1'b1) 
            count_valid_t = 2;
        else if (count_valid_t_reg==2)
            count_valid_t=3;
            
    
    end 
    
    always@(*) begin
        if (data_valid_prev==1'b0 && data_valid == 1'b1)
            valid_t=1;
        else if (count_valid_t_reg==2)
            valid_t=0;
    end
    ///////////////////////////////////////////
    always@(*) begin
        if (ready_n == 1'b1 && valid_n== 1'b1) 
            count_valid_n = 2;
        else if (count_valid_n_reg==2)
            count_valid_n=3;
            
    
    end 
    
    always@(*) begin
        if (data_valid_prev==1'b0 && data_valid == 1'b1)
            valid_n=1;
        else if (count_valid_n_reg==2)
            valid_n=0;
    end
    //////////////////////////////////////////////////
    
    top_module a1(
    .aclk(clk),
    .aresetn(s_aresetn),
      
    .xa_valid(valid_x),
    .xa(X),
    .xa_ready(ready_x),
    
    .ta_valid(valid_t),
    .ta(T),
    .ta_ready(ready_t),
    
    .na_valid(valid_n),
    .na(N),
    .na_ready(ready_n),
    
    
    .out_valid(q_valid),
    .out(Q)
    );
endmodule