/* UART top.v

    top module for UART prj

 */


module top (
    input wire hwclk,
    input wire btn,
    output wire tx,
    output wire [3:0] led
);
    assign led[3:1] = 0; // Turn off all unused LEDs
    wire pres_clk; // Prescaler clk
    reg [31:0] pres = 78; // Prescaler value
    reg [7:0] data = 8'b01001000; // 'H' letter to send
    
    wire uart_tx_line;
    assign tx = uart_tx_line;
    
    // Use blink module
    blink blink_m (
        .clk (hwclk),
        .btn (btn),
        .led (led[0])
    );

    // Use prescaler module
    clk_presc clk_presc_m (
        .clk (hwclk),
        .pres (pres),
        .pres_clk (pres_clk)
    );

    // Use UART mode
    uart_tx uart_tx_m (
        .clk (pres_clk),
        .send (btn),
        .data (data),
        .tx (uart_tx_line)
    );

endmodule