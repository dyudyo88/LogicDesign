module mux4_tb;

reg [3:0] in;
reg [1:0] sel;

wire out1;
wire out2;
wire out3;

mux4to1_inst dut3 (	.out(out1),
			.in(in),
			.sel(sel));
mux4tal_if dut4(	.out(out2),
			.in(in),
			.sel(sel));

mux4_case dut5(		.out(out3),
			.in(in),
			.sel(sel));




initial begin
$display("=====================================================================");
$display(" in	sel	out1	out2	out3 ");
$display("=====================================================================");


#(50)	{in,sel} = 6'b000000 ; #(50)	$display(" %b\t%b\t%b\t%b\t%b\t", in,sel,out1,out2,out3);
#(50)	{in,sel} = 6'b000001 ; #(50)	$display(" %b\t%b\t%b\t%b\t%b\t", in,sel,out1,out2,out3);
#(50)	{in,sel} = 6'b000010 ; #(50)	$display(" %b\t%b\t%b\t%b\t%b\t", in,sel,out1,out2,out3);
#(50)	{in,sel} = 6'b000011 ; #(50)	$display(" %b\t%b\t%b\t%b\t%b\t", in,sel,out1,out2,out3);
#(50)	{in,sel} = 6'b000100 ; #(50)	$display(" %b\t%b\t%b\t%b\t%b\t", in,sel,out1,out2,out3);
#(50)	{in,sel} = 6'b001010 ; #(50)	$display(" %b\t%b\t%b\t%b\t%b\t", in,sel,out1,out2,out3);
#(50)	{in,sel} = 6'b001100 ; #(50)	$display(" %b\t%b\t%b\t%b\t%b\t", in,sel,out1,out2,out3);
#(50)	{in,sel} = 6'b101100 ; #(50)	$display(" %b\t%b\t%b\t%b\t%b\t", in,sel,out1,out2,out3);
#(50)	{in,sel} = 6'b100100 ; #(50)	$display(" %b\t%b\t%b\t%b\t%b\t", in,sel,out1,out2,out3);
#(50)	{in,sel} = 6'b101100 ; #(50)	$display(" %b\t%b\t%b\t%b\t%b\t", in,sel,out1,out2,out3);
#(50)	{in,sel} = 6'b001111 ; #(50)	$display(" %b\t%b\t%b\t%b\t%b\t", in,sel,out1,out2,out3);

	
$finish;

end
endmodule
