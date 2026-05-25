`timescale 1ns / 1ps

module Pipelined_Tb();
    
    // Initialize clock to 1 directly, matching your style
    reg clk = 1'b1, rst;
    
    // Instantiate your pipelined top module
    riscv_pipelined_top_module dut(
        .clk(clk),
        .reset(rst) 
    );
    
    // VCD Dump block
    initial begin
        $dumpfile("wave_3.vcd");
        $dumpvars(0);
    end
    
    
    always begin
        clk = ~clk;
        #5;
    end
    
    // Simulation control block
    initial begin
        rst = 1'b1;   
        #20;          
        
        rst = 1'b0;    
        #200;    
        
        $finish;
    end
    
endmodule