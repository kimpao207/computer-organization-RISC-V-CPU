module dataMemory (
    input reg [31:0] address, writeData,
    input memWrite, memRead,
    output reg [31:0] readData
);
    reg [31:0] mem[127:0];
    always @(*) begin
        if (memRead == 1) begin
            readData = mem[address];
        end
        else if (memWrite == 1) begin
            mem[address] = writeData;
        end
    end
endmodule