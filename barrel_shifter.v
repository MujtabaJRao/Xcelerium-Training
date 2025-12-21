module barrel_shifter (
    input  [31:0] data_in,
    input  [4:0]  shift_amt,
    input         dir,        // 0 = left, 1 = right
    output reg [31:0] data_out
);

    always @(*) begin
        if (dir == 1'b0)
            data_out = data_in << shift_amt;   // logical left
        else
            data_out = data_in >> shift_amt;   // logical right
    end

endmodule
