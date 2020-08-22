`include "Ripple_Counter.v"
module Ripple_Counter_tb;
wire [3:0] Q;         // Q[0],.......
reg  T, CLK, RESET; 
Ripple_Counter I0(Q, T, CLK,  RESET);
initial begin
     RESET = 1;
     CLK = 1;
     T = 1;
    #1 RESET = 0;
   
end
always begin
   #1 CLK = ~CLK;
end
always begin
    #20 $finish;
end
initial begin
    $monitor("%0t Q3 = %b,Q2 = %b, Q1 = %b, Q0 = %b", $time , Q[3], Q[2], Q[1], Q[0]);
end
endmodule
