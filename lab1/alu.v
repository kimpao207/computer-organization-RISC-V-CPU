module alu (
    input [31:0] a,
    input [31:0] b,
    input [3:0] control,
    output reg [31:0] y,
    output zero
);
    always @(a, b, control) begin
        case (control)
            4'b0000 : y = a & b;
            4'b0001 : y = a | b;
            4'b0010 : y = a + b;
            4'b0110 : y = a - b;
            4'b0111 : y = (a < b)? 1 : 0;
            4'b1100 : y = ~(a | b);
            default: y = 0;
        endcase
    end
    assign zero = (y == 0)? 1 : 0;
endmodule