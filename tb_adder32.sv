module tb_adder32;

    reg  [31:0] a, b;
    reg         cin;
    wire [31:0] sum;
    wire        cout;

    // Instantiate the 32-bit adder
    adder32 dut (
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum),
        .cout(cout)
    );

    initial begin
        // Test vector 1
        a = 32'h1110_1111;
        b = 32'h1111_0001;
        cin = 0;
        #10;
        $display("Test1: a=%h, b=%h, cin=%b -> sum=%h, cout=%b", a, b, cin, sum, cout);

        // Test vector 2
        a = 32'hFFFF_FFFF;
        b = 32'h0000_0001;
        cin = 0;
        #10;
        $display("Test2: a=%h, b=%h, cin=%b -> sum=%h, cout=%b", a, b, cin, sum, cout);

        // Test vector 3
        a = 32'h1234_5678;
        b = 32'h8765_4321;
        cin = 1;
        #10;
        $display("Test3: a=%h, b=%h, cin=%b -> sum=%h, cout=%b", a, b, cin, sum, cout);

        $finish;
    end
endmodule
