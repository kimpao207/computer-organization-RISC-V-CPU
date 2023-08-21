module alu(input signed [3:0] a,
           input signed [3:0] b,
           input [2:0] s,
           output reg signed [3:0] y);

    reg signed [3:0] _add;
    reg signed [3:0] _sub;
    reg [3:0] addOut;
    reg [3:0] subOut;
    reg [3:0] notB = ~b + 1;
    reg signed [3:0] _gt;
    reg signed [3:0] _eql;

    // add
    fullAdder F1(a[0], b[0], 0, _add[0], addOut[0]);
    fullAdder F2(a[1], b[1], addOut[0], _add[1], addOut[1]);
    fullAdder F3(a[2], b[2], addOut[1], _add[2], addOut[2]);
    fullAdder F4(a[3], b[3], addOut[2], _add[3], addOut[3]);

    // sub
    fullAdder F5(a[0], notB[0], 0, _sub[0], subOut[0]);
    fullAdder F6(a[1], notB[1], subOut[0], _sub[1], subOut[1]);
    fullAdder F7(a[2], notB[2], subOut[1], _sub[2], subOut[2]);
    fullAdder F8(a[3], notB[3], subOut[2], _sub[3], subOut[3]);

    // gt
    always @(a, b, s) begin
        if (a > b) begin
            _gt = 1;
        end else begin
            _gt = 0;
        end
    end

    // eql
    always @(a, b, s) begin
        if (a == b) begin
            _eql = 1;
        end else begin
            _eql = 0;
        end
    end

    // multiplex
    always @(a, b, s) begin
        case (s)
            3'b000 : y = _add;
            3'b001 : y = _sub;
            3'b010 : y = ~a;
            3'b011 : y = a & b;
            3'b100 : y = a | b;
            3'b101 : y = a ^ b;
            3'b110 : y = _gt;
            3'b111 : y = _eql;
            default: y = a + b;
        endcase
    end


endmodule