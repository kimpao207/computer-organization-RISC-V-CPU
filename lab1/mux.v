module mux (
    input [31:0] mux0, mux1,
    input muxSignal,
    output reg [31:0] selected
);
    always @(*) begin
        case (muxSignal)
            1'b0 : selected = mux0;
            1'b1 : selected = mux1;
            default: selected = mux0;
        endcase
    end
    
endmodule