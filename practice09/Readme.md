# Lab 09
## 실습 내용
### **리모컨 송신 신호**
#### **Top Module** : 리모컨 적외선 송신을 통하여 LED display에 고유값을 나타내기
 ```verilog 
-------------------------------------------
//	IR Rx Module: Note : Inverted IR Rx Signal
//	--------------------------------------------------
module	ir_rx(	
		o_data,
		i_ir_rxb,
		clk,
		rst_n);

output	[31:0]	o_data		;

input		i_ir_rxb	;
input		clk		;
input		rst_n		;

parameter	IDLE		= 2'b00	;
parameter	LEADCODE	= 2'b01	;	// 9ms high 4.5ms low
parameter	DATACODE	= 2'b10	;	// Custom & Data Code
parameter	COMPLETE	= 2'b11	;	// 32-bit data

//		1M Clock = 1 us Reference Time
wire		clk_1M				;
nco		u_nco(
		.o_gen_clk	( clk_1M	),
		.i_nco_num	( 32'd50	),
		.clk		( clk		),
		.rst_n		( rst_n		));

//		Sequential Rx Bits

wire		ir_rx		;
assign		ir_rx = ~i_ir_rxb;

reg	[1:0]	seq_rx				;
always @(posedge clk_1M or negedge rst_n) begin
	if(rst_n == 1'b0) begin
		seq_rx <= 2'b00;
	end else begin
		seq_rx <= {seq_rx[0], ir_rx}; `
		//seq_rx[0] : 전, ir_rx : 현재
	end
end

//		Count Signal Polarity (High & Low)
reg	[15:0]	cnt_h		;
reg	[15:0]	cnt_l		;
always @(posedge clk_1M or negedge rst_n) begin
	if(rst_n == 1'b0) begin
		cnt_h <= 16'd0;
		cnt_l <= 16'd0;
	end else begin
		case(seq_rx)
			2'b00	: cnt_l <= cnt_l + 1;
			2'b01	: begin
				cnt_l <= 16'd0;
				cnt_h <= 16'd0;
			end
			2'b11	: cnt_h <= cnt_h + 1;
		endcase
	end
end

//		State Machine
reg	[1:0]	state		;
reg	[5:0]	cnt32		;
always @(posedge clk_1M or negedge rst_n) begin
	if(rst_n == 1'b0) begin
		state <= IDLE;
		cnt32 <= 6'd0;
	end else begin
		case (state)
			IDLE: begin
				state <= LEADCODE;
				cnt32 <= 6'd0;
			end
			LEADCODE: begin
				if (cnt_h >= 8500 && cnt_l >= 4000) begin
					state <= DATACODE;
				end else begin
					state <= LEADCODE;
				end
			end
			DATACODE: begin
				if (seq_rx == 2'b01) begin
					cnt32 <= cnt32 + 1;
				end else begin
					cnt32 <= cnt32;
				end
				if (cnt32 >= 6'd32 && cnt_l >= 1000) begin
					state <= COMPLETE;
				end else begin
					state <= DATACODE;
				end
			end
			COMPLETE: state <= IDLE;
		endcase
	end
end

//		32bit Custom & Data Code
reg	[31:0]	data		;
reg	[31:0]	o_data		;
always @(posedge clk_1M or negedge rst_n) begin
	if(rst_n == 1'b0) begin
		data <= 32'd0;
	end else begin
		case (state)
			DATACODE: begin
				if (cnt_l >= 1000) begin
					data[32-cnt32] <= 1'b1;
				end else begin
					data[32-cnt32] <= 1'b0;
				end
			end
			COMPLETE: o_data <= data;
		endcase
	end
end


endmodule

//	--------------------------------------------------
//	Top Module
//	--------------------------------------------------
module	top(
		o_seg_enb,
		o_seg_dp,
		o_seg,
		i_ir_rxb,
		clk,
		rst_n);

output	[5:0]	o_seg_enb	;
output		o_seg_dp	;
output	[6:0]	o_seg		;

input		i_ir_rxb	;
input		clk		;
input		rst_n		;


wire	[31:0] o_data;
ir_rx	u_ir(	.o_data(o_data)		,
		.i_ir_rxb(i_ir_rxb)	,
		.clk(clk)		,
		.rst_n(rst_n)		);

wire	[6:0]	o_seg0;
wire	[6:0]	o_seg1;
wire	[6:0]	o_seg2;
wire	[6:0]	o_seg3;
wire	[6:0]	o_seg4;
wire	[6:0]	o_seg5;

fnd_dec	u_fnd_dec0(	.o_seg(o_seg0),
			.i_num(o_data[3:0])	);

fnd_dec	u_fnd_dec1(	.o_seg(o_seg1),
			.i_num(o_data[7:4])	);

fnd_dec	u_fnd_dec2(	.o_seg(o_seg2),
			.i_num(o_data[11:8])	);

fnd_dec	u_fnd_dec3(	.o_seg(o_seg3),
			.i_num(o_data[15:12])	);

fnd_dec	u_fnd_dec4(	.o_seg(o_seg4),
			.i_num(o_data[19:16])	);

fnd_dec	u_fnd_dec5(	.o_seg(o_seg5),
			.i_num(o_data[23:20])	);

wire [41:0] i_six_digit_seg;
led_disp u_led_disp(
			.o_seg(o_seg),
			.o_seg_dp(o_seg_dp),
			.o_seg_enb(o_seg_enb),
			.i_six_digit_seg(i_six_digit_seg),
			.i_six_dp(o_seg),
			.clk(clk),
			.rst_n(rst_n));


endmodule
```
<!--stackedit_data:
eyJoaXN0b3J5IjpbMTYwNTg1NTk1NSwtMjAwNTUxMjc0OF19
-->