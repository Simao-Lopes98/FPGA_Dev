module pwm_gen (
    input clk,
    input [7:0] duty,
    output reg pwm
    );
    reg [7:0] counter = 0;

    // Always block
    always @(posedge clk) begin
        counter <= counter + 1;             // Increments counter (has rollover)
        pwm <= (counter < duty) ? 1 : 0;    // if 
    end
endmodule