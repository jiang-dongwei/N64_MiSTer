// EXP23: video-locked 2x clock for the external encoder subcarrier DDS.
//
// The PLL is referenced from clk_vid, so its output follows NTSC/PAL video
// clock changes while retaining a deterministic frequency relationship.
// 48.68 MHz -> 97.36 MHz for the initial NTSC mode.
module pll_subcarrier_2x
(
	input  wire refclk,
	input  wire rst,
	output wire outclk_0,
	output wire locked
);

	altera_pll
	#(
		.reference_clock_frequency("48.680000 MHz"),
		.operation_mode("direct"),
		.number_of_clocks(1),
		.output_clock_frequency0("97.360000 MHz"),
		.phase_shift0("0 ps"),
		.duty_cycle0(50),
		.pll_type("General"),
		.pll_subtype("General")
	)
	altera_pll_i
	(
		.rst(rst),
		.outclk({outclk_0}),
		.locked(locked),
		.fboutclk(),
		.fbclk(1'b0),
		.refclk(refclk)
	);

endmodule
