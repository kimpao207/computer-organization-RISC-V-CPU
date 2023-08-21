module registerfile (
    input [4:0] read1, read2, write,
    input [31:0] writeData,
    input clk, regWrite,
    output [31:0] data1, data2
);
    reg [31:0] registers[31:0];
    integer i;

    initial begin
        for (i = 0;i < 32;i+=1) begin
            registers[i] = 0;
        end
    end

    always @(posedge clk) begin
        if (regWrite) begin
            registers[write] <= writeData;
        end
    end

    assign data1 = registers[read1];
    assign data2 = registers[read2];
endmodule