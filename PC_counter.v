module PC_counter(clk, rst, Stall_F, PC, PC_Next); 
    
    // The inputs MUST exactly match what the top module asks for
    input clk, rst, Stall_F;
    input [31:0] PC_Next;
    output reg [31:0] PC;
    
    always @(posedge clk) begin
        if (rst) 
            PC <= 32'b0;
        else if (~Stall_F) // Only update if NOT stalled
            PC <= PC_Next;
    end
    
endmodule