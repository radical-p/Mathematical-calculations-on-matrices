module MatrisProject2();
    parameter SIZE1 = 2; 
	parameter SIZE2 = 2; 
	parameter SIZE3 = 2; 
	parameter SIZE4 = 2; 
    reg signed [7:0] matris1 [0:SIZE1][0:SIZE2];
    reg signed [7:0] matris2 [0:SIZE3][0:SIZE4];
    wire signed [15:0] matris_mul [0:SIZE1][0:SIZE4];	
    initial
      begin
        matris1[0][0] = 8'b01101001;
        matris1[0][1] = 8'b01010100;
        matris1[0][2] = 8'b01110100;
        matris1[1][0] = 8'b10001000;
        matris1[1][1] = 8'b10110101;
        matris1[1][2] = 8'b11001000;
        matris1[2][0] = 8'b01100100;
        matris1[2][1] = 8'b01101100;
        matris1[2][2] = 8'b00011110;
        
        matris2[0][0] = 8'b00100011;
        matris2[0][1] = 8'b01010011;
        matris2[0][2] = 8'b00110011;
        matris2[1][0] = 8'b00110011;
        matris2[1][1] = 8'b10010011;
        matris2[1][2] = 8'b01010011;
        matris2[2][0] = 8'b00100101;
        matris2[2][1] = 8'b01100011;
        matris2[2][2] = 8'b10100011;
		
		
		if(SIZE2 != SIZE3)
			$display("It is not possible to multiply Matrix 1 by Matrix 2");

    end 
    
      
    genvar i,j;
      
    generate
      for (i=0; i<SIZE1+1; i=i+1)
        for (j=0; j<SIZE2+1; j=j+1) begin
		  boothmul my_booth(.a(matris1[i][j]),.b(matris2[i][j]),.c(matris_mul[i][j]));
        end
    endgenerate
          
		 
endmodule




