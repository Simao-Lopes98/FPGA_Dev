/* sap_top_tb.v

Test bench for SAP-TOP module.

*/

`timescale 100ns/1ps

module tb();

    reg clk;        // the free running clock
    reg reset;
    reg a_latch;
    reg b_latch;
    reg out_latch;
    reg alu_enable;
    reg alu_sub_enable;
    reg w_driver_latch;

    /* unused - have to declared */
    reg a_enable = 0;
    reg b_enable = 0;
    reg out_enable = 0;
    reg mar_enable = 0;
    reg instruct_reg_enable = 0;
    reg instruct_reg_latch = 0;
    reg x_reg_enable = 0;
    reg y_reg_enable = 0;
    reg mar_latch = 0;
    reg x_reg_latch = 0;
    reg y_reg_latch = 0;

    /* top module Unit Under Test */
    top uut (
    .CLK (clk),
    .RESET (reset),
    /* register control */
    .a_latch (a_latch),
    .a_enable(a_enable),
    .b_latch(b_latch),
    .b_enable(b_enable),
    .out_latch(out_latch),
    .out_enable(out_enable),
    .mar_latch(mar_latch),
    .mar_enable(mar_enable),
    .instruct_reg_latch(instruct_reg_latch),
    .instruct_reg_enable(instruct_reg_enable),
    .x_reg_latch(x_reg_latch),
    .x_reg_enable(x_reg_enable),
    .y_reg_latch(y_reg_latch),
    .y_reg_enable(y_reg_enable),
    .alu_enable(alu_enable),
    .alu_sub_enable(alu_sub_enable),

    .w_driver_latch (w_driver_latch)
    /* output */
    // .LED()
    ); 

    initial begin
        $dumpfile("sap_top_tb.vcd");    // where to write the dump
        $dumpvars;                      // dump EVERYTHING
        clk = 0;
        reset = 0;
        a_latch = 0;
        b_latch = 0;
        out_latch = 0;
        alu_enable = 0;
        alu_sub_enable = 0;
        w_driver_latch = 0;
    end
    
    always #1 clk = ~clk;

    initial begin
        #1;
        reset <= 1;         /* reset to a known state */
        #3;
        reset <= 0;
        #5;
        w_driver_latch <= 1;/* set w-driver value in the W-Bus */
        #7
        a_latch <= 1;       /* load value from W-Bus to A reg */
        #9;
        a_latch <= 0;
        #11
        b_latch <= 1;       /* load value from W-Bus to B reg */
        #13;
        b_latch <= 0;
        w_driver_latch <= 0;/* disable w-driver to free W-Bus */
        alu_enable <= 1;    /* enable ALU */
        #15
        alu_enable <= 0;
        out_latch <= 1;     /* load put on the W-Bus by the ALU to the out-reg */
        #17
        out_latch <= 0;     /* load put on the W-Bus by the ALU to the out-reg */
        reset <= 1;

      #20000000;
        $finish;
    end

endmodule