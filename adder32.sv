module adder32(
    input  [31:0] a, b,
    input         cin,
    output [31:0] sum,
    output        cout
);
    reg [31:0] sum_reg;
    reg        cout_reg;

    assign sum = sum_reg;
    assign  cout= cout_reg;

    integer i;
    reg carry;

    always @(*) begin
        carry = cin;
        for (i = 0; i < 32; i = i + 1) begin
            sum_reg[i] = a[i] ^ b[i] ^ carry;
            carry = (a[i] & b[i]) | (a[i] & carry) | (b[i] & carry);
        end
        cout_reg = carry;
    end
endmodule





