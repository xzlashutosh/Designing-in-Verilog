`include "rca.v"
module tb;
 parameter w = 16;
wire [w-1:0] sum;
wire c_out;
reg [w-1:0] a;
reg  [w-1:0] b;
reg c_in;

rca i0 (sum, c_out , a, b, c_in);

initial begin
    c_in = 0;
    a = 16'b101; b = 16'b010;
 #1 a = 16'b111; b = 16'b111;
 #1 a = 16'b101; b = 16'b101;   
end
initial begin
    $monitor ($time , "a = %b, b = %b, c_out = %b, sum = %b , c_in = %b", a, b, c_out, sum, c_in);
end
endmodule


