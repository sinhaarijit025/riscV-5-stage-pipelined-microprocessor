module Reg_Ex_to_Mem (clk, rst, RegWrite_E, RegWrite_M, Result_src_E, Result_src_M, MemWrite_E, MemWrite_M, ALU_result_E, ALU_result_M, WriteData_E, WriteData_M, PC_plus4_E, PC_plus4_M, RD_E, RD_M);
    
    input clk, rst;
    
    // Control in signals from the execute stage
    input RegWrite_E, MemWrite_E;
    input [1:0] Result_src_E;
    
    // Data in from the execute stage
    input [31:0] ALU_result_E, WriteData_E, PC_plus4_E;
    
    // For hazard unit
    input [4:0] RD_E;
   
    output reg RegWrite_M, MemWrite_M;
    output reg [1:0] Result_src_M;
    // ==========================================
    
    // Data out to mem
    output reg [31:0] ALU_result_M, WriteData_M, PC_plus4_M;
    
    // Reg add out for hazard control
    output reg [4:0] RD_M;

    always @(posedge clk or posedge rst) begin
        if(rst) begin
            RegWrite_M   <= 1'b0;
            Result_src_M <= 2'b00;
            MemWrite_M   <= 1'b0;
            ALU_result_M <= 32'b0;
            WriteData_M  <= 32'b0;
            PC_plus4_M   <= 32'b0;
            RD_M         <= 5'b0;
        end
        else begin
            RegWrite_M   <= RegWrite_E;
            Result_src_M <= Result_src_E;
            MemWrite_M   <= MemWrite_E;
            ALU_result_M <= ALU_result_E;
            WriteData_M  <= WriteData_E;
            PC_plus4_M   <= PC_plus4_E;
            RD_M         <= RD_E;
        end
    end
    
endmodule