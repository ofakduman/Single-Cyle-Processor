# Final Project Documentation - Single Cycle Processor Design - MiniMIPS

## Overview

In this project, we aim to design a small version of the MIPS processor called MiniMIPS. This processor uses a single-cycle design and the codebase consists mainly of structural or dataflow Verilog. There are seven main components: Instruction memory, Control unit, Registers, Data memory, ALU, PC, and some additional components like adders, multiplexers, and sign extenders. The MiniMIPS uses 16-bit wide instructions and has 8 registers, each holding 32-bit numbers.

## Instruction Set

The MiniMIPS features two types of instructions: R’-type and I’-type. The instruction types are structured as follows:

R’-type: `Op (4bits) Rs (3bits) Rt (3bits) Rd(3bits) Func(3bits)`

I’-type: `Op (4bits) Rs (3bits) Rt (3bits) Imm (10bits)`

The following instructions are supported:

- AND
- ADD
- SUB
- XOR
- NOR
- OR
- ADDI
- ANDI
- ORI
- NORI
- BEQ
- BNE
- SLTI
- LW
- SW

## Components

### Control Unit

The control unit deciphers the instruction opcode and controls the ALU operations and other component behaviors based on this deciphered opcode. Our design has been enhanced by muxing the instruction's last 3 bits with the RegDst signal to determine if the operation is an R-type operation and control the AluOp signals from the control unit itself, eliminating the need for a separate ALU control.

### ALU

The Arithmetic Logic Unit performs arithmetic and logic operations as determined by the control unit.

### Registers

There are 8 registers each holding 32-bit numbers.

### Instruction Memory

Instruction Memory holds the instructions to be processed.

### Data Memory

Data Memory holds the data to be processed.

## Design & Testing

The design process involved drafting each component and their connections, followed by writing testbenches for each component to identify and rectify problems. While the MiniMIPS single cycle processor is operational, there was a challenge when proceeding with 'lw' instructions as the correct result wasn't accessible at the end of 1 clock. This problem, suspected to be a clock design issue, was handled by repeating instruction processing.

The testing procedure includes writing a testbench module for each component and presenting the testbench results. For the MiniMIPS part, it is required to try at least two different numbers for all operations.

## Conclusion

While there are areas for improvement in clock design, the MiniMIPS single cycle processor offers a simplified model for understanding processor operations and design. Further enhancements can be made to this model by expanding the instruction set, adding more components, or transitioning to a multi-cycle design.
