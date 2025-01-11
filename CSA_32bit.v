`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/11/2025 04:42:00 PM
// Design Name: 
// Module Name: CSA_32bit
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


module CSA_32bit(
input [31:0]A,input Cin,[31:0]B,output [31:0]SUM,cout
    );
    
    wire t1,t2,t3,t4;
    wire [31:0]z,r;
    
    RCA_3bit rca1(.a(A[2:0]),.b(B[2:0]),.cin(Cin), .cout(t1),.sum(SUM[2:0]));
    
      RCA_4bit rca2(.a(A[6:3]),.b(B[6:3]),.cin(0), .cout(t2),.sum(z[6:3]));
     RCA_4bit rca3(.a(A[6:3]),.b(B[6:3]),.cin(1), .cout(t3),.sum(r[6:3]));
     assign SUM[3]=t1?r[3]:z[3];
     assign SUM[4]=t1?r[4]:z[4];
     assign SUM[5]=t1?r[5]:z[5];
     assign SUM[6]=t1?r[6]:z[6];
      assign t4=t1?t3:t2;
    
     wire s1,s2,s3;
    RCA_5bit rca4(.a(A[11:7]),.b(B[11:7]),.cin(0), .cout(s2),.sum(z[11:7]));
     RCA_5bit rca5(.a(A[11:7]),.b(B[11:7]),.cin(1), .cout(s3),.sum(r[11:7]));
     assign SUM[7]=t4?r[7]:z[7];
     assign SUM[8]=t4?r[8]:z[8];
     assign SUM[9]=t4?r[9]:z[9];
     assign SUM[10]=t4?r[10]:z[10];
      assign SUM[11]=t4?r[11]:z[11];
       assign s1=t4?s3:s2;
    
     wire q1,q2,q3;
    RCA_6bit rca6(.a(A[17:12]),.b(B[17:12]),.cin(0), .cout(q2),.sum(z[17:12]));
     RCA_6bit rca7(.a(A[17:12]),.b(B[17:12]),.cin(1), .cout(q3),.sum(r[17:12]));
     assign SUM[12]=s1?r[12]:z[12];
     assign SUM[13]=s1?r[13]:z[13];
     assign SUM[14]=s1?r[14]:z[14];
     assign SUM[15]=s1?r[15]:z[15];
      assign SUM[16]=s1?r[16]:z[16];
      assign SUM[17]=s1?r[17]:z[17];
       assign q1=s1?q3:q2;
    
     wire r1,r2,r3;
    RCA_7bit rca8(.a(A[24:18]),.b(B[24:18]),.cin(0), .cout(r2),.sum(z[24:18]));
     RCA_7bit rca9(.a(A[24:18]),.b(B[24:18]),.cin(1), .cout(r3),.sum(r[24:18]));
     assign SUM[18]=q1?r[18]:z[18];
     assign SUM[19]=q1?r[19]:z[19];
     assign SUM[20]=q1?r[20]:z[20];
     assign SUM[21]=q1?r[21]:z[21];
      assign SUM[22]=q1?r[22]:z[22];
      assign SUM[23]=q1?r[23]:z[23];
        assign SUM[24]=q1?r[24]:z[24];
         assign r1=q1?r3:r2;
         
          wire p2,p3;
    RCA_7bit rca10(.a(A[31:25]),.b(B[31:25]),.cin(0), .cout(p2),.sum(z[31:25]));
     RCA_7bit rca11(.a(A[31:25]),.b(B[31:25]),.cin(1), .cout(p3),.sum(r[31:25]));
     assign SUM[25]=r1?r[25]:z[25];
     assign SUM[26]=r1?r[26]:z[26];
     assign SUM[27]=r1?r[27]:z[27];
     assign SUM[28]=r1?r[28]:z[28];
      assign SUM[29]=r1?r[29]:z[29];
      assign SUM[30]=r1?r[30]:z[30];
        assign SUM[31]=r1?r[31]:z[31];
         assign cout=r1?p3:p2;
endmodule

module RCA_3bit(input [2:0] a, b, input cin, output cout, output [2:0] sum);
  wire t1,t2;
  FA_1bit ff1(.a(a[0]),.b(b[0]),.c(cin),.carry(t1),.s(sum[0]));
  FA_1bit ff2(.a(a[1]),.b(b[1]),.c(t1),.carry(t2),.s(sum[1]));
  FA_1bit ff3(.a(a[2]),.b(b[2]),.c(t2),.carry(cout),.s(sum[2]));
  endmodule

module RCA_4bit(input [3:0] a, b, input cin, output cout, output [3:0] sum);
  wire t1,t2,t3;
  FA_1bit ff1(.a(a[0]),.b(b[0]),.c(cin),.carry(t1),.s(sum[0]));
  FA_1bit ff2(.a(a[1]),.b(b[1]),.c(t1),.carry(t2),.s(sum[1]));
  FA_1bit ff3(.a(a[2]),.b(b[2]),.c(t2),.carry(t3),.s(sum[2]));
  FA_1bit ff4(.a(a[3]),.b(b[3]),.c(t3),.carry(cout),.s(sum[3]));
   endmodule
module RCA_5bit(input [4:0] a, b, input cin, output cout, output [4:0] sum);
  wire t1,t2,t3,t4;
  FA_1bit ff1(.a(a[0]),.b(b[0]),.c(cin),.carry(t1),.s(sum[0]));
  FA_1bit ff2(.a(a[1]),.b(b[1]),.c(t1),.carry(t2),.s(sum[1]));
  FA_1bit ff3(.a(a[2]),.b(b[2]),.c(t2),.carry(t3),.s(sum[2]));
  FA_1bit ff4(.a(a[3]),.b(b[3]),.c(t3),.carry(t4),.s(sum[3]));
   FA_1bit ff5(.a(a[4]),.b(b[4]),.c(t4),.carry(cout),.s(sum[4]));
endmodule
module RCA_6bit(input [5:0] a, b, input cin, output cout, output [5:0] sum);
  wire t1,t2,t3,t4,t5;
  FA_1bit ff1(.a(a[0]),.b(b[0]),.c(cin),.carry(t1),.s(sum[0]));
  FA_1bit ff2(.a(a[1]),.b(b[1]),.c(t1),.carry(t2),.s(sum[1]));
  FA_1bit ff3(.a(a[2]),.b(b[2]),.c(t2),.carry(t3),.s(sum[2]));
  FA_1bit ff4(.a(a[3]),.b(b[3]),.c(t3),.carry(t4),.s(sum[3]));
  FA_1bit ff5(.a(a[4]),.b(b[4]),.c(t4),.carry(t5),.s(sum[4]));
  FA_1bit ff6(.a(a[5]),.b(b[5]),.c(t5),.carry(cout),.s(sum[5]));
   
endmodule
module RCA_7bit(input [6:0] a, b, input cin, output cout, output [6:0] sum);
  wire t1,t2,t3,t4,t5,t6;
  FA_1bit ff1(.a(a[0]),.b(b[0]),.c(cin),.carry(t1),.s(sum[0]));
  FA_1bit ff2(.a(a[1]),.b(b[1]),.c(t1),.carry(t2),.s(sum[1]));
  FA_1bit ff3(.a(a[2]),.b(b[2]),.c(t2),.carry(t3),.s(sum[2]));
  FA_1bit ff4(.a(a[3]),.b(b[3]),.c(t3),.carry(t4),.s(sum[3]));
  FA_1bit ff5(.a(a[4]),.b(b[4]),.c(t4),.carry(t5),.s(sum[4]));
  FA_1bit ff6(.a(a[5]),.b(b[5]),.c(t5),.carry(t6),.s(sum[5]));
  FA_1bit ff7(.a(a[6]),.b(b[6]),.c(t6),.carry(cout),.s(sum[6]));
   
endmodule

module FA_1bit(input a,b,c,output carry,s);
    assign s=a^b^c;
    assign carry=(a&b)|(b&c)|(c&a);
endmodule
