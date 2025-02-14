module instruction_memory(PC, inst);
input [31:0] PC;
output reg [31:0] inst;

reg [7:0] mem [99:0];

always@(PC)
begin
	mem[0] = 8'b00110100; //ori $8, $0, 11                  ; 2: ori $t0 $0 0x0000000B
	mem[1] = 8'b00001000;
	mem[2] = 8'b00000000;
	mem[3] = 8'b00001011;
	mem[4] = 8'b00110100;  //ori $9, $0, 8                   ; 3: ori $t1 $0 0x00000008
	mem[5] = 8'b00001001;
	mem[6] = 8'b00000000;
	mem[7] = 8'b00001000;
	mem[8] = 8'b00110100; //ori $10, $0, 53                 ; 4: ori $t2 $0 0x00000035
	mem[9] = 8'b00001010;
	mem[10] = 8'b00000000 ;
	mem[11] = 8'b00110101 ;
	mem[12] = 8'b00000000 ;// sll $17, $8, 2                  ; 6: sll $s1 $t0, 2
	mem[13] = 8'b00001000 ;
	mem[14] = 8'b10001000 ;
	mem[15] = 8'b10000000 ;
	mem[16] = 8'b00000010 ; // add $18, $17, $9                ; 7: add $s2 $s1, $t1
	mem[17] = 8'b00101001 ;
	mem[18] = 8'b10010000 ;
	mem[19] = 8'b00100000 ;
	mem[20] = 8'b00010001 ; //beq $10, $18, -8 [loop-0x00400014]; 8: beq $t2 $s2, loop
	mem[21] = 8'b01010010 ;
	mem[22] = 8'b00000000 ;
	mem[23] = 8'b00001100 ;
	mem[24] = 8'b10001110 ; //lw $11, 0($18)                  ; 9: lw $t3 0($s2)
	mem[25] = 8'b01001011 ;
	mem[26] = 8'b00000000 ;
	mem[27] = 8'b00000000 ;
	mem[28] = 8'b00100001 ; //addi $12, $11, 1                ; 10: addi $t4 $t3 1
	mem[29] = 8'b01101100 ;
	mem[30] = 8'b00000000 ;
	mem[31] = 8'b00000001 ;
	mem[32] = 8'b00001000 ; //j 0x00400024 [Exit]             ; 11: j    Exit
	mem[33] = 8'b00000000 ;
	mem[34] = 8'b00000000 ;
	mem[35] = 8'b00010000 ;
	mem[36] = 8'b00000000 ;
	mem[37] = 8'b00000001 ;
	mem[38] = 8'b00011110 ;
	mem[39] = 8'b11110000 ;
	mem[40] = 8'b00110100 ;
	mem[41] = 8'b00001000 ;
	mem[42] = 8'b00000000 ;
	mem[43] = 8'b00000000 ;
	mem[44] = 8'b00110100 ;
	mem[45] = 8'b00001000 ;
	mem[46] = 8'b00000000 ;
	mem[47] = 8'b00000000 ;
	mem[48] = 8'b00110100 ;
	mem[50] = 8'b00001000 ;
	mem[51] = 8'b00000000 ;
	mem[52] = 8'b00110100 ;
	mem[53] = 8'b00001000 ;
	mem[54] = 8'b00000000 ;
	mem[55] = 8'b00000000 ;
	mem[56] = 8'b00110100 ;
	mem[57] = 8'b00001000 ;
	mem[58] = 8'b00000000 ;
	mem[59] = 8'b00000000 ;
	mem[60] = 8'b00110100 ;
	mem[61] = 8'b00001000 ;
	mem[62] = 8'b00000000 ;
	mem[63] = 8'b00000000 ;
	mem[64] = 8'b00110100 ;
	mem[65] = 8'b00001000 ;
	mem[66] = 8'b00000000 ;
	mem[67] = 8'b00000000 ;
	mem[68] = 8'b00110100 ;
	mem[69] = 8'b00001000 ;
	mem[70] = 8'b00000000 ;
	mem[71] = 8'b00000000 ;
	mem[72] = 8'b00110100 ;
	mem[73] = 8'b00001000 ;
	mem[74] = 8'b00000000 ;
	mem[75] = 8'b00000000 ;
	mem[76] = 8'b00110100 ;
	mem[77] = 8'b00001000 ;
	mem[78] = 8'b00000000 ;
	mem[79] = 8'b00000000 ;
	mem[80] = 8'b00110100 ;
	mem[81] = 8'b00001000 ;
	mem[82] = 8'b00000000 ;
	mem[83] = 8'b00000000 ;
	mem[84] = 8'b00110100 ;
	mem[85] = 8'b00001000 ;
	mem[86] = 8'b00000000 ;
	mem[87] = 8'b00000000 ;
	mem[88] = 8'b00110100 ;
	mem[89] = 8'b00001000 ;
	mem[90] = 8'b00000000 ;
	mem[91] = 8'b00000000 ;
	mem[92] = 8'b00110100 ;
	mem[93] = 8'b00001000 ;
	mem[94] = 8'b00000000 ;
	mem[95] = 8'b00000000 ;
	mem[96] = 8'b00110100 ;
	mem[97] = 8'b00001000 ;
	mem[98] = 8'b00000000 ;
	mem[99] = 8'b00000000 ;
end
 always @(PC) 
 begin
		inst = {mem[PC], mem[PC+ 32'd1], mem[PC+32'd2], mem[PC+ 32'd3]};
 end

endmodule
