/* sap_top.v

Top module for the SAP-1.

*/

// macros

module top (
    input wire CLK,             // clk
    input wire RESET,           // reset
    input wire LATCH,           // latch
    input wire ENABLE,          // enable
    output wire [7:0] LED       // output LEDs
    ); 

wire [7:0] data_out;
wire [7:0] w_bus; 
reg [7:0] w_driver;     // Test driver

sap_register sap_register_inst0(
    .clk(CLK),
    .reset(RESET),
    .DATA(w_bus),
    .REG_OUT(data_out),
    .latch(LATCH),
    .enable(ENABLE)
    );

byte_led byte_led_inst0(
    .data(data_out),
    .led(LED)
    );

always @(posedge CLK) begin
    if (RESET) begin
        w_driver <= 8'b0000010;
    end else if (LATCH) begin
        w_driver <= w_driver + 1;
    end
end

assign w_bus = (LATCH) ? w_driver : 8'bZZZZZZZZ;


endmodule