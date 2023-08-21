module fullAdder(a, b, cin, S, cout);
input a, b, cin;
output S, cout;

wire x1_, a1_, a2_;

xor x1(x1_, a, b);
and a1(a1_, a, b);
xor x2(S, x1_, cin);
and a2(a2_, x1_, cin);
or o1(cout, a1_, a2_);

endmodule