//here ,I have to print Fibonacci Sequence:  0,1,1,2,3,5,8,13.here i have used loop in this program.
//name-jatin katiyar
module vector_array_example(
);
     reg [3:0]out[7:0] ;
         reg [3:0]count[7:0] ;
     integer i; 
  initial 
  begin 
  count[0]=0;
  out[0]=0;
  count[1]=1;
  out[1]=1;
  end  
  
  initial 
  for(i=2; i< 8; i = i+1)begin
  count[i]= count[i-1]+ count[i-2];
  out[i]=count[i];
  end
  
  initial                
  for(i=0; i< 8; i = i+1)
  $display("output=%d",out[i]);
  
endmodule
//TCL console
output= 0
output= 1
output= 1
output= 2
output= 3
output= 5
output= 8
output=13
