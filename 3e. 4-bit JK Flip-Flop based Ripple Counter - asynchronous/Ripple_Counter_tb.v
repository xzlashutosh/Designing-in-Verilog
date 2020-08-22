`include "Ripple_Counter.v"
module Ripple_Counter_tb;
wire [3:0] Q;
reg J, K, clock;
Ripple_Counter I0 (Q, J, K, clock);
always begin
#1  clock = ~clock;
end
initial begin
    
    clock = 0;
    J = 0; K = 1;
   #2 J = 1; K =1;
end
always begin
    #10 $finish;
end
initial begin
        $monitor("%t| clock = %b | Q3Q2Q1Q0 = %b%b%b%b|",$time, clock, Q[3], Q[2], Q[1], Q[0]);
    $dumpfile("dump.vcd");
    $dumpvars;

end
endmodule