/* 

sap_register.v

Module for the SAP register

*/

module sap_register(
    input clk,
    input reset,
    inout [7:0] DATA,
    output [7:0] REG_OUT,
    input latch,
    input enable
);

// instantion module blueprint
// sap_register sap_register_inst0(
//     .clk(),
//     .reset(),
//     .DATA(),
//     .REG_OUT(),
//     .latch(),
//     .enable()
//     );

// actual register
reg [7:0] r;

always @(posedge clk ) begin
    if (reset) begin
        r <= 0; // Set to known state
    end else begin
        if (latch) begin
            r <= DATA;
        end
    end
end

// Set data to high impedance mode if enable is not set.
assign DATA = (enable) ? r : 8'bZ;
assign REG_OUT = r;

endmodule