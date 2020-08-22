`include "Parallel_Prefix_Circuit.v"
module Parallel_Prefix_Circuit_tb;
wire [17:0] Y ;
reg [17:0] X ;
Parallel_Prefix_Circuit PPC (Y, X);

initial begin
    X = 18'b111100110111010100;
 #1 X = 18'b111101010101111100;
 #2 X = 18'b110000110101110111;
end

initial begin
    $monitor("x = %b, y = %b", X, Y);
end

endmodule
