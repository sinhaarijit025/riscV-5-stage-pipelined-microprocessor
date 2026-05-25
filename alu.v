module ALU(A,B,ALU_control,ALU_result,zero,OverFlow,Carry,Negative);
    input [31:0] A,B;
    input [2:0] ALU_control;
    output Carry,OverFlow,zero,Negative;
    output [31:0] ALU_result;
    wire cout;
    wire [31:0] sum;
    assign {cout,sum}=(ALU_control[0]==1'b0) ? A+B : (A+(~B)+1);
    assign ALU_result=(ALU_control==3'b000)? sum : (ALU_control==3'b001) ? sum: (ALU_control==3'b010) ? A & B :(ALU_control==3'b011) ?A|B:(ALU_control==3'b101) ? {{31{1'b0}},(sum[31])}: {32{1'b0}};
    assign OverFlow=((sum[31] ^ A[31]) & (~(ALU_control[0] ^ B[31] ^ A[31])) & (~ALU_control[1]));
    assign Carry=((~ALU_control[1]) & cout);
    assign zero= &(~ALU_result);
    assign Negative=ALU_result[31];
endmodule