module star_operator(c1, c0, b1, b0, a1, a0);
output c1, c0;
input a1, a0, b1, b0;
assign c1 = (a0 & a1 & b0) | (a0 & b0 & b1) | (~a1 & b0 & b1);
assign c0 = (b0 & ~a1 & b1) | (a0 & b0);
endmodule
