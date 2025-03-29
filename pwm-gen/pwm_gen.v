/* pwm_gen.v

Main module block for PWM

*/

module pwm_gen (
    input clk,
    input [7:0] duty,
    output reg pwm
    );
    reg [7:0] counter = 0;

    // Always block
    always @(posedge clk) begin
        counter <= counter + 1;             // Increments counter (has rollover)
        /* 
        If counter is less than duty, output 1
        Otherwise, zero
         */
        pwm <= (counter < duty) ? 1 : 0;
    end
endmodule