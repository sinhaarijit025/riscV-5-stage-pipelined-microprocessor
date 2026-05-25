module Main_Decoder(Op, RegWrite, Imm_src, ALU_src, MemWrite, Result_src, Branch, ALU_Op, Jump);
    input [6:0] Op;
    output RegWrite, ALU_src, Branch, MemWrite, Jump;
    output [1:0] Imm_src, Result_src, ALU_Op;

    
    assign RegWrite = (Op==7'b0000011 || Op==7'b0110011 || Op==7'b0010011 || Op==7'b1101111) ? 1'b1 : 1'b0;
    
    assign Imm_src = (Op==7'b0100011) ? 2'b01 : (Op==7'b1100011) ? 2'b10 : (Op==7'b1101111) ? 2'b11 : 2'b00;
    assign ALU_src = (Op==7'b0000011 || Op==7'b0100011 || Op==7'b0010011) ? 1'b1 : 1'b0;
    
    assign MemWrite = (Op==7'b0100011) ? 1'b1 : 1'b0;
    assign Result_src = (Op==7'b0000011) ? 2'b01 : (Op==7'b1101111) ? 2'b10 : 2'b00;
    assign Branch = (Op==7'b1100011) ? 1'b1 : 1'b0;
    
    assign ALU_Op = (Op==7'b0110011 || Op==7'b0010011) ? 2'b10 : (Op==7'b1100011) ? 2'b01 : 2'b00;
    assign Jump = (Op==7'b1101111);
endmodule