/* UART top.v

    top module for UART prj

 */


module moduleName (
    input wire hwclk,
    output wire led0,
);
    // Use blink module
    blink blink_m (
        .clk (hwclk),
        .led (led0)
    );

endmodule