module Hazard_Unit(RS1_E, RS2_E, RD_E, RD_M, RD_W, RS1_D, RS2_D, RegWrite_M, RegWrite_W, Result_src_E, ForwardA_E, ForwardB_E, Stall_F, Stall_D, Flush_E);
    
    // FIXED: Added RD_E to inputs
    input [4:0] RS1_E, RS2_E, RD_E, RD_M, RD_W;
    input RegWrite_M, RegWrite_W;
    
    output reg [1:0] ForwardA_E, ForwardB_E;
    output reg Stall_F, Stall_D, Flush_E; 
    
    // FIXED: Added missing semicolon
    input [1:0] Result_src_E; 
    input [4:0] RS1_D, RS2_D;
    
    always @(*) begin
        // ----------------------------------------------------
        // Forward A logic (Checking RS1)
        // ----------------------------------------------------
        if (((RS1_E == RD_M) & RegWrite_M) & (RS1_E != 0)) begin
            ForwardA_E = 2'b10;
        end
        else if (((RS1_E == RD_W) & RegWrite_W) & (RS1_E != 0)) begin
            ForwardA_E = 2'b01;
        end
        else begin
            ForwardA_E = 2'b00;
        end

        // ----------------------------------------------------
        // Forward B logic (Checking RS2)
        // ----------------------------------------------------
        if (((RS2_E == RD_M) & RegWrite_M) & (RS2_E != 0)) begin 
            ForwardB_E = 2'b10;
        end
        else if (((RS2_E == RD_W) & RegWrite_W) & (RS2_E != 0)) begin
            ForwardB_E = 2'b01;
        end
        else begin
            ForwardB_E = 2'b00;
        end
    end
    
    wire lwStall;
    // Now RD_E is properly declared and can be used here!
    assign lwStall = (Result_src_E == 2'b01) && ((RS1_D == RD_E) || (RS2_D == RD_E)) && (RD_E != 0);

    always @(*) begin
        Stall_F = lwStall;
        Stall_D = lwStall;
        Flush_E = lwStall;
    end
    
endmodule