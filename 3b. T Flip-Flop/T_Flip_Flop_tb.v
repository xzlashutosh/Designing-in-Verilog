`include "T_Flip_Flop.v"
module T_Flip_Flop_tb;
wire Q;
reg T, clk, reset;

T_Flip_Flop I1(Q, T, clk, reset);
always begin
   #1 clk = ~clk;
end 
initial begin
    clk = 1;
    reset = 1;
#1  reset = 0;
    T = 1;
#0.5  T = 1;
#0.5 T = 0;
#0.5 T = 1;
#2 T = 1;
#4 T = 0;
#1 T = 1;
end
always begin
    #10 $finish;
end


initial begin
    $monitor("%0t,T = %b Q = %b clk = %b reset = %b ",$time, T, Q, clk, reset);
    $dumpfile("dump.vcd");
    $dumpvars;
end

endmodule