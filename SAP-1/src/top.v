/* top.v

Top module for the SAP-1.

*/


module top (
    input wire CLK,
    input wire RESET,
    /* register control */
    input wire a_latch,
    input wire a_enable,
    input wire b_latch,
    input wire b_enable,
    input wire out_latch,
    input wire out_enable,
    input wire mar_latch,
    input wire mar_enable,
    input wire instruct_reg_latch,
    input wire instruct_reg_enable,
    input wire x_reg_latch,
    input wire x_reg_enable,
    input wire y_reg_latch,
    input wire y_reg_enable,

    input wire alu_enable,
    input wire alu_sub_enable,

    /* DBG driver */
    input wire w_driver_latch,

    /* output */
    output wire [7:0] LED
    ); 

wire [7:0] w_bus; 
reg [7:0] w_driver;     /* test driver */
wire carry_flag;
wire zero_flag;

wire [7:0] a_reg_out;
wire [7:0] b_reg_out;
wire [7:0] out_reg;
wire [7:0] mar_reg_out;
wire [7:0] instruct_reg_out;
wire [7:0] x_reg_out;
wire [7:0] y_reg_out;


/* 
A and B register are buffer units that hold the values to be processed 
by the ALU
 */
sap_register a_resgister(
    .clk(CLK),
    .reset(RESET),
    .DATA(w_bus),
    .REG_OUT(a_reg_out),
    .latch(a_latch),
    .enable(a_enable)
    );

sap_register b_register(
    .clk(CLK),
    .reset(RESET),
    .DATA(w_bus),
    .REG_OUT(b_reg_out),
    .latch(b_latch),
    .enable(b_enable)
    );

/* out register */
sap_register out_register(
    .clk(CLK),
    .reset(RESET),
    .DATA(w_bus),
    .REG_OUT(out_reg),
    .latch(out_latch),
    .enable(out_enable)
    );

/*memory address registers */
sap_register mar(
    .clk(CLK),
    .reset(RESET),
    .DATA(w_bus),
    .REG_OUT(mar_reg_out),
    .latch(mar_latch),
    .enable(mar_enable)
    );

/* fetchs instructions from the memory to later be executed */
sap_register instruct_reg(
    .clk(CLK),
    .reset(RESET),
    .DATA(w_bus),
    .REG_OUT(instruct_reg_out),
    .latch(instruct_reg_latch),
    .enable(instruct_reg_enable)
    );

/* x and y register used to index instructions */
sap_register x_reg(
    .clk(CLK),
    .reset(RESET),
    .DATA(w_bus),
    .REG_OUT(x_reg_out),
    .latch(x_reg_latch),
    .enable(x_reg_enable)
    );

sap_register y_reg(
    .clk(CLK),
    .reset(RESET),
    .DATA(w_bus),
    .REG_OUT(y_reg_out),
    .latch(y_reg_latch),
    .enable(y_reg_enable)
    );

/* SAP ALU module */
sap_alu sap_alu_inst (
    .a_reg(a_reg_out),
    .b_reg(b_reg_out),
    .data(w_bus),
    .enable(alu_enable),
    .sub(alu_sub_enable),
    .carry_flag(carry_flag),
    .zero_flag(zero_flag)
);

/* output display */
byte_led byte_led_inst0(
    .data(out_reg),
    .led(LED)
    );

/* DBG: test values */
always @(posedge CLK) begin
    if (RESET) begin
        w_driver <= 8'b0000010;
    end else begin
        w_driver <= w_driver + 1; /* increment with each pulse */
    end  
end

assign w_bus = (w_driver_latch) ? w_driver : 8'bZZZZZZZZ;


endmodule