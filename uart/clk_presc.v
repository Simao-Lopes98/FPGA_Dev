/* clk_presc.v */

/*
    Module to prescale clk signal

    Prescaler =  FPGA Clock Frequency / (16 × Baud Rate)
​    
    For the ICeStick (clock of 12 MHz)
    Baud Rate | Prescaler Value
    ---------------------------
    9600      | 78
    19200     | 39
    38400     | 19
    57600     | 13
    115200    | 6
*/

 
module clk_presc (
    input clk,                  // Original clk
    input [31:0] pres,          // Prescale value
    output reg pres_clk         // Output clk
);
        reg [31:0] counter = 0; // Counter
        
        // Initial keyword is required otherwise the signal would be undefined
        initial pres_clk = 0;   

        always @(posedge clk) begin
            
            counter <= counter + 1; // Increment counter
            
            if (counter == pres) begin
                pres_clk <=  ~pres_clk;     // Invert clk signal
                counter <= 0;               // Reset counter
            end
        end
    
endmodule