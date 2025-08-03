/* sap_top.v

Top module for the SAP-1.

*/

// macros

module top (
    input wire clk,
    input wire reset, // reset
    input wire latch, // latch
    input wire enable  // enable
    ); 

wire [7:0] data_out;
wire [7:0] w_bus; 
reg [7:0] w_driver;     // Test driver

sap_register sap_register_inst0(
    .clk(clk),
    .reset(reset),
    .DATA(w_bus),
    .REG_OUT(data_out),
    .latch(latch),
    .enable(enable)
    );

always @(posedge clk) begin
    if (reset) begin
        w_driver <= 8'b01000010;
    end else if (latch) begin
        w_driver <= w_driver + 1;
    end
end

assign w_bus = (latch) ? w_driver : 8'bZ;

byte_led byte_led_inst0(
    .data(data_out),
    .led0(led00),
    .led1(led01),
    .led2(led02),
    .led3(led03),
    .led4(led04),
    .led5(led05),
    .led6(led06),
    .led7(led07)
    );


endmodule