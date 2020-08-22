module kpg(sum, a, b, y);
output sum;
input a, b, y;
wire [1:0] x;
assign x[1] = a&b;
assign x[0] = a|b;
assign sum = a^b^y;

endmodule



