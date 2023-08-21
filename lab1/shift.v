module shift (
    input [31:0] unshift,
    output reg [31:0] shifted
);
    always @(unshift) begin
        shifted = unshift << 1;
    end
endmodule