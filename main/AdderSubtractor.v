module AdderSubtractor(A,B,S,Op);
   output [4:0] S; 
   input [3:0] 	A;  
   input [3:0] 	B;   
   input Op;  
   
   wire C;
   wire C0; 
   wire C1; 
   wire C2; 
   wire C3; 
   
   wire B0; 
   wire B1;
   wire B2; 
   wire B3; 
   
   
   xor(B0, B[0], Op);
   xor(B1, B[1], Op);
   xor(B2, B[2], Op);
   xor(B3, B[3], Op);


   FullAdder fa0(A[0], B0, Op, S[0], C0);   
   FullAdder fa1(A[1], B1, C0, S[1], C1);
   FullAdder fa2(A[2], B2, C1, S[2], C2);
   FullAdder fa3(A[3], B3, C2, S[3], C3);
   
   xor(C,C3,Op);
   assign S[4]=C;

endmodule