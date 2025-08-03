/* sap_top_tb.v

Test bench for SAP-TOP module.

*/

`timescale 100ns/1ps

module tb();

    reg clk;        // the free running clock
    reg reset = 0;
    reg latch = 0;
    reg enable = 0;

    top uut (
        .clk(clk),
        .reset(reset),
        .latch(latch),
        .enable(enable)
        );

    initial begin
        $dumpfile("sap_top_tb.vcd");    // where to write the dump
        $dumpvars;                      // dump EVERYTHING
        clk = 0;
    end
    
    always #1 clk = ~clk;

    initial begin
        #1;
        reset <= 1;     // reset to a known state
        #3;
        reset <= 0;
        #4;
        latch <= 1;
        #10;
        latch <= 0;
        #11;
        reset <= 1;

      #20000000;
        $finish;
    end

endmodule