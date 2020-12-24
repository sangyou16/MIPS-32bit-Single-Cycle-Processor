module top_mips(clock,reset, out0, out1, out2, out3, out4, out5);
	input clock, reset;
	output [6:0] out0;
	output [6:0] out1;
	output [6:0] out2;
	output [6:0] out3;
	output [6:0] out4;
	output [6:0] out5;

    wire [7:0] start_PC;
    wire [31:0] result;
	 
	 wire[3:0] LED_result;
	 assign LED_result = result[3:0];
	 wire[3:0] LED_result2;
	 assign LED_result2 = result[7:4];
	 wire[3:0] LED_result3;
	 assign LED_result3 = result[11:8];
	 wire[3:0] LED_result4;
	 assign LED_result4 = result[15:12];

    wire [3:0] outPC_0;
    assign outPC_0 = start_PC[3:0];
    wire [3:0] outPC_1;
    assign outPC_1 = start_PC[7:4];

	  wire out_clock;
  // 50MHz -> 1Hz  divide
    clk_dll c(clock, reset, out_clock);

    // Main module
    main_mips m32(out_clock, reset, start_PC, result);

    // 7-segment decoder
    seg7 u0(outPC_0, out0);
    seg7 u1(outPC_1, out1);
    seg7 u2(LED_result, out2);
    seg7 u3(LED_result2, out3);
    seg7 u4(LED_result3, out4);
    seg7 u5(LED_result4, out5);

endmodule
