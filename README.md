# 32-bit RISC-V 5-Stage Pipelined Processor

##  Project Overview
This repository contains a fully functional, from-scratch Verilog implementation of a 32-bit RISC-V microprocessor based on the RV32I base integer instruction set. Evolving from a foundational single-cycle design, this processor features a classic 5-stage pipelined architecture (Fetch, Decode, Execute, Memory, Writeback) optimized for high instruction throughput. 

The core achievement of this project is the custom-engineered **Hazard Unit**, which dynamically resolves data and control hazards to maintain pipeline efficiency and program correctness.

##  Key Features & Capabilities

* **5-Stage Pipelined Datapath:** Dedicated pipeline registers (`IF/ID`, `ID/EX`, `EX/MEM`, `MEM/WB`) isolate instruction stages and maximize clock frequency.
* **Advanced Hazard Management Unit:** * **Data Forwarding (Bypass Network):** Dynamically detects Read-After-Write (RAW) data hazards and routes fresh data directly from the Memory or Writeback stages to the Execute stage ALU, eliminating unnecessary stalls.
  * **Load-Use Stalling:** Detects memory read dependencies and automatically stalls the Fetch and Decode stages for one cycle while injecting a pipeline bubble (NOP) into the Execute stage.
  * **Control Hazard Flushing:** Implements a "Predict Not-Taken" branch strategy. Upon a taken branch or jump resolution in the Execute stage, the processor dynamically flushes the `IF/ID` and `ID/EX` pipeline registers to discard "ghost" instructions (2-cycle penalty).
* **Comprehensive Instruction Support:** Executes standard RISC-V formats including:
  * **R-Type:** Arithmetic and logic (`add`, `sub`, `and`, `or`, etc.)
  * **I-Type:** Immediates and loads (`addi`, `lw`)
  * **S-Type:** Stores (`sw`)
  * **B-Type:** Branches (`beq`)
  * **J-Type:** Jumps (`jal`)

## 🛠️ Technical Stack & Tools
* **Hardware Description Language:** Verilog (IEEE 1364)
* **Compiler & Simulator:** Icarus Verilog (`iverilog`, `vvp`)
* **Waveform Analysis:** GTKWave

##  Architecture Highlights
The design heavily utilizes structural Verilog to explicitly route hardware wires and multiplexers. The Hazard Unit acts as a localized controller, intercepting ALU source operands using multiplexers (`MUX3_to_1`) based on real-time dependency checks against the destination registers of older instructions currently flowing through the back half of the pipeline.

