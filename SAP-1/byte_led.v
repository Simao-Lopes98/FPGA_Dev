/* byte_led.v

Main module block for 8 Bit to LED

*/

module byte_led (
    input [7:0] data,
    output led0,
    output led1,
    output led2,
    output led3,
    output led4,
    output led5,
    output led6,
    output led7
    );

// instantion module blueprint
// byte_led byte_led_inst0(
//     .data(),
//     .led0(),
//     .led1(),
//     .led2(),
//     .led3(),
//     .led4(),
//     .led5(),
//     .led6(),
//     .led7()
//      );

    assign led0 = data[0];
    assign led1 = data[1];
    assign led2 = data[2];
    assign led3 = data[3];
    assign led4 = data[4];
    assign led5 = data[5];
    assign led6 = data[6];
    assign led7 = data[7];

endmodule