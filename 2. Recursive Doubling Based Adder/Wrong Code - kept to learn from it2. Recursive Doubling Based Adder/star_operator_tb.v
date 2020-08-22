`include "star_operator.v"
module star_operator_tb;
wire c1, c0;
reg  a1, a0, b1, b0;
star_operator I1 (c1, c0, a1, a0, b1, b0);
initial begin
    b1 = 0; b0 = 0; a1 = 0; a0 = 0;
#1  b1 = 0; b0 = 0; a1 = 0; a0 = 1;
#1  b1 = 0; b0 = 0; a1 = 1; a0 = 1;
#1  b1 = 0; b0 = 1; a1 = 0; a0 = 0;
#1  b1 = 0; b0 = 1; a1 = 0; a0 = 1;
#1  b1 = 0; b0 = 1; a1 = 1; a0 = 1;
#1  b1 = 1; b0 = 1; a1 = 0; a0 = 0;
#1  b1 = 1; b0 = 1; a1 = 0; a0 = 1;
#1  b1 = 1; b0 = 1; a1 = 1; a0 = 1;
end
initial begin
    $monitor("%0t, b[1] = %b, b[0] = %b, a[1] = %b, a[0] = %b, c[1] = %b, c[0] = %b", $time, b1, b0, a1, a0, c1, c0);
end
endmodule