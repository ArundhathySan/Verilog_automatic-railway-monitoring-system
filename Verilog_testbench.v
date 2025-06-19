

module tb;
reg sw1;
reg clk;
 reg reset;
 wire LED1;
 wire LED2;
 railway uut(.sw1(sw1),.clk(clk),.reset(reset),.LED1(LED1),.LED2(LED2));
 always #5 clk=~clk;
initial begin
 clk=0;
 reset =1;
 sw1=0;
 
 #20;reset = 0;
#30;sw1 = 1;

        // Keep it ON for 200ns to simulate train approaching
#200;sw1 = 0;

        // Let system continue for some time


   $finish; // Stop simulation
    end


endmodule
