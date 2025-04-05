/* uart_tx.v

    UART frame constructor
*/


module uart_tx (
    input wire clk,     // Clk
    input wire send,    // Send signal
    input [7:0] data,   // Data to send
    output reg tx       // TX line
);
    reg [4:0] state = 0;
    reg [8:0] dataIndex = 0;
    
    always @(posedge clk ) begin    
        /*
        0 - IDLE
        1 - START_BIT
        2 - DATA BITS
        3 - STOP BIT
        4 - CLEANUP
        */
        if (state == 0) begin
            tx <= 1; // Idle TX line (logic HIGH)
            if (send == 1) begin
                state <= 1;
            end
        end
        else if (state == 1) begin
            tx <= 0; // Send START bit
            state <= 2;
        end
        else if (state == 2) begin
            // Set TX line to whatever bit is in data
            tx <= data[dataIndex];
            if (dataIndex == 7) begin
                state <= 3;
            end
            else begin
                dataIndex <= dataIndex + 1;
            end
        end
        else if (state == 3) begin
            tx <= 1;    // Send STOP bit
            state <= 4;
        end
        else if (state == 4) begin
            dataIndex <= 0; // Reset data index
            state <= 0;     // Go back to IDLE
        end
        else begin
                        // Default go to IDLE state
            state <= 0;
        end
    end

endmodule
