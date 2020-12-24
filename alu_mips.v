module alu_mips(a, b, control, shift, outalu, zero);
input [31:0] a, b;
input [3:0] control;
input [4:0] shift;
output reg [31:0] outalu;
output zero;

always @(control, a, b, shift) 
begin
	case(control)
		4'b0000: outalu = a&b;
		4'b0001: outalu = a|b;
		4'b0010: outalu = a+b;
		4'b0110: outalu = a-b;
		4'b0111: outalu = b << shift;
		4'b1001: outalu = a ^ b;
		4'b1010: outalu = ~(a|b);
			default: outalu = 0;
		endcase
end

assign zero = outalu==0?1:0;

endmodule
