module array_multiplier_8x8 (
    input  [7:0] A,
    input  [7:0] B,
    output [15:0] P
);

    wire [15:0] pp0, pp1, pp2, pp3, pp4, pp5, pp6, pp7;

    // Partial products (each row shifted)
    assign pp0 = B[0] ? (A << 0) : 16'b0;
    assign pp1 = B[1] ? (A << 1) : 16'b0;
    assign pp2 = B[2] ? (A << 2) : 16'b0;
    assign pp3 = B[3] ? (A << 3) : 16'b0;
    assign pp4 = B[4] ? (A << 4) : 16'b0;
    assign pp5 = B[5] ? (A << 5) : 16'b0;
    assign pp6 = B[6] ? (A << 6) : 16'b0;
    assign pp7 = B[7] ? (A << 7) : 16'b0;

    // Sum of all partial products
    assign P = pp0 + pp1 + pp2 + pp3 + pp4 + pp5 + pp6 + pp7;

endmodule
