module encoder_tb;

    reg  [7:0] in;
    wire [2:0] out;
    wire       valid;

    reg  [2:0] exp_out;
    reg        exp_valid;

    integer pass_count;
    integer fail_count;
    integer i;

    // DUT
    encoder dut (
        .in(in),
        .out(out),
        .valid(valid)
    );

    // Expected output calculator 
    task compute_expected;
        input [7:0] vin;
        begin
            exp_valid = |vin;
            exp_out   = 3'b000;

            for (i = 7; i >= 0; i = i - 1) begin
                if (vin[i]) begin
                    exp_out = i[2:0];
                    disable compute_expected; // exit loop early
                end
            end
        end
    endtask

    // Checker task
    task check_result;
        input [80*8:1] test_name;
        begin
            if (out === exp_out && valid === exp_valid) begin
                $display("[PASS] %s | in=%b out=%0d valid=%b",
                          test_name, in, out, valid);
                pass_count = pass_count + 1;
            end else begin
                $display("[FAIL] %s | in=%b out=%0d valid=%b | EXP out=%0d valid=%b",
                          test_name, in, out, valid, exp_out, exp_valid);
                fail_count = fail_count + 1;
            end
        end
    endtask

    initial begin
        pass_count = 0;
        fail_count = 0;

        $display("🔥 Encoder Testbench Started 🔥");

        // =========================
        // 1️⃣ One-hot tests
        // =========================
        for (i = 0; i < 8; i = i + 1) begin
            in = 8'b1 << i;
            compute_expected(in);
            #1;
            check_result("One-hot test");
        end

        // =========================
        // 2️⃣ Invalid / multi-bit tests
        // =========================
        in = 8'b10110100;
        compute_expected(in);
        #1;
        check_result("Multiple bits high;");

        in = 8'b00000000;
        compute_expected(in);
        #1;
        check_result("All zeros");

        // =========================
        // 3️⃣ Random tests
        // =========================
        for (i = 0; i < 20; i = i + 1) begin
            in = $random;
            compute_expected(in);
            #1;
            check_result("Random test");
        end

        // =========================
        // 🏁 Final score
        // =========================
        $display("==============================");
        $display("PASSED: %0d", pass_count);
        $display("FAILED: %0d", fail_count);
        $display("==============================");

        if (fail_count == 0)
            $display("🏆 ALL TESTS PASSED — PERFECT RUN!");
        else
            $display("💀 FIX BUGS AND REMATCH");

        $finish;
    end

endmodule

