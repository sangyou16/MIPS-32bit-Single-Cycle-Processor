module reg_mux(inst_address1, inst_address2, RegDst_input, address_output);


input [4:0] inst_address1;
input [4:0] inst_address2;
input RegDst_input;
output reg [4:0] address_output;

always @(*) begin
if (RegDst_input == 0)
   address_output = inst_address1;
else
  address_output = inst_address2;
end

endmodule
