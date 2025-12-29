module mult8_adder_tree (
    input  logic [7:0]  A,
    input  logic [7:0]  B,
    output logic [15:0] P
);

    // ----------------------------
    // Partial products
    // ----------------------------
    logic [15:0] pp [7:0];

    genvar i;
    generate
        for (i = 0; i < 8; i++) begin : GEN_PP
            assign pp[i] = B[i] ? (A << i) : 16'd0;
        end
    endgenerate

    // ----------------------------
    // Adder Tree - Level 1
    // ----------------------------
    logic [15:0] s0, s1, s2, s3;

    assign s0 = pp[0] + pp[1];
    assign s1 = pp[2] + pp[3];
    assign s2 = pp[4] + pp[5];
    assign s3 = pp[6] + pp[7];

    // ----------------------------
    // Adder Tree - Level 2
    // ----------------------------
    logic [15:0] t0, t1;

    assign t0 = s0 + s1;
    assign t1 = s2 + s3;

    // ----------------------------
    // Final Adder
    // ----------------------------
    assign P = t0 + t1;

endmodule
