module mainControl (
    input [6:0] ins, 
    output branch, memRead, memToReg, memWrite, aluSrc, regWrite,
    output [1:0] aluOp
);
    reg [7:0] control;
    assign {branch, memRead, memToReg, memWrite, aluSrc, regWrite, aluOp} = control;
    always @(ins) begin
        case (ins)
            7'b1100011 : control = 8'b0x000101;//beq
            7'b0000011 : control = 8'b11110000;//lw 
            7'b0100011 : control = 8'b1x001000;//sw
            7'b0010011 : control = 8'b10100011;//I-type
            7'b0110011 : control = 8'b00100010;//R-type
            default: control = 8'bxxxxxxxx;
        endcase
    end
endmodule