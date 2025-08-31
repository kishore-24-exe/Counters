module johnson_count (
    input wire clk,
    input wire rst_n,
    output reg [3:0] d_ff
);
    
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            d_ff <= 4'b0000;
        else
            d_ff <= {d_ff[2:0], ~d_ff[3]};
    end
endmodule

module tb_johnson_count;
    reg clk=0;
    reg rst_n;
    wire [3:0] d_ff;

    johnson_count c1 (
        .clk(clk),
        .rst_n(rst_n),
        .d_ff(d_ff)
    );

    always #0.5 clk = ~clk; 

    initial begin
        rst_n = 0;
        #1;
        rst_n = 1; 
        #20 $finish;
    end
endmodule

// 0000
// 0001
// 0011
// 0111
// 1111 
// 1110
// 1100
// 1000
// 0000

// 0001