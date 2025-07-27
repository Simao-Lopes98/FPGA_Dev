/* top.v

Top module for the SAP-1.

*/

module top (
    input wire hwclk
    );


wire reset;
wire latch;
wire enable;

sap_register sap_register_inst0(
    .clk(),
    .reset(),
    .DATA(),
    .REG_OUT(),
    .latch(),
    .enable()
    );
    
endmodule