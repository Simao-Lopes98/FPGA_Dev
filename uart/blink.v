/* blink.v 

    Module for debug porpuses
    Expecting a 12 MHz clk input
*/


module blink (
    input wire clk,
    input wire btn,
    output reg led
);
    reg [31:0] count = 0;

    initial led = 0; // Give initial value

    always @(posedge clk)
        begin
        count <= count + 1;

        if (count == 6000000)
            begin
            led <= ~led;
            count <= 0;
            end
        else if (btn == 1)
            begin
            led <= 1;
            count <= 0;
            end
        end


endmodule