//loads a selected word of memory from the SRAM an stores it in a selected register
//$t = MEM[$s + offset]; advance_pc (4);
//syntax: $t, offset($s)
module loadWord();

endmodule

//stores a word from a selected register into a spot in the SRAM
//MEM[$s + offset] = $t; advance_pc (4);
//syntax: sw $t, offset($s)
module storeWord();

endmodule

//jump to target address
//PC = nPC; nPC = (PC & 0xf0000000) | (target << 2);
//syntax: j target
module jump(nextAddr,currentAddr,jumpAddr, pc, jump);
	output reg [31:0] nextAddr;
	input[31:0] currentAddr;
	input[25:0] jumpAddr;
	input[31:0] pc;
	input jump;
	//wire[31:0] pcPlus4;
	
	//assign pcPlus4 = pc+4;
	
	always@(*)
	if(jump) nextAddr = {pc[31:28], currentAddr ,0}; 
endmodule 

//jump to an address specified register s
//PC = nPC; nPC = $s;
//syntax: jr $s
module jumpRegister(nextAddr,s,jr);
	output reg [31:0] nextAddr;
	input[4:0] s;
	reg [31:0]tempnextAddr;
	input jr;
	//decoder in registerfile
	decoder d1(tempnextAddr,s);
	
	always@(*)
	if(jr) nextAddr =  tempnextAddr;

endmodule 

//branches if the provided value s is greater than t by the specified offset
//if $s > $t advance_pc (offset << 2)); else advance_pc (4);
//syntax: bgt $s, $t, offset
module branchGreaterThan();

endmodule
