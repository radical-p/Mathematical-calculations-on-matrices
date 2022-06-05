module matrix;

reg [16:0] a [3:0][3:0];
reg [16:0] b [3:0][3:0];
reg [16:0] resault [3:0][3:0];
reg [16:0] sum [3:0][3:0];
reg [16:0] sub [3:0][3:0];
integer i, j, k;

always@(a or b)
begin

//Multipliction
for(i=0 ; i<3 ; i = i + 1)
	for(j=0 ; j<3 ; j = j + 1)
		begin
			resault[i][j] = 8'd0;
			for(k=0 ; k<3 ; k = k + 1) 
				resault[i][j] = resault[i][j] + (a[i][k]*b[k][j]);
		end

$display("Multipliction:\n%d %d %d\n%d %d %d\n%d %d %d\n", resault[0][0], resault[0][1], resault[0][2], resault[1][0], resault[1][1], resault[1][2], resault[2][0], resault[2][1], resault[2][2]);

//sumation
for(i=0 ; i<3 ; i = i + 1)
	for(j=0 ; j<3 ; j = j + 1)
		sum[i][j] = a[i][j]+b[i][j];

$display("Sumation:\n%d %d %d\n%d %d %d\n%d %d %d\n", sum[0][0], sum[0][1], sum[0][2], sum[1][0], sum[1][1], sum[1][2], sum[2][0], sum[2][1], sum[2][2]);

//Subtract
for(i=0 ; i<3 ; i = i + 1)
	for(j=0 ; j<3 ; j = j + 1)
		sub[i][j] = a[i][j]-b[i][j];

$display("Subtract:\n%d %d %d\n%d %d %d\n%d %d %d\n", sub[0][0], sub[0][1], sub[0][2], sub[1][0], sub[1][1], sub[1][2], sub[2][0], sub[2][1], sub[2][2]);

end

initial 
begin
a[0][0] <= -1;
a[0][1] <= 5;
a[0][2] <= 3;
a[1][0] <= 2;
a[1][1] <= 1;
a[1][2] <= 4;
a[2][0] <= 9;
a[2][1] <= 6;
a[2][2] <= 11;
b[0][0] <= 22;
b[0][1] <= 12;
b[0][2] <= 3;
b[1][0] <= 6;
b[1][1] <= 8;
b[1][2] <= 7;
b[2][0] <= 19;
b[2][1] <= 3;
b[2][2] <= 8;

end

endmodule
