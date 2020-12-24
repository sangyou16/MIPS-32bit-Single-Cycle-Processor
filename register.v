module register(RegWrite_control, Read_register1, Read_register2, Write_reg, Write_data, Read_data1, Read_data2
						,clk, reset);

input clk, reset;
input RegWrite_control;
input [4:0] Read_register1, Read_register2;
input [4:0] Write_reg;
input [31:0] Write_data;
output reg [31:0] Read_data1, Read_data2;
reg [31:0] Reg_mem [31:0];
	
always @(posedge clk) begin
	if (RegWrite_control == 1)
		Reg_mem[Write_reg] <= Write_data;
end
	
always@(*) begin
	if(Read_register1 == 0)
Read_data1 = 0;
else 
Read_data1 = Reg_mem[Read_register1];
end
	
always@(*) begin
	if(Read_register2 == 0)
Read_data2 = 0;
else 
Read_data2 = Reg_mem[Read_register2];
end


endmodule
