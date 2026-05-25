module Control_Unit_Top(Op, RegWrite, Imm_src, ALU_src, MemWrite, Result_src, Branch, funct3, funct7, ALU_control, Jump);
    
    input [6:0] Op, funct7;
    input [2:0] funct3;
    output RegWrite, ALU_src, MemWrite, Branch;
    output [1:0] Result_src;
    output [1:0] Imm_src;
    output [2:0] ALU_control;
    output Jump;
    
    wire [1:0] ALU_Op; 

    // Main Decoder
    Main_Decoder alu1(
        .Op(Op),
        .RegWrite(RegWrite),
        .Imm_src(Imm_src),       
        .MemWrite(MemWrite),
        .Result_src(Result_src), 
        .Branch(Branch),
        .ALU_src(ALU_src),       
        .ALU_Op(ALU_Op),         
        .Jump(Jump)
    );

    // ALU Decoder
    ALU_Decoder alu2(
        .ALUOp(ALU_Op),         
        .funct3(funct3),
        .funct7(funct7),
        .op(Op),                
        .ALUControl(ALU_control)
    );
    
endmodule