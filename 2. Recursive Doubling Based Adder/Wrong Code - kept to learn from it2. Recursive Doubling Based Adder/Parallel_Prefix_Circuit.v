`include "star_operator.v"
module Parallel_Prefix_Circuit(Y, X);
input [17:0] X ;
output [17:0] Y ;
wire [17:0] A, B;
//A Lane
assign A[1] = X[1],A[0] = X[0];
star_operator A01_00(A[3], A[2], X[3], X[2], X[1], X[0]);
star_operator A02_01(A[5], A[4], X[5], X[4], X[3], X[2]);
star_operator A03_02(A[7], A[6], X[7], X[6], X[5], X[4]);
star_operator A04_03(A[9], A[8], X[9], X[8], X[7], X[6]);
star_operator A05_04(A[11], A[10], X[11], X[10], X[9], X[8]);
star_operator A06_05(A[13], A[12], X[13], X[12], X[11], X[10]);
star_operator A07_06(A[15], A[14], X[15], X[14], X[13], X[12]);
star_operator A08_07(A[17], A[16], X[17], X[16], X[15], X[14]);

//B lane
assign B[1] = A[1], B[0] = A[0];
assign B[3] = A[3], B[2] = A[2];
star_operator B02_00(B[5], B[4], A[5], A[4], A[1], A[0]);
star_operator B03_01(B[7], B[6], A[7], A[6], A[3], A[2]);
star_operator B04_02(B[9], B[8], A[9], A[8], A[5], A[4]);
star_operator B05_03(B[11], B[10], A[11], A[10], A[7], A[6]);
star_operator B06_04(B[13], B[12], A[13], A[12], A[9], A[8]);
star_operator B07_05(B[15], B[14], A[15], A[14], A[11], A[10]);
star_operator B08_06(B[17], B[16], A[17], A[16], A[13], A[12]);

//Y Output Lane
assign Y[1] = B[1], Y[0] = B[0];
assign Y[3] = B[3], Y[2] = B[2];
assign Y[5] = B[5], Y[4] = B[4];
assign Y[7] = B[7], Y[6] = B[6];
star_operator Y04_00(Y[9], Y[8], B[9], B[8], B[1], B[0]);
star_operator Y05_01(Y[11], Y[10], B[11], B[10], B[3], B[2]);
star_operator Y06_02(Y[13], Y[12], B[13], B[12], B[5], B[4]);
star_operator Y07_03(Y[15], Y[14], B[15], B[14], B[7], B[6]);
star_operator Y08_04(Y[17], Y[16], B[17], B[16], B[9], B[8]);
endmodule
