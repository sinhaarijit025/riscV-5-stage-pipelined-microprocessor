`timescale 1ns / 1ps

module Pipelined_Tb();
    
    reg clk = 1'b1, rst;
    
    riscv_pipelined_top_module dut(
        .clk(clk),
        .reset(rst) 
    );
    
    initial begin
        $dumpfile("wave_final.vcd");
        $dumpvars(0);
    end
    
    
    always begin
        clk = ~clk;
        #5;
    end
    
    initial begin
        rst = 1'b1;   
        #20;          
        
        rst = 1'b0;    
        #200;    
        
        $finish;
    end
    
endmodule
