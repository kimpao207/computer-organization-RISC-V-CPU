module fullAdderBeh(
    input a, input b, input cin,
    output reg S, output reg cout
);
    always @(a, b, cin) begin
        {cout, S} = a + b + cin;
    end
    
endmodule