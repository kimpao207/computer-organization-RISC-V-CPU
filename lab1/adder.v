module adder (
    input [31:0] pc,
    input [31:0] addNum,
    output [31:0] nextpc
);
    assign nextpc = pc + addNum;
endmodule