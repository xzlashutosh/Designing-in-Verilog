module rca(sum, c_out , a, b, c_in);
parameter w = 16;
output [w-1:0] sum;
output c_out;
input [w-1:0] a;
input [w-1:0] b;
input c_in;

wire [w-1:0] c_mid_connect_wire;
assign c_in = 0;
assign c_out = c_mid_connect_wire[w-1];
FA fa0(sum[0],c_mid_connect_wire[0], a[0], b[0], c_in);

genvar i;
generate
for (i = 1; i <= w-1; i = i + 1)
begin : ripple
    FA fa(sum[i], c_mid_connect_wire[i], a[i], b[i], c_mid_connect_wire[i-1]);
end
endgenerate
endmodule
// full adder
module FA (output s, cout, input a, b, cin);
assign s = a^b^cin;
assign cout = a&b|b&cin|cin&a;
endmodule
