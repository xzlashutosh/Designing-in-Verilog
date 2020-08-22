module recoding (output reg [2:0] radix, input a, b, c);
initial begin
    if ((a&b&c) | (~a&~b&~c)) 
          radix = 3'b000;
    else if (~a & (b^c)) begin 
        radix = 3'b001;
        end
    else if (a & (b^c)) 
        assign radix = 3'b010;
    else if (~a&b&c) 
      assign radix = 3'b100;
    else if (a&~b~&c) 
        assign radix = 3'b101;           
    else 
        assign radix = 3'b110;
end
endmodule
