`timescale 1ns / 1ps

module reg32_tb;

    reg         clk;
    reg         rst_n;
    reg         load;
    reg [31:0]  d;
    wire [31:0] q;

    //Instantiate DUT
    reg32 uut (
        .clk   (clk),
        .rst_n (rst_n),
        .load  (load),
        .d     (d),
        .q     (q)
    );

    //Clock generation (10ns period)
    always begin
        #5 clk = ~clk;
    end

    initial begin
        //Init
        clk   = 0;
        rst_n = 0;
        load  = 0;
        d     = 32'b0;

        //Apply reset
        #12;
        rst_n = 1;

        //Load first value
        #10;
        load = 1;
        d    = 32'hDEADBEEF;

        // ⏸ Hold value
        #10;
        load = 0;
        d    = 32'hFFFFFFFF; // should NOT be loaded

        //Load second value
        #10;
        load = 1;
        d    = 32'h12345678;

        //Reset again
        #10;
        rst_n = 0;

        #10;
        rst_n = 1;

        //End sim
        #20;
        $finish;
    end

endmodule
