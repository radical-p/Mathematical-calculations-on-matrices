module HalfAdder(a,b,sout,cout); 
  input a,b;                             
  output sout,cout;                            
                                      
                                                
  assign sout=a^b;                                
  assign cout=a&b;                               
endmodule
