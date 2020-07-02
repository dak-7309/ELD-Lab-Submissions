module top_module(

    input aclk,
    input aresetn,
    input xa_valid,
    input [31:0] xa,
    output xa_ready,
    input ta_valid,
    input [31:0] ta,
    output ta_ready,
    input na_valid,
    input [31:0] na,
    output na_ready,
    
//    output [31:0] out1,
    
//    input out_ready,
    output [31:0] out,
    output out_valid
    
    
//    input n_ready,
    
//    output n_valid
    );

//    wire out_valid;
    wire out_ready;

    
wire [31:0] x;   
wire x_ready,x_valid; 
floating_point_float first (
  .aclk(aclk),                                  // input wire aclk
  .aresetn(aresetn),                            // input wire aresetn
  .s_axis_a_tvalid(xa_valid),            // input wire s_axis_a_tvalid
  .s_axis_a_tready(xa_ready),            // output wire s_axis_a_tready
  .s_axis_a_tdata(xa),              // input wire [31 : 0] s_axis_a_tdata
  .m_axis_result_tvalid(x_valid),  // output wire m_axis_result_tvalid
  .m_axis_result_tready(x_ready),  // input wire m_axis_result_tready
  .m_axis_result_tdata(x)    // output wire [31 : 0] m_axis_result_tdata
);




wire [31:0] t;   
wire t_ready,t_valid; 
floating_point_float second (
  .aclk(aclk),                                  // input wire aclk
  .aresetn(aresetn),                            // input wire aresetn
  .s_axis_a_tvalid(ta_valid),            // input wire s_axis_a_tvalid
  .s_axis_a_tready(ta_ready),            // output wire s_axis_a_tready
  .s_axis_a_tdata(ta),              // input wire [31 : 0] s_axis_a_tdata
  .m_axis_result_tvalid(t_valid),  // output wire m_axis_result_tvalid
  .m_axis_result_tready(t_ready),  // input wire m_axis_result_tready
  .m_axis_result_tdata(t)    // output wire [31 : 0] m_axis_result_tdata
);



wire [31:0] n;   
wire n_ready,n_valid; 
floating_point_float fourth (
  .aclk(aclk),                                  // input wire aclk
  .aresetn(aresetn),                            // input wire aresetn
  .s_axis_a_tvalid(na_valid),            // input wire s_axis_a_tvalid
  .s_axis_a_tready(na_ready),            // output wire s_axis_a_tready
  .s_axis_a_tdata(na),              // input wire [31 : 0] s_axis_a_tdata
  .m_axis_result_tvalid(n_valid),  // output wire m_axis_result_tvalid
  .m_axis_result_tready(n_ready),  // input wire m_axis_result_tready
  .m_axis_result_tdata(n)    // output wire [31 : 0] m_axis_result_tdata
);



reg [31:0] two = 32'b01000000000000000000000000000000;
reg [31:0] three =32'b01000000010000000000000000000000;


wire [31:0] t1;
wire t1_ready,t1_valid;
assign t1 = t;


wire [31:0] x_by_t;
wire x_by_t_valid,x_by_t_ready;
floating_point_divide1 div_1st (
  .aclk(aclk),                                  // input wire aclk
  .aresetn(aresetn),                            // input wire aresetn
  .s_axis_a_tvalid(x_valid),            // input wire s_axis_a_tvalid
  .s_axis_a_tready(x_ready),            // output wire s_axis_a_tready
  .s_axis_a_tdata(x),              // input wire [31 : 0] s_axis_a_tdata
  .s_axis_b_tvalid(t_valid),            // input wire s_axis_b_tvalid
  .s_axis_b_tready(t_ready),            // output wire s_axis_b_tready
  .s_axis_b_tdata(t1),              // input wire [31 : 0] s_axis_b_tdata
  .m_axis_result_tvalid(x_by_t_valid),  // output wire m_axis_result_tvalid
  .m_axis_result_tready(x_by_t_ready),  // input wire m_axis_result_tready
  .m_axis_result_tdata(x_by_t)    // output wire [31 : 0] m_axis_result_tdata
);
//wire [31:0] out1;
////wire out1_valid,out1_ready;
//assign out1 = x_by_t;
//assign out1_valid = x_by_t_valid;
//assign out1_ready = x_by_t_ready;


wire m1_valid;
wire m1_ready;
wire [31:0] m1;

assign m1 = x_by_t;




wire mt_valid;
wire mt_ready;
wire [31:0] mt;

assign mt = x_by_t;


wire m_c_valid;
wire m_c_ready;
wire [31:0] m_c;

assign m_c = x_by_t;



wire m_3_valid;
wire m_3_ready;
wire [31:0] m_3;
assign m_3   = x_by_t;



wire [31:0] m2;
wire m2_ready,m2_valid;


floating_point_mul mul1 (
  .aclk(aclk),                                  // input wire aclk
  .aresetn(aresetn),                            // input wire aresetn
  .s_axis_a_tvalid(x_by_t_valid),            // input wire s_axis_a_tvalid
  .s_axis_a_tready(mt_ready),            // output wire s_axis_a_tready
  .s_axis_a_tdata(mt),              // input wire [31 : 0] s_axis_a_tdata
  .s_axis_b_tvalid(x_by_t_valid),            // input wire s_axis_b_tvalid
  .s_axis_b_tready(x_by_t_ready),            // output wire s_axis_b_tready
  .s_axis_b_tdata(m1),              // input wire [31 : 0] s_axis_b_tdata
  .m_axis_result_tvalid(m2_valid),  // output wire m_axis_result_tvalid
  .m_axis_result_tready(m2_ready),  // input wire m_axis_result_tready
  .m_axis_result_tdata(m2)    // output wire [31 : 0] m_axis_result_tdata
);

wire [31:0] sub;
wire sub_ready,sub_valid;
floating_point_sub subing (
  .aclk(aclk),                                  // input wire aclk
  .aresetn(aresetn),                            // input wire aresetn
  .s_axis_a_tvalid(x_by_t_valid),            // input wire s_axis_a_tvalid
  .s_axis_a_tready(m_c_ready),            // output wire s_axis_a_tready
  .s_axis_a_tdata(m_c),              // input wire [31 : 0] s_axis_a_tdata
  .s_axis_b_tvalid(m2_valid),            // input wire s_axis_b_tvalid
  .s_axis_b_tready(m2_ready),            // output wire s_axis_b_tready
  .s_axis_b_tdata(m2),              // input wire [31 : 0] s_axis_b_tdata
  .m_axis_result_tvalid(sub_valid),  // output wire m_axis_result_tvalid
  .m_axis_result_tready(sub_ready),  // input wire m_axis_result_tready
  .m_axis_result_tdata(sub)    // output wire [31 : 0] m_axis_result_tdata
);


wire [31:0] logn;
wire logn_ready,logn_valid;
floating_point_log log (
  .aclk(aclk),                                  // input wire aclk
  .aresetn(aresetn),                            // input wire aresetn
  .s_axis_a_tvalid(n_valid),            // input wire s_axis_a_tvalid
  .s_axis_a_tready(n_ready),            // output wire s_axis_a_tready
  .s_axis_a_tdata(n),              // input wire [31 : 0] s_axis_a_tdata
  .m_axis_result_tvalid(logn_valid),  // output wire m_axis_result_tvalid
  .m_axis_result_tready(logn_ready),  // input wire m_axis_result_tready
  .m_axis_result_tdata(logn)    // output wire [31 : 0] m_axis_result_tdata
);


wire [31:0] logn_t;
wire logn_t_ready,logn_t_valid;
floating_point_divide1 div_2nd (
  .aclk(aclk),                                  // input wire aclk
  .aresetn(aresetn),                            // input wire aresetn
  .s_axis_a_tvalid(logn_valid),            // input wire s_axis_a_tvalid
  .s_axis_a_tready(logn_ready),            // output wire s_axis_a_tready
  .s_axis_a_tdata(logn),              // input wire [31 : 0] s_axis_a_tdata
  .s_axis_b_tvalid(t_valid),            // input wire s_axis_b_tvalid
  .s_axis_b_tready(t1_ready),            // output wire s_axis_b_tready
  .s_axis_b_tdata(t),              // input wire [31 : 0] s_axis_b_tdata
  .m_axis_result_tvalid(logn_t_valid),  // output wire m_axis_result_tvalid
  .m_axis_result_tready(logn_t_ready),  // input wire m_axis_result_tready
  .m_axis_result_tdata(logn_t)    // output wire [31 : 0] m_axis_result_tdata
);


wire logn_t1_valid;
assign logn_t1_valid = logn_t_valid;
wire logn_t1_ready;
wire [31:0] logn_t1;
assign logn_t1   = logn_t;


wire [31:0] two1;
assign two1 = two;
wire [31:0] three1;
assign three1 = three;



wire [31:0] twologn_t;
wire twologn_t_valid,twologn_t_ready;
wire logging;



floating_point_mul mul2 (
  .aclk(aclk),                                  // input wire aclk
  .aresetn(aresetn),                            // input wire aresetn
  .s_axis_a_tvalid(logn_t1_valid),            // input wire s_axis_a_tvalid
  .s_axis_a_tready(logn_t1_ready),            // output wire s_axis_a_tready
  .s_axis_a_tdata(logn_t1),              // input wire [31 : 0] s_axis_a_tdata
  .s_axis_b_tvalid(logn_t1_valid),            // input wire s_axis_b_tvalid
  .s_axis_b_tready(logging),            // output wire s_axis_b_tready
  .s_axis_b_tdata(two1),              // input wire [31 : 0] s_axis_b_tdata
  .m_axis_result_tvalid(twologn_t_valid),  // output wire m_axis_result_tvalid
  .m_axis_result_tready(twologn_t_ready),  // input wire m_axis_result_tready
  .m_axis_result_tdata(twologn_t)    // output wire [31 : 0] m_axis_result_tdata
);



//assign out1=logn_t1;
wire logn_t2_valid;
assign logn_t2_valid = logn_t_valid;
wire logn_t2_ready;
wire [31:0] logn_t2;
assign logn_t2   = logn_t;
wire [31:0] threelogn_t;
wire threelogn_t_valid,threelogn_t_ready;

wire logging1;

floating_point_mul mul3 (
  .aclk(aclk),                                  // input wire aclk
  .aresetn(aresetn),                            // input wire aresetn
  .s_axis_a_tvalid(logn_t2_valid),            // input wire s_axis_a_tvalid
  .s_axis_a_tready(logn_t2_ready),            // output wire s_axis_a_tready
  .s_axis_a_tdata(logn_t2),              // input wire [31 : 0] s_axis_a_tdata
  .s_axis_b_tvalid(logn_t2_valid),            // input wire s_axis_b_tvalid
  .s_axis_b_tready(logging1),            // output wire s_axis_b_tready
  .s_axis_b_tdata(three1),              // input wire [31 : 0] s_axis_b_tdata
  .m_axis_result_tvalid(threelogn_t_valid),  // output wire m_axis_result_tvalid
  .m_axis_result_tready(threelogn_t_ready),  // input wire m_axis_result_tready
  .m_axis_result_tdata(threelogn_t)    // output wire [31 : 0] m_axis_result_tdata
);




wire [31:0] t2;
wire t2_ready,t2_valid;
assign t2 = t;
assign t2_valid=t_valid;





wire [31:0] twologn_tv;
wire twologn_tv_valid,twologn_tv_ready;
floating_point_mul mul4 (
  .aclk(aclk),                                  // input wire aclk
  .aresetn(aresetn),                            // input wire aresetn
  .s_axis_a_tvalid(twologn_t_valid),            // input wire s_axis_a_tvalid
  .s_axis_a_tready(twologn_t_ready),            // output wire s_axis_a_tready
  .s_axis_a_tdata(twologn_t),              // input wire [31 : 0] s_axis_a_tdata
  .s_axis_b_tvalid(sub_valid),            // input wire s_axis_b_tvalid
  .s_axis_b_tready(sub_ready),            // output wire s_axis_b_tready
  .s_axis_b_tdata(sub),              // input wire [31 : 0] s_axis_b_tdata
  .m_axis_result_tvalid(twologn_tv_valid),  // output wire m_axis_result_tvalid
  .m_axis_result_tready(twologn_tv_ready),  // input wire m_axis_result_tready
  .m_axis_result_tdata(twologn_tv)    // output wire [31 : 0] m_axis_result_tdata
);


wire [31:0] sqrt;
wire sqrt_ready,sqrt_valid;
floating_point_sqrt2 sqrt2 (
  .aclk(aclk),                                  // input wire aclk
  .aresetn(aresetn),                            // input wire aresetn
  .s_axis_a_tvalid(twologn_tv_valid),            // input wire s_axis_a_tvalid
  .s_axis_a_tready(twologn_tv_ready),            // output wire s_axis_a_tready
  .s_axis_a_tdata(twologn_tv),              // input wire [31 : 0] s_axis_a_tdata
  .m_axis_result_tvalid(sqrt_valid),  // output wire m_axis_result_tvalid
  .m_axis_result_tready(sqrt_ready),  // input wire m_axis_result_tready
  .m_axis_result_tdata(sqrt)    // output wire [31 : 0] m_axis_result_tdata
);





wire [31:0] r1;
wire r1_valid,r1_ready;
wire temp;
floating_point_1 add (
  .aclk(aclk),                                  // input wire aclk
  .aresetn(aresetn),                            // input wire aresetn
  .s_axis_a_tvalid(sqrt_valid),            // input wire s_axis_a_tvalid
  .s_axis_a_tready(sqrt_ready),            // output wire s_axis_a_tready
  .s_axis_a_tdata(sqrt),              // input wire [31 : 0] s_axis_a_tdata
  .s_axis_b_tvalid(x_by_t_valid),            // input wire s_axis_b_tvalid
  .s_axis_b_tready(temp),            // output wire s_axis_b_tready
  .s_axis_b_tdata(x_by_t),              // input wire [31 : 0] s_axis_b_tdata
  .m_axis_result_tvalid(r1_valid),  // output wire m_axis_result_tvalid
  .m_axis_result_tready(r1_ready),  // input wire m_axis_result_tready
  .m_axis_result_tdata(r1)    // output wire [31 : 0] m_axis_result_tdata
);






wire [31:0] r2;
wire r2_valid,r2_ready;
floating_point_1 add11 (
  .aclk(aclk),                                  // input wire aclk
  .aresetn(aresetn),                            // input wire aresetn
  .s_axis_a_tvalid(r1_valid),            // input wire s_axis_a_tvalid
  .s_axis_a_tready(r1_ready),            // output wire s_axis_a_tready
  .s_axis_a_tdata(r1),              // input wire [31 : 0] s_axis_a_tdata
  .s_axis_b_tvalid(threelogn_t_valid),            // input wire s_axis_b_tvalid
  .s_axis_b_tready(threelogn_t_ready),            // output wire s_axis_b_tready
  .s_axis_b_tdata(threelogn_t),              // input wire [31 : 0] s_axis_b_tdata
  .m_axis_result_tvalid(out_valid),  // output wire m_axis_result_tvalid
  .m_axis_result_tready(1'b1),  // input wire m_axis_result_tready
  .m_axis_result_tdata(out)    // output wire [31 : 0] m_axis_result_tdata
);


endmodule