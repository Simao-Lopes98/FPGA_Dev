/* clk_pres.v

Main module block for CLK pres

*/

module clk_pres (
    input clk,
    input [31:0] pre,
    output reg out_clk
    );

// instantion module blueprint
// clk_pres clk_pres_inst0(
//     .clk(),
//     .pre(),
//     .out_clk()
//     );

    reg [31:0] counter = 0;

    // Always block
    always @(posedge clk) begin
        
        if (counter == pre) begin
            out_clk <= 1;
            counter <= 0;
        end else begin
            out_clk <= 0;
            counter <= counter + 1;
        end
        
    end
endmodule