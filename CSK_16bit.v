`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/10/2025 10:26:36 PM
// Design Name: 
// Module Name: CSK_16bit
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
// carry skip adder
//////////////////////////////////////////////////////////////////////////////////


module CSK_16bit( input[15:0]a,input c,input[15:0]b,output[16:0]s);

    wire t1,t2,t3,t4,t5,t6,t7;
     RCA_4bit x1(.a(a[3:0]),.b(b[3:0]),.cin(c),.cout(t1),.sum(s[3:0]));
 assign t2=a[0]^b[0];
  assign t3=a[1]^b[1];  
  assign t4=a[2]^b[2];  
 assign  t5=a[3]^b[3];  
 assign t6=t2&t3&t4&t5;  
    assign t7=t6?c:t1;
    wire q1,q2,q3,q4,q5,q6,q7;
     RCA_4bit x2(.a(a[7:4]),.b(b[7:4]),.cin(t7),.cout(q1),.sum(s[7:4]));
 assign q2=a[4]^b[4];
  assign q3=a[5]^b[5];  
  assign q4=a[6]^b[6];  
 assign  q5=a[7]^b[7];  
 assign q6=q2&q3&q4&q5;  
    assign q7=q6?t7:q1;
   wire m1,m2,m3,m4,m5,m6,m7;
     RCA_4bit x3(.a(a[11:8]),.b(b[11:8]),.cin(q7),.cout(m1),.sum(s[11:8]));
 assign m2=a[8]^b[8];
  assign m3=a[1]^b[1];  
  assign m4=a[2]^b[2];  
 assign  m5=a[3]^b[3];  
 assign m6=m2&m3&m4&m5;  
    assign m7=m6?q7:m1;
   wire n1,n2,n3,n4,n5,n6;
     RCA_4bit x4(.a(a[15:12]),.b(b[15:12]),.cin(m7),.cout(n1),.sum(s[15:12]));
 assign n2=a[12]^b[12];
  assign n3=a[13]^b[13];  
  assign n4=a[14]^b[14];  
 assign  n5=a[15]^b[15];  
 assign n6=n2&n3&n4&n5;  
    assign s[16]=n6?m7:n1;
    endmodule
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


