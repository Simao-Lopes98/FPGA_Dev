/* uart_tx.v

    UART frame constructor
*/


module uart_tx (
    input wire clk,     // Clk
    input wire send,    // Send signal
    input [7:0] data,   // Data to send
    output reg tx       // TX line
);
    reg [2:0] state = 0;
    reg [2:0] dataIndex = 0;
    reg send_latched = 0; // Latch send signal
    
    // States
    localparam IDLE = 3'b000;
    localparam START_BIT = 3'b001;
    localparam DATA_BITS = 3'b010;
    localparam STOP_BIT = 3'b011;
    localparam CLEANUP = 3'b100;

    reg [2:0] present_state, next_state = IDLE; // State registers

    // Runs when present_state changes
    always @(present_state, send_latched, tx, dataIndex) begin
        case (present_state)
        IDLE:
        begin
           if (send_latched == 1) begin
                next_state = START_BIT; // Go to START_BIT state
           end
        end
        START_BIT:
        begin
            if (tx == 0) begin
                next_state = DATA_BITS; // Go to DATA_BITS state
            end
        end
        DATA_BITS:
        begin
            if (dataIndex == 7) begin
                next_state = STOP_BIT; // Go to STOP_BIT state
            end
        end
        STOP_BIT:
        begin
            if (tx == 1) begin
                next_state = CLEANUP; // Go to CLEANUP state
            end
        end
        CLEANUP:
        begin
            if (dataIndex == 0 && send_latched == 0) begin
                next_state = IDLE; // Go back to IDLE state
            end
        end
        default:
        begin
            next_state = IDLE; 
        end 
        endcase
    end

     always @(posedge clk ) begin
        present_state <= next_state; // Update present state
        case (present_state)
            IDLE:
            begin
                tx <= 1; // Idle TX line (logic HIGH)
                if (send == 1 && send_latched == 0) begin
                    send_latched <= 1; // Latch send signal 
                end
            end
            START_BIT:
            begin
                tx <= 0; // Send START bit
            end
            DATA_BITS:
            begin
                // Set TX line to whatever bit is in data
                tx <= data[dataIndex];
                if (dataIndex < 7) begin
                    dataIndex <= dataIndex + 1;
                end
            end
            STOP_BIT:
            begin
                tx <= 1;    // Send STOP bit
            end
            CLEANUP:
            begin
                dataIndex <= 0; // Reset data index
                send_latched <= 0; // Reset send latch
            end
            default:
            begin
                tx <= 1; // Default to idle state
            end
        endcase
     end
        
endmodule

