module Reg_Mem_to_WB(clk,rst,RegWrite_M,RegWrite_W,Result_src_M,Result_src_W,ALU_result_M,ALU_result_W,ReadData_M,ReadData_W,PC_plus4_M,PC_plus4_W,RD_M,RD_W);
    input clk,rst;
    //control signals from the mem stage
    input RegWrite_M;
    input [1:0] Result_src_M;
    //data in from the mem stage
    input [31:0] ALU_result_M,ReadData_M,PC_plus4_M;
    // for forwarding unit
    input [4:0] RD_M;
    //control signals out
    output reg [31:0] ALU_result_W,ReadData_W,PC_plus4_W;
    //to reg file
    output reg [4:0] RD_W;
    output reg RegWrite_W;
    output reg [1:0] Result_src_W;
    always @(posedge clk or posedge rst) begin
        if(rst) begin
            RegWrite_W<=1'b0;
            Result_src_W<=2'b00;
            ALU_result_W<=32'b0;
            ReadData_W<=32'b0;
            PC_plus4_W<=32'b0;
            RD_W<=5'b0;
        end
        else begin
            RegWrite_W<=RegWrite_M;
            Result_src_W<=Result_src_M;
            ALU_result_W<=ALU_result_M;
            ReadData_W<=ReadData_M;
            PC_plus4_W<=PC_plus4_M;
            RD_W<=RD_M;
        end
    end
    
endmodule