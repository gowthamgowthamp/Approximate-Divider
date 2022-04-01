`include "exact_sub.v"
`timescale 1ns/1ns
module sub_exact ;
    reg [15:0]x;
    reg [7:0]y;
    reg bin;
    wire [7:0]q;
    wire [7:0]r;
    array error (.x(x), .y(y), .bin(bin), .q(q), .r(r));
    initial begin
        $dumpfile("sub_exact.vcd");
        $dumpvars(0, sub_exact);
        bin = 0;
        x = 8; y = 4;
        #20;
        x = 7; y = 3;
        #20;
        x = 5; y = 5;
        #20;
        x = 16; y = 4;
        #20
        x = 20; y = 5;
        #20;
        x = 15; y = 3;
        #20;
        x = 12; y = 5;
        #20;
        x = 40; y = 13;
        #20;
        x = 17; y = 5;
        #20;
        x = 199; y = 7;
        #20;
        x = 127; y = 5;
        #20;
    end
endmodule