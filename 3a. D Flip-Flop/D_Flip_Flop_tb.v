`include "D_Flip_Flop.v"
module D_Flip_Flop_tb;

wire Q;
reg D, clk, reset;
D_Flip_Flop I1(Q, reset, clk, D);

always begin        
    #1 clk = ~clk;
end
initial begin
    reset = 1;
    clk = 1;

#1  reset = 0;
    D = 0;
#1  reset = 0;
    D = 1;
#1  reset = 0;
    D = 0;
#1  reset = 0;
    D = 1;  
#1  reset = 0;
    D = 0;
#1  
    D = 0;
    #1 
    D = 0;
    #1  reset = 0;
    D = 0;
end


always begin
    #10 $finish;
end

initial begin
    $monitor("%0t,D = %b Q = %b clk = %b reset = %b ",$time, D, Q, clk, reset);
    $dumpfile("dump.vcd");
    $dumpvars;
end

endmodule