`include "recoding.v"
module recoding_tb;

reg a, b, c;
wire [2:0] radix ;
recoding I0 (radix, a, b, c);
initial begin
    a = 1; b = 1; c = 0;
    #1 a = 0; b = 0; c = 0;       
    #1 a = 0; b = 0; c = 1; 
    #1 a = 0; b = 1; c = 0; 
    #1 a = 0; b = 1; c = 1; 
    #1 a = 1; b = 0; c = 0;   
    #1 a = 1; b = 0; c = 1; 
    #1 a = 1; b = 1; c = 1; 
end

initial begin
    $monitor($time, "a = %b, b = %b, c = %b, radix = %b", a, b, c, radix);         
end

endmodule