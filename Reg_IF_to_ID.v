module Reg_IF_to_ID(clk,rst,clr,Instr_F,PC_F,PC_plus4_F,Instr_D,PC_D,PC_plus4_D,Stall_D);
    input clk,rst,clr;
    input [31:0] Instr_F,PC_F,PC_plus4_F;
    output reg [31:0] Instr_D,PC_D,PC_plus4_D;
    input Stall_D;
    always@(posedge clk or posedge rst) begin
        if(rst) begin
            Instr_D<=32'b0;
            PC_D<=32'b0;
            PC_plus4_D<=32'b0;
        end 
        else if(clr) begin
            Instr_D<=32'h00000013;//special
            PC_D<=32'b0;
            PC_plus4_D<=32'b0;
        end
        else if(~Stall_D) begin
            Instr_D<=Instr_F;
            PC_D<=PC_F;
            PC_plus4_D<=PC_plus4_F;
        end
    end
endmodule