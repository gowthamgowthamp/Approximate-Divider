module mux_bout (
    output bout,
    input a,
    input b,bin

);
    assign bout = ~a&bin | ~a&b | b&bin;
endmodule
module mux_rout (
    output rout,
    input a,
    input b,
    input bin, qs

);
    wire diff;
    assign diff = a^b^bin;
    assign rout = qs&diff | ~qs&a;
endmodule

module linear_array_8 (
    input [8:0]x, 
    input bin,
    input [7:0]y,
    output qs,
    output [7:0]rout
);
    wire i1, i2, i3, i4, i5, i6, i7, i8;
    mux_bout mut1 (.a(x[0]), .b(y[0]), .bin(bin), .bout(i1));
    mux_bout mut2 (.a(x[1]), .b(y[1]), .bin(i1), .bout(i2));
    mux_bout mut3 (.a(x[2]), .b(y[2]), .bin(i2), .bout(i3));
    mux_bout mut4 (.a(x[3]), .b(y[3]), .bin(i3), .bout(i4));
    mux_bout mut5 (.a(x[4]), .b(y[4]), .bin(i4), .bout(i5));
    mux_bout mut6 (.a(x[5]), .b(y[5]), .bin(i5), .bout(i6));
    mux_bout mut7 (.a(x[6]), .b(y[6]), .bin(i6), .bout(i7));
    mux_bout mut8 (.a(x[7]), .b(y[7]), .bin(i7), .bout(i8));
    assign qs = ~i8 | x[8];
    mux_rout mut9 (.a(x[0]), .b(y[0]), .bin(bin), .qs(qs), .rout(rout[0]));
    mux_rout mut10 (.a(x[1]), .b(y[1]), .bin(i1), .qs(qs), .rout(rout[1]));
    mux_rout mut11 (.a(x[2]), .b(y[2]), .bin(i2), .qs(qs), .rout(rout[2]));
    mux_rout mut12 (.a(x[3]), .b(y[3]), .bin(i3), .qs(qs), .rout(rout[3]));
    mux_rout mut13 (.a(x[4]), .b(y[4]), .bin(i4), .qs(qs), .rout(rout[4]));
    mux_rout mut14 (.a(x[5]), .b(y[5]), .bin(i5), .qs(qs), .rout(rout[5]));
    mux_rout mut15 (.a(x[6]), .b(y[6]), .bin(i6), .qs(qs), .rout(rout[6]));
    mux_rout mut16 (.a(x[7]), .b(y[7]), .bin(i7), .qs(qs), .rout(rout[7]));
endmodule

module array(
    input [15:0]x,
    input [7:0]y,
    input bin,
    output [7:0]q,
    output [7:0]r
);
    wire [8:0] rout1;
    linear_array_8 uut1 (.x(x[15:7]), .y(y), .qs(q[7]), .rout(rout1[8:1]), .bin(bin));
    wire [8:0] rout2;
    assign rout1[0] = x[6];
    linear_array_8 uut2 (.x(rout1), .y(y), .qs(q[6]), .rout(rout2[8:1]), .bin(bin));
    wire [8:0] rout3;
    assign rout2[0] = x[5];
    linear_array_8 uut3 (.x(rout2), .y(y), .qs(q[5]), .rout(rout3[8:1]), .bin(bin));
    wire [8:0] rout4;
    assign rout3[0] = x[4];
    linear_array_8 uut4 (.x(rout3), .y(y), .qs(q[4]), .rout(rout4[8:1]), .bin(bin));
    wire [8:0] rout5;
    assign rout4[0] = x[3];
    linear_array_8 uut5 (.x(rout4), .y(y), .qs(q[3]), .rout(rout5[8:1]), .bin(bin));
    wire [8:0] rout6;
    assign rout5[0] = x[2];
    linear_array_8 uut6 (.x(rout5), .y(y), .qs(q[2]), .rout(rout6[8:1]), .bin(bin));
    wire [8:0] rout7;
    assign rout6[0] = x[1];
    linear_array_8 uut7 (.x(rout6), .y(y), .qs(q[1]), .rout(rout7[8:1]), .bin(bin));
    assign rout7[0] = x[0];
    linear_array_8 uut8 (.x(rout7), .y(y), .qs(q[0]), .rout(r), .bin(bin));
endmodule