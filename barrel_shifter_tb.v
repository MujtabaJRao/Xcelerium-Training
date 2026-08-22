module barrel_shifter_tb;

    reg  [31:0] data_in;
    reg  [4:0]  shift_amt;
    reg         dir;
    wire [31:0] data_out;

    reg  [31:0] expected;

    integer pass_count = 0;
    integer fail_count = 0;
    integer i;

    // DUT
    barrel_shifter dut (
        .data_in(data_in),
        .shift_amt(shift_amt),
        .dir(dir),
        .data_out(data_out)
    );

    // Task for testing
    task run_test;
        input [31:0] din;
        input [4:0]  shamt;
        input        d;
        begin
            data_in   = din;
            shift_amt = shamt;
            dir       = d;

            #1; // wait for combinational logic

            // Expected result
            if (dir == 1'b0)
                expected = din << shamt;
            else
                expected = din >> shamt;

            // Compare
            if (data_out === expected) begin
                $display("PASS | data=%h shift=%0d dir=%0d result=%h",
                          din, shamt, d, data_out);
                pass_count = pass_count + 1;
            end
            else begin
                $display("FAIL | data=%h shift=%0d dir=%0d result=%h expected=%h",
                          din, shamt, d, data_out, expected);
                fail_count = fail_count + 1;
            end
        end
    endtask

    initial begin
        $display("===== BARREL SHIFTER TEST START =====");

        //  Directed tests
        run_test(32'h00000001, 5'd1, 1'b0);
        run_test(32'h80000000, 5'd1, 1'b1);
        run_test(32'hFFFFFFFF, 5'd4, 1'b0);
        run_test(32'h12345678, 5'd8, 1'b1);
        run_test(32'hA5A5A5A5, 5'd0, 1'b0);

        //  Random tests
        for (i = 0; i < 20; i = i + 1) begin
            run_test(
                $random,
                $random % 32,
                $random % 2
            );
        end

        //  Summary
        $display("===== TEST SUMMARY =====");
        $display("PASSED: %0d", pass_count);
        $display("FAILED: %0d", fail_count);

        if (fail_count == 0)
            $display(" ALL TESTS PASSED – PERFECT RUN ");
        else
            $display(" SOME TESTS FAILED – TRY AGAIN ");

        $finish;
    end

endmodule
