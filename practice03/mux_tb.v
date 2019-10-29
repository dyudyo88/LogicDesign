module mux_tb;

reg in0;
reg in1;
reg sel;



wire out1;
wire out2;
wire out3;


mux2to1_cond dut0(	.in0(in0),
		.in1(in1),
		.out(out1),
		.sel(sel)	);


mux2tal_if dut1(	.in0(in0),
		.in1(in1),
		.out(out2),
		.sel(sel)	);

mux_case dut2(	.in0(in0),
		.in1(in1),
		.out(out3),
		.sel(sel)	);

initial begin
$display("=============================================");
$display(" in0	in1	sel	out1	out2	out3");
$display("=============================================");


#(50)	{in0,in1,sel} = 3'b000 ; #(50)	$display(" %b\t%b\t%b\t%b\t%b\t", in0,in1,sel,out1,out2,out3);
#(50)	{in0,in1,sel} = 3'b001 ; #(50)	$display(" %b\t%b\t%b\t%b\t%b\t", in0,in1,sel,out1,out2,out3);
#(50)	{in0,in1,sel} = 3'b010 ; #(50)	$display(" %b\t%b\t%b\t%b\t%b\t", in0,in1,sel,out1,out2,out3);
#(50)	{in0,in1,sel} = 3'b011 ; #(50)	$display(" %b\t%b\t%b\t%b\t%b\t", in0,in1,sel,out1,out2,out3);
#(50)	{in0,in1,sel} = 3'b100 ; #(50)	$display(" %b\t%b\t%b\t%b\t%b\t", in0,in1,sel,out1,out2,out3);
#(50)	{in0,in1,sel} = 3'b101 ; #(50)	$display(" %b\t%b\t%b\t%b\t%b\t", in0,in1,sel,out1,out2,out3);
#(50)	{in0,in1,sel} = 3'b110 ; #(50)	$display(" %b\t%b\t%b\t%b\t%b\t", in0,in1,sel,out1,out2,out3);
#(50)	{in0,in1,sel} = 3'b111 ; #(50)	$display(" %b\t%b\t%b\t%b\t%b\t", in0,in1,sel,out1,out2,out3);
	
$finish;



end
endmodule
