/* sap_top.v

Top module for the SAP-1.

*/

// macros
`define RESET gpio_02
`define LATCH gpio_03
`define ENABLE gpio_04

module top (
    input wire hwclk,
    input wire `RESET, // reset
    input wire `LATCH, // latch
    input wire `ENABLE  // enable
    ); 

reg [31:0] presclares = 2;
wire pres_clk;
wire [7:0] data_out;
wire [7:0] w_bus; 
reg [7:0] w_driver;

// prescale clk
// clk_pres clk_pres_inst0(
//     .clk(hwclk),
//     .pre(presclares),
//     .out_clk(pres_clk)
//     );

sap_register sap_register_inst0(
    .clk(hwclk),
    .reset(`RESET),
    .DATA(w_bus),
    .REG_OUT(data_out),
    .latch(`LATCH),
    .enable(`ENABLE)
    );

always @(posedge hwclk) begin
    if (`RESET) begin
        w_driver <= 8'b01000010;
    end else if (`LATCH) begin
        w_driver <= w_driver + 1;
    end
end

assign w_bus = (`LATCH) ? w_driver : 8'bZ;

endmodule