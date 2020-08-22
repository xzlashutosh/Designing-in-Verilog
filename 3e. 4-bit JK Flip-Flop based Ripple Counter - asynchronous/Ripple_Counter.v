`include "JK_Flip_Flop.v"
module Ripple_Counter(output [3:0] Q, input J, K, clock);
    JK_Flip_Flop I0 (Q[0], J, K, clock);
    JK_Flip_Flop I1 (Q[1], J, K, Q[0]);
    JK_Flip_Flop I2 (Q[2], J, K, Q[1]);
    JK_Flip_Flop I3 (Q[3], J, K, Q[2]);

endmodule


