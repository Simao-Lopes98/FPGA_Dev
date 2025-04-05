/* UART top.v

    top module for UART prj

 */


module top (
    input wire hwclk,
    output wire [3:0] led,
);
    // Turn off all LEDs
    assign led[3:1] = 0;
    
    // Use blink module
    
    blink blink_m (
        .clk (hwclk),
        .led (led[0])
    );

endmodule