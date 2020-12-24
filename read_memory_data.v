module read_memory_data(address, writedata, MemRead, MemWrite, data,clk);

input [31:0] address, writedata;
input clk;
input MemRead, MemWrite;
integer i;
output reg[31:0] data;
reg [31:0] register_memory [0:63]; //32bits 

    initial begin
	for (i = 0; i < 64; i = i + 1)
	    $readmemb("memory.mem", register_memory);		 			
    end


	 always @(posedge clk)
	 if(MemWrite)
	 begin
	 register_memory[address] = writedata[31:24];
	 register_memory[address + 1] = writedata[23:16];
	 register_memory[address + 2] = writedata[15:8];
	 register_memory[address + 3] = writedata[7:0];
	 end
	 
	 always@(*) begin
	 if(MemRead == 1)
	data = register_memory[address];
	 else
	 data = 0;
	 end
	 
endmodule
	 