module tb_decoder;

wire	[7:0] D_dec3to8_shift ;
wire	[7:0] D_dec3to8_case;

reg	[2:0] in;
reg	en;


dec3to8_shift	dut0(	.out	(D_dec3to8_shift),
			.in	(in	),
			.en	(en	));

dec3to8_case 	dut1(	.out	(D_dec3to8_case),
			.in	(in	),
			.en	(en	));


//stimulus

initial begin
$display("====================================================================");
$display("	in	en	D_dec3to8_shift		D_dec3to8_case	");
$display("====================================================================");
#(0)	{in, en} = 4'b0000;
#(50)	{in, en} = 4'b0000; #(50)	$display(" %b\t%b\t%b\t%b", in, en, D_dec3to8_shift,D_dec3to8_case );
#(50)	{in, en} = 4'b0001; #(50)	$display(" %b\t%b\t%b\t%b", in, en, D_dec3to8_shift,D_dec3to8_case );
#(50)	{in, en} = 4'b0010; #(50)	$display(" %b\t%b\t%b\t%b", in, en, D_dec3to8_shift,D_dec3to8_case );
#(50)	{in, en} = 4'b0011; #(50)	$display(" %b\t%b\t%b\t%b", in, en, D_dec3to8_shift,D_dec3to8_case );
#(50)	{in, en} = 4'b0100; #(50)	$display(" %b\t%b\t%b\t%b", in, en, D_dec3to8_shift,D_dec3to8_case );
#(50)	{in, en} = 4'b0110; #(50)	$display(" %b\t%b\t%b\t%b", in, en, D_dec3to8_shift,D_dec3to8_case );
#(50)	{in, en} = 4'b0111; #(50)	$display(" %b\t%b\t%b\t%b", in, en, D_dec3to8_shift,D_dec3to8_case );
#(50)	{in, en} = 4'b1000; #(50)	$display(" %b\t%b\t%b\t%b", in, en, D_dec3to8_shift,D_dec3to8_case );
#(50)	{in, en} = 4'b1001; #(50)	$display(" %b\t%b\t%b\t%b", in, en, D_dec3to8_shift,D_dec3to8_case );
#(50)	{in, en} = 4'b1010; #(50)	$display(" %b\t%b\t%b\t%b", in, en, D_dec3to8_shift,D_dec3to8_case );
#(50)	{in, en} = 4'b1011; #(50)	$display(" %b\t%b\t%b\t%b", in, en, D_dec3to8_shift,D_dec3to8_case );
#(50)	{in, en} = 4'b1100; #(50)	$display(" %b\t%b\t%b\t%b", in, en, D_dec3to8_shift,D_dec3to8_case );
#(50)	{in, en} = 4'b1101; #(50)	$display(" %b\t%b\t%b\t%b", in, en, D_dec3to8_shift,D_dec3to8_case );
#(50)	{in, en} = 4'b1110; #(50)	$display(" %b\t%b\t%b\t%b", in, en, D_dec3to8_shift,D_dec3to8_case );
#(50)	{in, en} = 4'b1111; #(50)	$display(" %b\t%b\t%b\t%b", in, en, D_dec3to8_shift,D_dec3to8_case );

$finish;
end

endmodule
