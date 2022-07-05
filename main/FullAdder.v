module FullAdder(x,y,cin,s,carryout);
	input x,y,cin;                             
	output s,carryout; 
	wire s1,c1,c2;
	HalfAdder HA1(.a(x),.b(y),.sout(s1),.cout(c1));
	HalfAdder HA2(.a(cin),.b(s1),.sout(s),.cout(c2));
	assign carryout = c1|c2;
endmodule
