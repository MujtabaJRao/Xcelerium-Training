`timescale 1ns/1ps

module mult8_adder_tree_tb;

    // Inputs
    logic [7:0] A;
    logic [7:0] B;

    // Output
    logic [15:0] P;

    // Reference result
    logic [15:0] expected;

    // Instantiate DUT
    mult8_adder_tree dut (
        .A(A),
        .B(B),
        .P(P)
    );

    // Task to apply and check values
    task apply_test(input [7:0] a, input [7:0] b);
        begin
            A = a;
            B = b;
            #5;  // allow combinational settle

            expected = a * b;

            if (P !== expected) begin
                $display("❌ FAIL | A=%0d B=%0d | P=%0d Expected=%0d",
                          A, B, P, expected);
            end else begin
                $display("✅ PASS | A=%0d B=%0d | P=%0d",
                          A, B, P);
            end
        end
    endtask

    // Test sequence
    initial begin
        $display("🔥 Starting Adder Tree Multiplier Test 🔥");

        // Basic tests
        apply_test(8'd0,   8'd0);
        apply_test(8'd5,   8'd3);
        apply_test(8'd12,  8'd4);
        apply_test(8'd15,  8'd15);

        // Edge cases
        apply_test(8'd255, 8'd1);
        apply_test(8'd255, 8'd255);

        // Random stress test
        repeat (20) begin
            apply_test($urandom_range(0,255),
                       $urandom_range(0,255));
        end

        $display("🏁 Test Finished 🏁");
        $finish;
    end

endmodule
