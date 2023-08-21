module cpu (input clk);
    wire [31:0] pc_add_out, currentpc, ins, data_mux_out, readData1, readData2, immediate;
    wire [31:0] shifted, shift_add_out, reg_mux_out, alu_out, data_out, nextpc;
    wire branch, memRead, memToReg, memWrite, aluSrc, regWrite, zero, pc_mux_sig;
    wire [1:0] aluOp;
    wire [3:0] alu_control_out;

    pc program_counter(clk, nextpc, currentpc);
    instructionMemory insmemory(currentpc, ins);
    adder pc_add(currentpc, 4, pc_add_out);
    mainControl mcontrol(ins[6:0], branch, memRead, memToReg, memWrite, aluSrc, regWrite, aluOp);
    registerfile r1(ins[19:15], ins[24:20], ins[11:7], data_mux_out, clk, regWrite,
                           readData1, readData2);
    immgen imm(ins, immediate);
    shift sh(immediate, shifted);
    adder shift_add(currentpc, shifted, shift_add_out);
    mux reg_mux(readData2, immediate, aluSrc, reg_mux_out);
    aluControl acontrol(aluOp, {ins[30], ins[14:12]}, alu_control_out);
    alu a1(readData1, reg_mux_out, alu_control_out, alu_out, zero);
    assign pc_mux_sig = branch & zero;
    mux pc_mux(pc_add_out, shift_add_out, pc_mux_sig, nextpc);
    dataMemory dmemory(alu_out, readData2, memWrite, memRead, data_out);
    mux data_mux(alu_out, data_out, memToReg, data_mux_out);
endmodule