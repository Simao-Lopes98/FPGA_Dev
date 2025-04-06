/* top_tb.v */

/*

Test bench for top module

*/
`timescale 100ns/1ps

module tb ();

    reg clk;        // the free running clock
    wire tx;
    reg btn;

    top uut_1 (
        .hwclk (clk),
        .btn (btn),
        .tx (tx)
        // Dont test led
    );

    initial begin
        $dumpfile("top_tb.vcd");      // where to write the dump
        $dumpvars;                    // dump EVERYTHING
        clk = 0;
    end

    initial begin
        btn = 0;
        #178
        btn = 1;
    end
    
    always #1 clk = ~clk;

    initial begin
        //#1000;
        #16000;
        $finish;
    end

endmodule