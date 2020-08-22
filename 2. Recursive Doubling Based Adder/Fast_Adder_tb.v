`include "Fast_Adder.v"
module Fast_Adder_tb;
wire [8 :0] Sum;
reg [8 :0] a, b;
Fast_Adder I1(Sum, a, b);
initial begin
    a = 8'b01010101; b = 8'b00110011;
 #1 a = 8'b11111111; b = 8'b11111111;
 #1 a = 8'd138      ; b = 8'd0;
 
end

initial begin
    $monitor("A = %d; B = %d; Sum = %d", a, b, Sum);
end


endmodule
