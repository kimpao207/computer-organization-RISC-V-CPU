module pc (
    input clk, 
    input [31:0] nextpc,
    output reg [31:0] currentpc
);
    always @(posedge clk) begin
        currentpc <= nextpc;
    end
endmodule