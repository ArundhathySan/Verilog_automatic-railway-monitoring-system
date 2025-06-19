module design1_s_wrapper
   (LED1,
    LED2,
    clk_in1_0,
    reset,
    sw1);
  output LED1;
  output LED2;
  input clk_in1_0;
  input reset;
  input sw1;

  wire LED1;
  wire LED2;
  wire clk_in1_0;
  wire reset;
  wire sw1;

  design1_s design1_s_i
       (.LED1(LED1),
        .LED2(LED2),
        .clk_in1_0(clk_in1_0),
        .reset(reset),
        .sw1(sw1));
endmodule
