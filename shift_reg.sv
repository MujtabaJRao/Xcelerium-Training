module reg32 (
    input  logic        clk,
    input  logic        rst_n,     
    input  logic        shift_en,
    input  logic        dir,
    input  logic        d_in,
    output logic [31:0] q
);

    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            q <= 32'b0;        // reset clears register
        else if (shift_en) begin
            if(!dir) begin       // right shift
                q[30:0] <= q[31:1];
                q[31]   <= d_in;
            end
            else begin           // left shift
                q[31:1] <= q[30:0];
                q[0]    <= d_in;
            end
        end
    end

endmodule
