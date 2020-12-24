module main_mips(in_clock, reset, mips_PC, mips_result);
	input in_clock, reset;
	
	 wire RegWrite;
	 wire RegDst;
	 wire ALUSrc;
	 wire Branch;
	 wire MemWrite;
	 wire MemRead;
	 wire MemtoReg;
	 wire Jump;

    output [31:0] mips_PC, mips_result;
	 
	 reg [31:0] mips_PC, mips_result;
    wire [3:0] alucontrol;
	 wire [31:0] newpc;
	 assign PC_iformat = (Branch && iszero);
		always @(posedge in_clock or negedge reset)
			begin
				if (!reset)
					PC <= 0;
				else if (Jump)
					PC = (jump_target << 2);
				else if (PC_iformat)
					PC = PC + 4 + sign_ext;
					else 
					PC <= PC + 4;
					end	


    wire [31:0] inst; //instruction
    wire [5:0] opcode; 
	 assign opcode = inst[31:26];
	 wire [4:0] Read_register1; // r-format
	 assign Read_register1 = inst[25:21];  //first source
	 wire [4:0]Read_register2;
	 assign Read_register2 = inst[20:16];  // second source
	 wire [4:0] Write_reg;  
	 assign Write_reg = inst[15:11];  // destination
    wire [10:6] shift;  // shift amount
	 assign shift= inst[10:6];
    wire [5:0] func; // function code(extends opcode)
    assign func = inst[5:0];
    wire [15:0] immediate;  // i-format  
	 assign immediate = inst[15:0]; 	 
    wire [31:0] jump_target; //j-format
	 wire [25:0] pre_address;
	 assign pre_address = inst[25:0];	
	 instruction_memory inst_memory(PC,inst); //instruction memory

    wire [1:0] ALUOp; 
    alu_control alu_contu(opcode, RegWrite, RegDst, ALUSrc, Branch, MemWrite, MemRead, MemtoReg, ALUOp, Jump); //control
	 
	 
	 wire [4:0] w_reg;  // destination
    reg_mux mux_2_WriteReg(Read_register2, Write_reg, RegDst, w_reg);
	 wire [31:0] Write_data;  // reg input
    wire [31:0] Read_data1, Read_data2;  //reg output
	 
    register regi(RegWrite, Read_register1, Read_register2, w_reg, Write_data, Read_data1, Read_data2,in_clock, reset);
	
    wire [31:0] sign_ext; //sign-extend i format
	 sign_ex extend_immediate(immediate, sign_ext);
	  
	  
    aludec alu_control(func, ALUOp, alucontrol); 	 // ALU control
    data_mux mux_2_alu(Read_data2, sign_ext,ALUSrc, b_input); 	  // ALU MUX
    alu_mips alu_output(Read_data1, b_input, alucontrol, shift, outalu, iszero);   // ALU calc
	 
    wire [31:0] b_input;
    wire [31:0] outalu;
    wire iszero; //checking zero
	 reg [31:0] PC = 0;
	 
    wire [31:0] Datafrom_mem;
    read_memory_data mem_data(outalu, sign_ext, MemRead, MemWrite, Datafrom_mem,in_clock);


    data_mux mux_2_WriteData(outalu, Datafrom_mem, MemtoReg, Write_data);// MUX for write data

    sign_ex2 extend_jump(pre_address, jump_target); //Sign extension for jump address (make 28bits for jump)


always @(posedge in_clock or negedge reset)
begin
  mips_PC <= PC;	
  mips_result <= outalu;
end
endmodule
	 
