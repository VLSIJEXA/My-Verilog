//i have designed 4-bit shift reg. by 3 ways
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/07/2024 03:17:43 PM
// Design Name: 
// Module Name: exa
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
module exa(clk,clr,a,e);
input clk,clr,a;
output reg e;
reg b,c,d;

always@(posedge clk or negedge clr)
begin
if(!clr) begin
b=0;c=0;d=0;e=0;
  end
else
  begin
   e<=d;
   d<=c;
   c<=b;
   b<=a;
  end 
end
endmodule
//////////////////////////////////////////////////////////////////////////////////
module exa(clk,clr,a,e);
input clk,clr,a;
output reg e;
reg b,c,d;

always@(posedge clk or negedge clr)
begin
if(!clr) begin
b=0;c=0;d=0;e=0;
  end
else
  begin
   e=d;
   d=c;
  c=b;
  b=a;
  end 
end
endmodule
//////////////////////////////////////////////////////////////////////////////////
    module exa(clk,clr,a,e);
    input clk,clr,a;
    output reg e;
    reg b,c,d;
    
    always@(posedge clk or negedge clr)
    begin
    if(!clr) begin
    b=0;c=0;d=0;e=0;
      end
    else
      begin
       b<=a;
       c<=b;
       d<=c;
       e<=d;
      end 
    end

endmodule
