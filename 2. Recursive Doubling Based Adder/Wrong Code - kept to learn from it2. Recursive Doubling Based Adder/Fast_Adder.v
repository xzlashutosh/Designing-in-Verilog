`include "Parallel_Prefix_Circuit.v"
module Fast_Adder(sum, A, B);

output [8:0] sum;
input [8:0] A, B;

wire [17:0] X;
wire [17:0] Y;
wire [8:0] Y0;
assign X[1] = 0; assign X[0] = 0;
assign X[3] = A[0] & B[0]; assign X[2] = A[0] | B[0]; //x0
assign X[5] = A[1] & B[1]; assign X[4] = A[1] | B[1];// x1
assign X[7] = A[2] & B[2]; assign X[6] = A[2] | B[2];// x2
assign X[9] = A[3] & B[3]; assign X[8] = A[3] | B[3];//x3
assign X[11] = A[4] & B[4]; assign X[10] = A[4] | B[4];//x4
assign X[13] = A[5] & B[5]; assign X[12] = A[5] | B[5];//x5
assign X[15] = A[6] & B[6]; assign X[14] = A[6] | B[6];//x6
assign X[17] = A[7] & B[7]; assign X[16] = A[7] | B[7];//x7
Parallel_Prefix_Circuit PPC(Y, X);
assign Y0 ={Y[17] & Y[16], Y[15] & Y[14], Y[13] & Y[12], Y[11] & Y[10], Y[9] & Y[8], Y[7] & Y[6], Y[5] & Y[4], Y[3] & Y[2], Y[1] & Y[0]};
assign sum = A^B^Y0;
endmodule
