module counter #(
    parameter N = 8   // counter width (default 8-bit)
)(
    input  logic           clk,
    input  logic           rst_n,   // active-low reset
    input  logic           en,      // enable
    input  logic           up_dn,   // 1 = up, 0 = down
    output logic [N-1:0]   count
);

    always_ff @(posedge clk) begin
        if (!rst_n)
            count <= '0;              // reset to 0
        else if (en) begin
            if (up_dn)
                count <= count + 1'b1; // count up
            else
                count <= count - 1'b1; // count down
        end
        else
            count <= count;            
    end

endmodule
