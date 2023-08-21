module pcCycle (
    input clk,
    output reg [31:0] ins
);
    wire [31:0] nextpc, currentpc;

    pc program_counter(clk, nextpc, currentpc);
    instructionMemory insm(currentpc, ins);
    adder pc_add(currentpc, 4, nextpc);

endmodule