`include "wtm_8.v"

module wtm_8_tb;
reg [7:0] a, b;
wire [15:0] pr;
wtm_8 ins(pr, a, b );

initial begin
        a = 8'b11111111; b = 8'b11111111;
        
end

initial begin
    $monitor($time, "a = %b(%d), b = %b(%d), product = %b(%d)", a,a, b, b, pr, pr);
end

endmodule