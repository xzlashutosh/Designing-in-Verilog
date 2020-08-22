`include "T_Flip_Flop.v"
module Ripple_Counter(output [3:0] Q, input T, CLK, reset);
T_Flip_Flop I0 (Q[0], T, CLK, reset);
T_Flip_Flop I1 (Q[1], T, Q[0], reset);
T_Flip_Flop I2 (Q[2], T, Q[1], reset);
T_Flip_Flop I3 (Q[3], T, Q[2], reset);
endmodule





