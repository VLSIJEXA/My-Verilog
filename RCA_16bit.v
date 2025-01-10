`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/10/2025 09:58:35 PM
// Design Name: 
// Module Name: RCA_16bit
// Project Name: 
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


module RCA_4bit(input [3:0] a, b, input cin, output cout, output [3:0] sum);
  wire t1,t2,t3;
  FA_1bit ff1(.a(a[0]),.b(b[0]),.c(cin),.carry(t1),.s(sum[0]));
  FA_1bit ff2(.a(a[1]),.b(b[1]),.c(t1),.carry(t2),.s(sum[1]));
  FA_1bit ff3(.a(a[2]),.b(b[2]),.c(t2),.carry(t3),.s(sum[2]));
  FA_1bit ff4(.a(a[3]),.b(b[3]),.c(t3),.carry(cout),.s(sum[3]));
   
endmodule

module FA_1bit(input a,b,c,output carry,s);
    assign s=a^b^c;
    assign carry=(a&b)|(b&c)|(c&a);
endmodule
