module instructionMemory (
    input reg [31:0] address,
    output reg [31:0] instruction
);
    reg [7:0] mem[127:0];
    reg [6:0] n;
    initial begin
        $readmemb("/home/kimpao/projects/co2024/lab1/TEST_INSTRUCTIONS.txt", mem);
    end
    assign instruction = {mem[address], mem[address + 1], mem[address + 2], mem [address + 3]};
endmodule