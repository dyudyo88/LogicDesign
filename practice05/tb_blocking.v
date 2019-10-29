module tb_bnb;

wire	q1;
wire	q2;

reg	d;
reg	clk;

initial clk=1'b0;
always #(100) clk=~clk;


block	 dut0(	.q(q1),
		.d(d),
		.clk(clk));

nonblock dut1(	.q(q2),
		.d(d),
		.clk(clk));

initial begin
$display("======================================================");
$display("	d	q1		q2"		);
$display("======================================================");
#(0) 	{d} = 1'b0;
#(50)	{d} = 1'b0 ; #(50)	$display(" %b\t%b\t%b", d,q1,q2);
#(50)	{d} = 1'b1 ; #(50)	$display(" %b\t%b\t%b", d,q1,q2);
#(50)	{d} = 1'b1 ; #(50)	$display(" %b\t%b\t%b", d,q1,q2);
#(50)	{d} = 1'b1 ; #(50)	$display(" %b\t%b\t%b", d,q1,q2);
#(50)	{d} = 1'b0 ; #(50)	$display(" %b\t%b\t%b", d,q1,q2);
#(50)	{d} = 1'b0 ; #(50)	$display(" %b\t%b\t%b", d,q1,q2);
#(50)	{d} = 1'b0 ; #(50)	$display(" %b\t%b\t%b", d,q1,q2);
#(50)	{d} = 1'b1 ; #(50)	$display(" %b\t%b\t%b", d,q1,q2);

$finish;

end

endmodule


