/* byte_led.v

Main module block for 8 Bit to LED

*/

module byte_led (
    input [7:0] data,
    output [7:0] led
    );

// instantion module blueprint
// byte_led byte_led_inst0(
//     .data(),
//     .led()
//      );

    assign led = data;

endmodule