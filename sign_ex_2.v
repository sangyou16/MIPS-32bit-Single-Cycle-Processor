module sign_ex2(in, out);

    input [25:0] in;
    output [31:0] out;
	 
   assign out = {{26{in[25]}}, in};


endmodule
