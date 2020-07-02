`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.10.2019 14:10:48
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


module top
#(
    parameter integer C_S_AXIS_X_TDATA_WIDTH = 32,
    parameter integer C_S_AXIS_T_TDATA_WIDTH = 32,
    parameter integer C_S_AXIS_N_TDATA_WIDTH = 32
)
(
    input s_aclk,
    input s_aresetn,
    input [C_S_AXIS_X_TDATA_WIDTH-1:0] s_x_tdata,
    input s_x_tvalid,
    input [C_S_AXIS_X_TDATA_WIDTH-1:0] s_alpha_tdata,
    input s_alpha_tvalid,
    input [C_S_AXIS_T_TDATA_WIDTH-1:0] s_t_tdata,
    input s_t_tvalid,
    input [C_S_AXIS_N_TDATA_WIDTH-1:0] s_n_tdata,
    input s_n_tvalid,
    output s_x_tready,
    output s_t_tready,
    output s_n_tready,
    output s_alpha_tready,
    output final_q_valid,
    output [31:0] final_q
);


    //1
    wire float_x_valid, float_x_ready;
    wire [31:0] float_x;
    floating_point_0 fx(
        .aclk(s_aclk),
        .aresetn(s_aresetn),
        .s_axis_a_tvalid(s_x_tvalid),
        .s_axis_a_tready(s_x_tready),
        .s_axis_a_tdata(s_x_tdata),
        .m_axis_result_tvalid(float_x_valid),
        .m_axis_result_tready(float_x_ready),
        .m_axis_result_tdata(float_x)
    );
   
   //2
    wire float_t_valid, float_t_ready;
    wire [31:0] float_t;
    floating_point_0 ft(
        .aclk(s_aclk),
        .aresetn(s_aresetn),
        .s_axis_a_tvalid(s_t_tvalid),
        .s_axis_a_tready(s_t_tready),
        .s_axis_a_tdata(s_t_tdata),
        .m_axis_result_tvalid(float_t_valid),
        .m_axis_result_tready(float_t_ready),
        .m_axis_result_tdata(float_t)
    );
   
   //3
    wire float_n_valid, float_n_ready;
    wire [31:0] float_n;
    floating_point_0 fn(
        .aclk(s_aclk),
        .aresetn(s_aresetn),
        .s_axis_a_tvalid(s_n_tvalid),
        .s_axis_a_tready(s_n_tready),
        .s_axis_a_tdata(s_n_tdata),
        .m_axis_result_tvalid(float_n_valid),
        .m_axis_result_tready(float_n_ready),
        .m_axis_result_tdata(float_n)
    );
    
    //4
    wire float_alpha_valid, float_alpha_ready;
    wire [31:0] float_alpha;
    floating_point_0 falpha(
        .aclk(s_aclk),
        .aresetn(s_aresetn),
        .s_axis_a_tvalid(s_alpha_tvalid),
        .s_axis_a_tready(s_alpha_tready),
        .s_axis_a_tdata(s_alpha_tdata),
        .m_axis_result_tvalid(float_alpha_valid),
        .m_axis_result_tready(float_alpha_ready),
        .m_axis_result_tdata(float_alpha)
    );
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    //5
    wire div1_valid,div1_ready;
    wire [31:0] div1_data;
    divide x_by_t(
      .aclk(s_aclk),
      .aresetn(s_aresetn),                           
      .s_axis_a_tvalid(float_x_valid),            
      .s_axis_a_tready(float_x_ready),            
      .s_axis_a_tdata(float_x),
                    
      .s_axis_b_tvalid(float_t_valid),            
      .s_axis_b_tready(float_t_ready),            
      .s_axis_b_tdata(float_t),
                    
      .m_axis_result_tvalid(div1_valid),  
      .m_axis_result_tready(div1_ready),  
      .m_axis_result_tdata(div1_data)
    );
    
    
    
   
    
   
    
    
    //8
    wire log1_valid, log1_ready;
    wire [31:0] log1_data;
    logarithm log_n(
        .aclk(s_aclk),
        .aresetn(s_aresetn),                                 
        
        .s_axis_a_tvalid(float_n_valid),          
        .s_axis_a_tready(float_n_ready),          
        .s_axis_a_tdata(float_n),            
        
        .m_axis_result_tvalid(log1_valid),
        .m_axis_result_tready(log1_ready),
        .m_axis_result_tdata(log1_data)   
        
    );
    
    
     //14
    wire mul3_valid, mul3_ready;
    wire [31:0] mul3_data;
    multiply alpha_into_lnn(
        .aclk(s_aclk),      
        .aresetn(s_aresetn), 
                                 
        .s_axis_a_tvalid(float_alpha_valid),          
        .s_axis_a_tready(float_alpha_ready),          
        .s_axis_a_tdata(float_alpha),            
        .s_axis_b_tvalid(log1_valid),          
        .s_axis_b_tready(log1_ready),          
        .s_axis_b_tdata(log1_data),            
        
        .m_axis_result_tvalid(mul3_valid),
        .m_axis_result_tready(mul3_ready),
        .m_axis_result_tdata(mul3_data)   
    );
    
   //7
    wire div3_valid,div3_ready;
    wire [31:0] div3_data;
    divide two_lnn_by_t(
      .aclk(s_aclk),
      .aresetn(s_aresetn),                           
      .s_axis_a_tvalid(mul3_valid),            
      .s_axis_a_tready(mul3_ready),            
      .s_axis_a_tdata(mul3_data),
                    
      .s_axis_b_tvalid(float_t_valid),            
//      .s_axis_b_tready(float_t_ready),            
      .s_axis_b_tdata(float_t),
                    
      .m_axis_result_tvalid(div3_valid),  
      .m_axis_result_tready(div3_ready),  
      .m_axis_result_tdata(div3_data)
    );
    
    
    //12
    wire mul1_valid, mul1_ready;
    wire [31:0] mul1_data;
    multiply m_into_m(
        .aclk(s_aclk),      
        .aresetn(s_aresetn), 
                                 
        .s_axis_a_tvalid(div1_valid),          
        .s_axis_a_tready(div1_ready),          
        .s_axis_a_tdata(div1_data),
                    
        .s_axis_b_tvalid(div1_valid),          
//        .s_axis_b_tready(div1_ready),          
        .s_axis_b_tdata(div1_data),            
        
        .m_axis_result_tvalid(mul1_valid),
        .m_axis_result_tready(mul1_ready),
        .m_axis_result_tdata(mul1_data)   
    );
    

    
    
    
    
    
     //9
    wire sub1_valid,sub1_ready;
    wire [31:0] sub1_data;
    subtract m_minus_msquare(
          .aclk(s_aclk),
          .aresetn(s_aresetn),                          
          
          .s_axis_a_tvalid(div1_valid),          
//          .s_axis_a_tready(div1_ready),          
          .s_axis_a_tdata(div1_data), 
                     
          .s_axis_b_tvalid(mul1_valid),          
          .s_axis_b_tready(mul1_ready),          
          .s_axis_b_tdata(mul1_data),            
          
          .m_axis_result_tvalid(sub1_valid),
          .m_axis_result_tready(sub1_ready),
          .m_axis_result_tdata(sub1_data)   
    
    );
    
     //16
    wire sr2_valid, sr2_ready;
    wire [31:0] sr2_data;
    sqr_root two_ln_n_by_t(
        .aclk(s_aclk),      
        .aresetn(s_aresetn), 
                                  
        .s_axis_a_tvalid(div3_valid),          
        .s_axis_a_tready(div3_ready),          
        .s_axis_a_tdata(div3_data),            
        
        .m_axis_result_tvalid(sr2_valid),
        .m_axis_result_tready(sr2_ready),
        .m_axis_result_tdata(sr2_data)   
    );
    
    
    
    
    //11
    wire add2_valid, add2_ready;
    wire [31:0] add2_data;
    add minus_msquare_plus_blah(
        .aclk(s_aclk),      
        .aresetn(s_aresetn),                           
        
        .s_axis_a_tvalid(sub1_valid),           
        .s_axis_a_tready(sub1_ready),           
        .s_axis_a_tdata(sub1_data),
                     
        .s_axis_b_tvalid(sr2_valid),           
        .s_axis_b_tready(sr2_ready),           
        .s_axis_b_tdata(sr2_data),   
                  
        .m_axis_result_tvalid(add2_valid), 
        .m_axis_result_tready(add2_ready), 
        .m_axis_result_tdata(add2_data)    
    );
    
   
    

    //13
    wire mul2_valid, mul2_ready;
    wire [31:0] mul2_data;
    multiply blah_into_t(
        .aclk(s_aclk),      
        .aresetn(s_aresetn), 
                                 
        .s_axis_a_tvalid(add2_valid),          
        .s_axis_a_tready(add2_ready),          
        .s_axis_a_tdata(add2_data),            
        .s_axis_b_tvalid(float_t_valid),          
//        .s_axis_b_tready(float_t_ready),          
        .s_axis_b_tdata(float_t),            
        
        .m_axis_result_tvalid(mul2_valid),
        .m_axis_result_tready(mul2_ready),
        .m_axis_result_tdata(mul2_data)   
    );
    
  
    
     //6
    wire div2_valid,div2_ready;
    wire [31:0] div2_data;
    divide lnn_by_blah(
      .aclk(s_aclk),
      .aresetn(s_aresetn),                           
      .s_axis_a_tvalid(log1_valid),            
//      .s_axis_a_tready(log1_ready),            
      .s_axis_a_tdata(log1_data),
                    
      .s_axis_b_tvalid(mul2_valid),            
      .s_axis_b_tready(mul2_ready),            
      .s_axis_b_tdata(mul2_data),
                    
      .m_axis_result_tvalid(div2_valid),  
      .m_axis_result_tready(div2_ready),  
      .m_axis_result_tdata(div2_data)
    );
    
    //15
    wire sr1_valid, sr1_ready;
    wire [31:0] sr1_data;
    sqr_root blah(
        .aclk(s_aclk),      
        .aresetn(s_aresetn), 
                                  
        .s_axis_a_tvalid(div2_valid),          
        .s_axis_a_tready(div2_ready),          
        .s_axis_a_tdata(div2_data),            
        
        .m_axis_result_tvalid(sr1_valid),
        .m_axis_result_tready(sr1_ready),
        .m_axis_result_tdata(sr1_data)   
        
    );
    
    
    //10
   
    add m_plus_blah(
        .aclk(s_aclk),      
        .aresetn(s_aresetn),                           
        
        .s_axis_a_tvalid(div1_valid),           
//        .s_axis_a_tready(div1_ready),           
        .s_axis_a_tdata(div1_data),
                     
        .s_axis_b_tvalid(sr1_valid),           
        .s_axis_b_tready(sr1_ready),           
        .s_axis_b_tdata(sr1_data),   
                  
        .m_axis_result_tvalid(final_q_valid), 
        .m_axis_result_tready(1), 
        .m_axis_result_tdata(final_q)    
    );
    
   

endmodule
