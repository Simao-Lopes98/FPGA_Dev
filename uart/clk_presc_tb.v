/* clk_presc_tb.v */

/*

Test bench for clk_presc module

*/
`timescale 100ns/1ps

module tb ();

    reg clk;        // the free running clock
    reg[31:0] pres = 78;
    wire pres_clk = 0;

    clk_presc uut (
        .clk (clk),
        .pres (pres),
        .pres_clk (pres_clk)
        );

    initial begin
        $dumpfile("clk_presc_tb.vcd");    // where to write the dump
        $dumpvars;                      // dump EVERYTHING
        clk = 0;
    end
    
    always #1 clk = ~clk;

    initial begin
        #1000;
        //#16000000;
        $finish;
    end

endmodule