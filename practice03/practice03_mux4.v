module mux4to1_inst(out, in ,sel);

output	out;
input	[3:0] in;
input	[1:0] sel;
wire	[1:0] w;

mux_case u1(	.out(w[0]),
		.in0(in[0]),
		.in1(in[1]),
		.sel(sel[0]));

mux_case u2(	.out(w[1]),
		.in0(in[2]),
		.in1(in[3]),
		.sel(sel[0]));

mux_case u3(	.out(out),
		.in0(w[0]),
		.in1(w[1]),
		.sel(sel[1]));
endmodule


module mux4tal_if(out,in,sel);

output	out;
input	[3:0] in;
input	[1:0] sel;

reg out;

always @(*) begin

	if(sel==2'b00) begin
		out = in[0];
	end else if(sel==2'b01)begin
		out=in[1];
	end else if(sel==2'b10)begin
		out = in[2];
	end else begin
		out=in[3];
	end
end

endmodule




module mux4_case(out,in,sel);

output	out;
input	[3:0] in;
input	[1:0] sel;
reg out;

always @(*) begin
	case(sel)
		2'b00 : {out} = in[0];
		2'b01 : {out} = in[1];
		2'b10 : {out} = in[2];
		2'b11 : {out} = in[3];

	endcase
end
endmodule







