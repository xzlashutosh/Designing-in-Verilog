module D_Flip_Flop(Q, reset, clk, D);

input D, clk, reset;
output reg Q;
always@(posedge clk) begin
    if (reset == 1) 
        Q <= 1'b1;
    else 
        Q <= D;
end

endmodule