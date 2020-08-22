//half adder module
module hfa(output sum, carry,input a,b);
assign sum = a^b;
assign carry = a&b;
endmodule
// full adder module
module fla(output sum, carry, input a, b, c);
assign sum = a^b^c;
assign carry = a&b|b&c|c&a;
endmodule
// wallace tree multiplier
module wtm_8 (output [15:0] pr, input [7:0] a, b);
wire [7:0]p[7:0];
wire [64:0] s, c;
// stage 1 - partial products
assign p[0][0] = b[0] & a[0];
assign p[0][1] = b[0] & a[1];
assign p[0][2] = b[0] & a[2];
assign p[0][3] = b[0] & a[3];
assign p[0][4] = b[0] & a[4];
assign p[0][5] = b[0] & a[5];
assign p[0][6] = b[0] & a[6];
assign p[0][7] = b[0] & a[7];

assign p[1][0] = b[1] & a[0];
assign p[1][1] = b[1] & a[1];
assign p[1][2] = b[1] & a[2];
assign p[1][3] = b[1] & a[3];
assign p[1][4] = b[1] & a[4];
assign p[1][5] = b[1] & a[5];
assign p[1][6] = b[1] & a[6];
assign p[1][7] = b[1] & a[7];

assign p[2][0] = b[2] & a[0];
assign p[2][1] = b[2] & a[1];
assign p[2][2] = b[2] & a[2];
assign p[2][3] = b[2] & a[3];
assign p[2][4] = b[2] & a[4];
assign p[2][5] = b[2] & a[5];
assign p[2][6] = b[2] & a[6];
assign p[2][7] = b[2] & a[7];

assign p[3][0] = b[3] & a[0];
assign p[3][1] = b[3] & a[1];
assign p[3][2] = b[3] & a[2];
assign p[3][3] = b[3] & a[3];
assign p[3][4] = b[3] & a[4];
assign p[3][5] = b[3] & a[5];
assign p[3][6] = b[3] & a[6];
assign p[3][7] = b[3] & a[7];

assign p[4][0] = b[4] & a[0];
assign p[4][1] = b[4] & a[1];
assign p[4][2] = b[4] & a[2];
assign p[4][3] = b[4] & a[3];
assign p[4][4] = b[4] & a[4];
assign p[4][5] = b[4] & a[5];
assign p[4][6] = b[4] & a[6];
assign p[4][7] = b[4] & a[7];

assign p[5][0] = b[5] & a[0];
assign p[5][1] = b[5] & a[1];
assign p[5][2] = b[5] & a[2];
assign p[5][3] = b[5] & a[3];
assign p[5][4] = b[5] & a[4];
assign p[5][5] = b[5] & a[5];
assign p[5][6] = b[5] & a[6];
assign p[5][7] = b[5] & a[7];

assign p[6][0] = b[6] & a[0];
assign p[6][1] = b[6] & a[1];
assign p[6][2] = b[6] & a[2];
assign p[6][3] = b[6] & a[3];
assign p[6][4] = b[6] & a[4];
assign p[6][5] = b[6] & a[5];
assign p[6][6] = b[6] & a[6];
assign p[6][7] = b[6] & a[7];

assign p[7][0] = b[7] & a[0];
assign p[7][1] = b[7] & a[1];
assign p[7][2] = b[7] & a[2];
assign p[7][3] = b[7] & a[3];
assign p[7][4] = b[7] & a[4];
assign p[7][5] = b[7] & a[5];
assign p[7][6] = b[7] & a[6];
assign p[7][7] = b[7] & a[7];

// stage 2: Partial Products addition, step1
//column1
hfa i0(s[0], c[0], p[1][0], p[0][1]);
fla j0(s[1], c[1], p[0][2], p[1][1], p[2][0]);
fla j1(s[2], c[2], p[0][3], p[1][2], p[2][1]);
fla j2(s[3], c[3], p[0][4], p[1][3], p[2][2]);
fla j3(s[4], c[4], p[0][5], p[1][4], p[2][3]);
fla j4(s[5], c[5], p[0][6], p[1][5], p[2][4]);
fla j5(s[6], c[6], p[0][7], p[1][6], p[2][5]);
hfa i1(s[7], c[7], p[1][7], p[2][6]);

//column2
hfa i2(s[8], c[8], p[3][1], p[4][0]);
fla j6(s[9], c[9], p[3][2], p[4][1], p[5][0]);
fla j7(s[10], c[10], p[3][3], p[4][2], p[5][1]);
fla j8(s[11], c[11], p[3][4], p[4][3], p[5][2]);
fla j9(s[12], c[12], p[3][5], p[4][4], p[5][3]);
fla j10(s[13], c[13], p[3][6], p[4][5], p[5][4]);
fla j11(s[14], c[14], p[3][7], p[4][6], p[5][5]);
hfa i3(s[15], c[15], p[4][7], p[5][6]);

// stage 2: Partial Products addition, step2
//column1

hfa i4(s[16], c[16], s[1], c[0]);
fla j12(s[17], c[17], s[2], c[1], p[3][0]);
fla j13(s[18], c[18], s[3], c[2], s[8]);
fla j14(s[19], c[19], s[4], c[3], s[9]);
fla j15(s[20], c[20], s[5], c[4], s[10]);
fla j16(s[21], c[21], s[6], c[5], s[11]);
fla j17(s[22], c[22], s[7], c[6], s[12]);
fla j18(s[23], c[23], p[2][7], c[7], s[13]);

//column2
hfa i5(s[24], c[24],  p[6][0], c[9]);
fla j19(s[25], c[25], p[7][0], c[10], p[6][1]);
fla j20(s[26], c[26], p[7][1], c[11], p[6][2]);
fla j21(s[27], c[27], p[7][2], c[12], p[6][3]);
fla j22(s[28], c[28], p[7][3], c[13], p[6][4]);
fla j23(s[29], c[29], p[7][4], c[14], p[6][5]);
fla j24(s[30], c[30], p[7][5], c[15], p[6][6]);
hfa i6(s[31], c[31], p[7][6], p[6][7]);


// stage 2: Partial Products addition, step3
//column1
hfa i7(s[32], c[32],  s[17], c[16]);
hfa i8(s[33], c[33],  s[18], c[17]);
fla j25(s[34], c[34], s[19], c[18], c[8]);
fla j26(s[35], c[35], s[20], c[19], s[24]);
fla j27(s[36], c[36], s[21], c[20], s[25]);
fla j28(s[37], c[37], s[22], c[21], s[26]);
fla j29(s[38], c[38], s[23], c[22], s[27]);
fla j30(s[39], c[39], s[14], c[23], s[28]);
hfa i9(s[40], c[40],  s[15], s[29]);
hfa i10(s[41], c[41],  p[5][7], s[30]);

// stage 2: Partial Products addition, step4
//column1
hfa i11(s[42], c[42],  s[33], c[32]);
hfa i12(s[43], c[43],  s[34], c[33]);
hfa i13(s[44], c[44],  s[35], c[34]);
fla j31(s[45], c[45], s[36], c[35], c[24]);
fla j32(s[46], c[46], s[37], c[36], c[25]);
fla j33(s[47], c[47], s[38], c[37], c[26]);
fla j34(s[48], c[48], s[39], c[38], c[27]);
fla j35(s[49], c[49], s[40], c[39], c[28]);
fla j36(s[50], c[50], s[41], c[40], c[29]);
fla j37(s[51], c[51], s[31], c[41], c[30]);
hfa i14(s[52], c[52], p[7][7], c[31]);

// stage 3: Partial Products addition
//column1
hfa i15(s[53], c[53],  s[43], c[42]);
fla j38(s[54], c[54],  s[44], c[43], c[53]);
fla j39(s[55], c[55],  s[45], c[44], c[54]);
fla j40(s[56], c[56],  s[46], c[45], c[55]);
fla j41(s[57], c[57],  s[47], c[46], c[56]);
fla j42(s[58], c[58],  s[48], c[47], c[57]);
fla j43(s[59], c[59],  s[49], c[48], c[58]);
fla j44(s[60], c[60],  s[50], c[49], c[59]);
fla j45(s[61], c[61],  s[51], c[50], c[60]);
fla j46(s[62], c[62],  s[52], c[51], c[61]);
fla j48(s[63], c[63],  c[52], 1'b0, c[62]);

assign pr = {s[63], s[62], s[61], s[60], s[59], s[58], s[57], s[56], s[55], s[54], s[53], s[42], s[32], s[16], s[0], p[0][0]};
endmodule

// pata kaise chala ki 64 wire sum aur carry ke banane hai
//full adder aur half adder ke naam kaise rakhe
// last  mein 0 kyu add kiya