`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/30/2024 01:26:12 PM
// Design Name: 
// Module Name: arr_mul
// Project Name: 3x2 array multiplier 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module arr_mul (
    input [2:0] b,
    input [1:0] a,
    output [4:0] s
);
    // Declare intermediate wires
    wire s0, t1, t2, t3, t4, c1, c2;

    // Partial product generation
    and (s0, b[0], a[0]);
    and (t1, b[1], a[0]);
    and (t3, b[2], a[0]);
    and (t0, b[0], a[1]);
    and (t2, b[1], a[1]);
    and (t4, b[2], a[1]);

    // Sum and carry computation
    HA ha1 (.a(t0), .b(t1), .s(s[1]), .c(c1));
    FA fa1 (.a(t3), .b(t2), .c(c1), .s(s[2]), .carry(c2));
    HA ha2 (.a(t4), .b(c2), .s(s[3]), .c(s[4]));

    // Assign the least significant bit
    assign s[0] = s0;

endmodule

// Half Adder Module
module HA(
    input a, b,
    output s, c
);
    assign s = a ^ b; 
    assign c = a & b;
endmodule

// Full Adder Module
module FA(
    input a, b, c,
    output s, carry
);
    assign s = a ^ b ^ c; 
    assign carry = (a & b) | (b & c) | (c & a);
endmodule
