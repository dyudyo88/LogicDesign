# Lab 09
## 실습 내용
### **리모컨 송신 신호**
#### **Top Module** : 리모컨 적외선 송신을 통하여 LED display에 고유값을 나타내기

 ```verilog 
//Sequential Rx Bits 
wire ir_rx ;
assign ir_rx = ~i_ir_rxb;

reg [1:0] seq_rx ; 
always @(posedge clk_1M or negedge rst_n) begin 
	if(rst_n == 1'b0) begin 
		seq_rx <= 2'b00;
	end else begin
		seq_rx <= {seq_rx[0], ir_rx};
	end 
end
 ```


<!--stackedit_data:
eyJoaXN0b3J5IjpbLTIwMDU1MTI3NDhdfQ==
-->