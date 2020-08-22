`include "Fast_Adder.v"
module Fast_Adder_tb;
wire [8 :0] Sum;
reg [8 :0] a, b;
Fast_Adder I1(Sum, a, b);
initial begin
    a = 8'b01010101; b = 8'b00110011;
end

initial begin
    $monitor("A = %b; B = %b; Sum = %b", a, b, Sum);
end


endmodule
