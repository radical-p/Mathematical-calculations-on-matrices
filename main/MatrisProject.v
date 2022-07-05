module MatrisProject();
    parameter SIZE1 = 2; 
	parameter SIZE2 = 2; 
	parameter SIZE3 = 2; 
	parameter SIZE4 = 2; 
    reg [3:0] matris1 [0:SIZE1][0:SIZE2];
    reg [3:0] matris2 [0:SIZE3][0:SIZE4];
    wire [4:0] matris_sum [0:SIZE1][0:SIZE2]; 
    wire [4:0] matris_sub [0:SIZE1][0:SIZE2];
    wire [7:0] matris_mul [0:SIZE1][0:SIZE4];	
    wire [3:0] matris_transpose1 [0:SIZE2][0:SIZE1];
    wire [3:0] matris_transpose2 [0:SIZE4][0:SIZE3];
    initial
      begin
        matris1[0][0] = 4'b0110;
        matris1[0][1] = 4'b0101;
        matris1[0][2] = 4'b0111;
        matris1[1][0] = 4'b1000;
        matris1[1][1] = 4'b1011;
        matris1[1][2] = 4'b1100;
        matris1[2][0] = 4'b0110;
        matris1[2][1] = 4'b0110;
        matris1[2][2] = 4'b0001;
        
        matris2[0][0] = 4'b0010;
        matris2[0][1] = 4'b0101;
        matris2[0][2] = 4'b0011;
        matris2[1][0] = 4'b0011;
        matris2[1][1] = 4'b1001;
        matris2[1][2] = 4'b0101;
        matris2[2][0] = 4'b0010;
        matris2[2][1] = 4'b0110;
        matris2[2][2] = 4'b1010;
		
		
		if(SIZE2 != SIZE3)
			$display("It is not possible to multiply Matrix 1 by Matrix 2");

    end 
    
      
    genvar i,j;
      
    generate
      for (i=0; i<SIZE1+1; i=i+1)
        for (j=0; j<SIZE2+1; j=j+1) begin
          AdderSubtractor add(.A(matris1[i][j]), .B(matris2[i][j]), .S(matris_sum[i][j]), .Op(0));
          AdderSubtractor sub(.A(matris1[i][j]), .B(matris2[i][j]), .S(matris_sub[i][j]), .Op(1));
		  Multiplier multiplication(.a(matris1[i][j]), .b(matris2[i][j]), .p(matris_mul[i][j]));
		  Transpose transposem1(.m1(matris1[i][j]), .m2(matris_transpose1[j][i]));
		  Transpose transposem2(.m1(matris2[i][j]), .m2(matris_transpose2[j][i]));
        end
    endgenerate
          
		 
endmodule



