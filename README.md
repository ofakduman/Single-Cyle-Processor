# Single Cycle Processor Design: MiniMIPS

This project revolves around the implementation of a single cycle processor using a minimalistic version of the MIPS architecture, referred to as MiniMIPS. The main components involved in this design include the Instruction memory, Control unit, Registers, Data memory, Arithmetic Logic Unit (ALU), Program Counter (PC), along with several other components such as adders, multiplexers, sign extenders etc.

## How it works

In designing this single cycle processor, every component was initially diagrammed and implemented. After this, testbenches were written to identify any issues. Once problems were discovered, the components were retested until the overall functionality was deemed satisfactory.

1. **Control Unit**: The control unit manages the flow of data within the processor, regulating the functioning of other components based on the instruction opcode. The control unit outputs AluOp signals and a RegDst signal to determine if it is an R-type instruction. These signals are muxed with the last 3 bits of the instruction, eliminating the need for an ALU control and thereby simplifying the design.

2. **ALU**: The Arithmetic Logic Unit performs a variety of arithmetic and logic operations as determined by the control unit's AluOp signals.

3. **Registers**: The register file stores data that can be accessed and manipulated during the execution of instructions.

4. **Instruction Memory**: The instruction memory stores the instructions to be executed by the processor.

5. **Data Memory**: The data memory stores the data required for the execution of instructions.

One point of consideration is that for the 'lw' instructions, the correct result isn't obtained at the end of 1 clock cycle. This seems to be related to the clock design, but it was addressed by repeating the instruction processing.

Below is a schematic breakdown of the main components and their connections:

```
control_unit:main_control_unit
    opcode[3..0]
    RegDst
    Branch
    Bneq
    MemRead
    MemtoReg
    AluOp2
    AluOp1
    AluOp0
    MemWrite
    AluSrc
    RegWrite Slti

alu32:Alu
    Aluop2
    Aluop1
    Aluop0
    a[31..0] b[31..0]
    Zero0
    res[31..0]

mips_memory:memory
    signal_mem_write
    signal_mem_read
    clk
    write_data_address[31..0] write_data[31..0]
    read_mem[31..0] 

mips_registers:Registers
    signal_reg_write
    clk
    write_data[31..0]
    read_reg_1[2..0]
    read_reg_2[2..0]
    write_reg[2..0]
    read_data_1[31..0]
    read_data_2[31..0]

instruction_memory:instr_memory
    clock
    readAddress[31..0]
    instruction[15..0]

program_counter:pc
    clk
    in[31..0]
    out[31..0]

sign_extend_6to32:sign_extend_imm_32
    imm[5..0] Ext[31..0]
    clk2
    result[31..0]

Additional components include several 2:1 multiplexers, adders, and sign extenders.
```

## Project Creator

Ömer F. Akduman
1801042094

## Final Remarks

The final implementation of the MiniMIPS single cycle processor is functional with a minor consideration for the 'lw' instructions. The design and testing methodology allowed for a systematic approach to problem-solving, contributing to the successful completion of the project.
