
module railway(
input sw1,clk,reset,
output reg LED1,LED2);

reg [3:0] count1,count2;

  //mod_16counter uux1(.clk(clk),.reset(reset),.count(count1));
  //mod_16counter uux2(.clk(clk),.reset(reset),.count(count2));
  parameter Default=2'b00;
  parameter Alert=2'b01;
  parameter Close=2'b10;
  reg[1:0] current_state,next_state;
  

 
  always@(*)begin
  case(current_state)
  Default:begin
  if(sw1)
  next_state= Alert;
  else
  next_state=Default;
  end
 Alert:begin
 if (count1>=4'b1010)
 next_state=Close;
 else
 next_state=Alert;
 end
 Close:begin
 if (count2>=4'b0100)
 
 if (sw1!==1)
 
 next_state= Default;
 
 else 
 next_state=Alert;

 else 
 next_state= Close;

 end
 endcase
 end
 always @(posedge clk or posedge reset )begin
 if(reset)
  current_state <= Default;
    else
        current_state <= next_state;
        end
 always @(posedge clk or posedge reset) begin
    if (reset)begin
        count1 <= 0;
        count2<=0;
        end
        
    else if (current_state == Alert)
        count1 <= count1 + 1;
    else if (current_state == Close)
        count2 <= count2 + 1;
    else 
        count1 <= 0; 
        count2<=0; // Reset counter when going back to Idle
end
 

always@(*) begin
case(current_state)
Default:begin
LED1=0;
LED2=0;
end

Alert:begin
LED1=1;
LED2=0;
end
Close:begin
LED1=0;
LED2=1;
end
endcase
end
endmodule
 
  
