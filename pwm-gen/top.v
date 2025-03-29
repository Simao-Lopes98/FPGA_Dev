/* top.v

Top module for PWM.

*/

module top (
    input clk,
    output wire led
    );
    
    reg[7:0] duty = 128; // 50% duty cycle

    pwm_gen pwm_inst (
        .clk (clk),
        .duty (duty),
        .pwm (led)
    );
    
endmodule