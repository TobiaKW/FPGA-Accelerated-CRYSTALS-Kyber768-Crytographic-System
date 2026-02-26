`timescale 1ns / 1ps

module hash_core_Server_tb();

// Clock and reset
reg clk, rst;

// Control signals
reg keccak_init;
reg extend;
reg patt_bit;
reg eta3_bit;
reg [1:0] absorb_ctr_r1;
reg [2:0] keccak_ctr;

// Input FIFO signals
reg ififo_wen;
reg [31:0] ififo_din;
reg ififo_absorb;
reg [1:0] ififo_mode;
reg ififo_last;

// Output FIFO signals
reg ofifo_ena;
reg ofifo0_req;
reg ofifo1_req;

// Outputs from DUT
wire ififo_empty;
wire keccak_ready;
wire keccak_squeeze;
wire [31:0] keccak_dout;
wire [23:0] ofifo0_dout;
wire [24:0] ofifo1_dout;
wire ofifo0_full, ofifo1_full;
wire ofifo0_empty, ofifo1_empty;
wire [5:0] squeeze_ctr;
wire [7:0] fifo_GENA_ctr;

// Clock generation: 100MHz (10ns period)
always #5 clk = ~clk;

// DUT instantiation
hash_core_Server DUT (	//enable control of input and output
	.clk(clk),
	.rst(rst),
	.keccak_init(keccak_init),
	.extend(extend),
	.patt_bit(patt_bit),
	.eta3_bit(eta3_bit),
	.absorb_ctr_r1(absorb_ctr_r1),
	.keccak_ctr(keccak_ctr),
	.ififo_wen(ififo_wen),
	.ififo_din(ififo_din),
	.ififo_absorb(ififo_absorb),
	.ififo_mode(ififo_mode),
	.ififo_last(ififo_last),
	.ififo_empty(ififo_empty),
	.keccak_ready(keccak_ready),
	.keccak_squeeze(keccak_squeeze),
	.keccak_dout(keccak_dout),
	.ofifo_ena(ofifo_ena),
	.ofifo0_req(ofifo0_req),
	.ofifo1_req(ofifo1_req),
	.ofifo0_dout(ofifo0_dout),
	.ofifo1_dout(ofifo1_dout),
	.ofifo0_full(ofifo0_full),
	.ofifo1_full(ofifo1_full),
	.ofifo0_empty(ofifo0_empty),
	.ofifo1_empty(ofifo1_empty),
	.squeeze_ctr(squeeze_ctr),
	.fifo_GENA_ctr(fifo_GENA_ctr)
);

// Initialization
initial begin
	clk = 0;
	rst = 0;
	keccak_init = 0;
	extend = 0;
	patt_bit = 0;
	eta3_bit = 0;
	absorb_ctr_r1 = 2'h0;
	keccak_ctr = 3'h0;
	ififo_wen = 0;
	ififo_din = 32'h0;
	ififo_absorb = 0;
	ififo_mode = 2'h0;
	ififo_last = 0;
	ofifo_ena = 0;
	ofifo0_req = 0;
	ofifo1_req = 0;

	// Phase 1: Reset & clk
	// TODO
	always #5 clk = ~clk;

	#10 rst = 1; //trigger initialization of all registers
	#20 rst = 0;

	// Phase 2: Init Keccak
	// TODO
	#10 keccak_init = 1;
	#20 keccak_init = 0;
	d = 256'h 2D7F7336_9973CD2D_0348B1CC_251AD82F_DD1A6BDB_E4106D0C_AA9476B0_A035997C;
	// Phase 3: Feed input data
	// TODO

	// Phase 4: Wait for keccak_ready
	// TODO

	// Phase 5: Enable output and read
	// TODO

	$finish;
end

endmodule
