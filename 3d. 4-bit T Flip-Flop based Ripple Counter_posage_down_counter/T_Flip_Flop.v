module T_Flip_Flop(Q, T, clk, reset);
output reg Q;
input T, clk, reset;

always @(posedge clk) begin
    if (reset == 1'b1)
        Q <= 1'b1;
    else 
        Q <= T^Q;
end

endmodule



