`timescale 1ns/1ps

module counter_tb;

    // Parameters
    parameter N = 8;

    // Testbench signals
    logic         clk;
    logic         rst_n;
    logic         en;
    logic         up_dn;
    logic [N-1:0] count;

    // Instantiate DUT (Device Under Test)
    counter #(
        .N(N)
    ) dut (
        .clk   (clk),
        .rst_n (rst_n),
        .en    (en),
        .up_dn (up_dn),
        .count (count)
    );

    // -----------------------------
    // Clock generation (10ns period)
    // -----------------------------
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // -----------------------------
    // Test sequence
    // -----------------------------
    initial begin
        // Init signals
        rst_n = 0;
        en    = 0;
        up_dn = 1;

        // Apply reset
        #20;
        rst_n = 1;   // release reset

        // -----------------------------
        // Count UP
        // -----------------------------
        en    = 1;
        up_dn = 1;
        #80;        // let it count up

        // -----------------------------
        // Hold (en = 0)
        // -----------------------------
        en = 0;
        #40;

        // -----------------------------
        // Count DOWN
        // -----------------------------
        en    = 1;
        up_dn = 0;
        #80;

        // -----------------------------
        // Finish simulation
        // -----------------------------
        $finish;
    end

    // -----------------------------
    // Monitor values (console log)
    // -----------------------------
    initial begin
        $monitor("Time=%0t | rst_n=%b en=%b up_dn=%b count=%0d",
                  $time, rst_n, en, up_dn, count);
    end

endmodule
