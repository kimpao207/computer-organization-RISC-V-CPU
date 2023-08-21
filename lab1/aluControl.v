module aluControl (
    input [1:0] aluOp,
    input [3:0] ins,
    output reg [3:0] control
);
    always @(aluOp, ins) begin
        case (aluOp)
            2'b00 : control = 4'b0010;
            2'b01 : control = 4'b0110;
            2'b10 : case (ins)
                4'b0000 : control = 4'b0010; //add
                4'b1000 : control = 4'b0110; //sub
                4'b0111 : control = 4'b0000; //and
                4'b0110 : control = 4'b0001; //or
                4'b0010 : control = 4'b0111; //slt
                default: control = 4'bxxxx;
            endcase
            2'b11 : case (ins)
                4'bx000 : control = 4'b0010; //addi
                4'bx111 : control = 4'b0000; //andi
                4'bx110 : control = 4'b0001; //ori
                4'bx010 : control = 4'b0111; //slti
                default: control = 4'bxxxx;
            endcase
        endcase
    end
endmodule