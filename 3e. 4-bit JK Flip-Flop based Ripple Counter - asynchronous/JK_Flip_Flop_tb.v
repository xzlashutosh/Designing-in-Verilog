`include "JK_Flip_Flop.v"
module JK_Flip_Flop_tb;
wire Q;
reg J, K, clock, reset;
JK_Flip_Flop I0( Q, J, K, clock, reset);
always begin
    #1 clock = ~clock;
end
initial begin
    reset = 1;
 #1 reset = 0;
    clock = 0;
 #1 J = 0; K = 0;
 #1 J = 0; K = 1;
 #1 J = 1; K = 0;
 #1 J = 0; K = 0;
 #1 J = 1; K = 0;
 #1 J = 0; K = 1;
end
always begin
    #10 $finish;
end
initial begin
    $monitor("%0t reset = %b | Clock = %b | J = %b | K = %b | Q = %b|",$time, reset, clock, J, K, Q);
    $dumpfile("dump.vcd");
    $dumpvars;
end
endmodule





