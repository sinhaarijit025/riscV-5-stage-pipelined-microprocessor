module Reg_ID_to_EX(clk,rst,clr,RegWrite_D,RegWrite_E,Result_src_D,Result_src_E,MemWrite_D,MemWrite_E,Jump_D,Jump_E,Branch_D,Branch_E,ALU_control_D,ALU_control_E,ALU_src_D,ALU_src_E,RD1_D,RD1_E,RD2_D,RD2_E,PC_D,PC_E,Imm_Ext_D,Imm_Ext_E,PC_plus4_D,PC_plus4_E,RS1_D,RS1_E,RS2_D,RS2_E,RD_D,RD_E,Flush_E);
    input clk,rst,clr;
    //control signals from the decode stage
    input RegWrite_D;
    input [1:0] Result_src_D;
    input MemWrite_D;
    input Jump_D;
    input Branch_D;
    input [2:0] ALU_control_D;
    input ALU_src_D;
    // data in from the decode stage
    input [31:0] RD1_D,RD2_D,PC_D,Imm_Ext_D,PC_plus4_D;
    //reg address for hazard unit
    input [4:0] RS1_D,RS2_D,RD_D;
    //control signals out to execute stage
    output reg RegWrite_E;
    output reg [1:0] Result_src_E;
    output reg MemWrite_E;
    output reg Jump_E;
    output reg Branch_E;
    output reg [2:0] ALU_control_E;
    output reg ALU_src_E;
    //data out to execute stage
    output reg [31:0] RD1_E,RD2_E,PC_E,Imm_Ext_E,PC_plus4_E;
    //reg add for hazard unit
    output reg [4:0] RS1_E,RS2_E,RD_E;
    input Flush_E;

    always @(posedge clk or posedge rst) begin
        if(rst || clr ||Flush_E) begin
            RegWrite_E<=1'b0;
            Result_src_E<=2'b00;
            MemWrite_E<=1'b0;
            Jump_E<=1'b0;
            Branch_E<=1'b0;
            ALU_control_E<=3'b000;
            ALU_src_E<=1'b0;
            //aslo we have to clear the data and addresses
            RD1_E<=32'b0;
            RD2_E<=32'b0;
            PC_E<=32'b0;
            Imm_Ext_E<=32'b0;
            PC_plus4_E<=32'b0;
            RS1_E<=5'b0;
            RS2_E<=5'b0;
            RD_E<=5'b0;
        end
        else begin
            RegWrite_E<=RegWrite_D;
            Result_src_E<=Result_src_D;
            MemWrite_E<=MemWrite_D;
            Jump_E<=Jump_D;
            Branch_E<=Branch_D;
            ALU_control_E<=ALU_control_D;
            ALU_src_E<=ALU_src_D;
            //pass data to ex
            RD1_E<=RD1_D;
            RD2_E<=RD2_D;
            PC_E<=PC_D;
            Imm_Ext_E<=Imm_Ext_D;
            PC_plus4_E<=PC_plus4_D;

            //pass reg addresses to ex
            RS1_E<=RS1_D;
            RS2_E<=RS2_D;
            RD_E<=RD_D;

        end
    end
endmodule