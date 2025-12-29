module reg32 (
    input  logic        clk,
    input  logic        rst_n,   
    input  logic        load,    
    input  logic [31:0] d,
    output logic [31:0] q
);

    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            q <= 32'b0;        // reset clears register
        else if (load)
            q <= d;            // load new data
        else
            q <= q;            
    end

endmodule
