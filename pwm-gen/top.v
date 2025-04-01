/* top.v

Top module for PWM.

*/

module top (
    input wire hwclk,
    output wire led0
    );
    
    reg[7:0] duty = 128; // 50% duty cycle

    pwm_gen pwm_inst (
        .clk (hwclk),
        .duty (duty),
        .pwm (led0)
    );
    
endmodule