/* sap_alu.v

Arithmetic Logic Unit (ALU) module for the SAP-1.

*/


module sap_alu (
    input [7:0] a_reg,
    input [7:0] b_reg,
    inout [7:0] data,
    input enable,
    input sub,
    output carry_flag,
    output zero_flag
);

//sap_alu sap_alu_inst0 (
//     .a_reg(),
//     .b_reg(),
//     .data(),
//     .enable(),
//     .sub(),
//     .carry_flag(),
//     .zero_flag()
// );
    
wire [8:0] alu_plus = a_reg + b_reg;
wire [8:0] alu_minus = a_reg - b_reg;

wire [7:0] alu_result;

/* concat the 1 bit from carry and 8 from alu_result */
assign {carry_flag, alu_result} = (sub) ? alu_minus : alu_plus;
assign zero_flag = ({carry_flag, alu_result} == 9'd0) ? 1'b1 : 1'b0;

assign data = (enable) ? alu_result : 8'bZZZZZZZZ;

endmodule