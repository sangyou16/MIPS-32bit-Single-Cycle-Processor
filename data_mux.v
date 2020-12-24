module data_mux(rddata_address, input2, control_input, address_output);

    input control_input;
    input [31:0] rddata_address;
	 input [31:0] input2;
    output reg [31:0] address_output;

    always @(*) begin
	if (control_input == 0)
	    address_output = rddata_address;
	else
	    address_output = input2;
    end

endmodule
