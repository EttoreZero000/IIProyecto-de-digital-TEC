`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/01/2026 11:14:31 PM
// Design Name: 
// Module Name: comparador_1bit
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module comparador_1bit (
    input wire A,
    input wire B,
    input wire GT_in, // (A > B anterior)
    input wire EQ_in, // (A == B anterior)
    input wire LT_in, // (A < B anterior)
    output wire GT_out,
    output wire EQ_out,
    output wire LT_out
);
    wire A_eq_B;
    wire A_gt_B;
    wire A_lt_B;

    // Lógica del bit actual
    assign A_eq_B = ~(A ^ B);      // XNOR (son iguales)
    assign A_gt_B = A & (~B);       // A = 1, B = 0
    assign A_lt_B = (~A) & B;       // A = 0, B = 1

    // Salidas en cascada (prioridad del bit más significativo)
    assign GT_out = GT_in | (EQ_in & A_gt_B);
    assign LT_out = LT_in | (EQ_in & A_lt_B);
    assign EQ_out = EQ_in & A_eq_B;

endmodule