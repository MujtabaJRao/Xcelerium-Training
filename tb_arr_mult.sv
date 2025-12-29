`timescale 1ns / 1ps

module array_multiplier_8x8_tb;

    reg  [7:0] A;
    reg  [7:0] B;
    wire [15:0] P;

    // Instantiate DUT (Device Under Test)
    array_multiplier_8x8 dut (
        .A(A),
        .B(B),
        .P(P)
    );

    initial begin
        // Monitor values (live scoreboard)
        $monitor("Time=%0t | A=%d B=%d | P=%d", $time, A, B, P);

        // =====================
        // Test Case 1
        // =====================
        A = 8'd0;   B = 8'd0;
        #10;

        // =====================
        // Test Case 2
        // =====================
        A = 8'd5;   B = 8'd3;   // 15
        #10;

        // =====================
        // Test Case 3
        // =====================
        A = 8'd12;  B = 8'd10;  // 120
        #10;

        // =====================
        // Test Case 4
        // =====================
        A = 8'd25;  B = 8'd4;   // 100
        #10;

        // =====================
        // Test Case 5 (Edge)
        // =====================
        A = 8'd255; B = 8'd1;   // 255
        #10;

        // =====================
        // Test Case 6 (Max)
        // =====================
        A = 8'd255; B = 8'd255; // 65025
        #10;

        // End simulation
        $finish;
    end

endmodule
