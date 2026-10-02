`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/02/2026 11:14:25 AM
// Design Name: 
// Module Name: comparador_3bits
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

module comparador_3bits (
    input wire [2:0] P, // Posición actual (Binario)
    input wire [2:0] T, // Posición objetivo (Binario)
    
    output wire P_lt_T, // P < T
    output wire P_eq_T, // P = T
    output wire P_gt_T  // P > T
);
    // Cables para la cascada entre bits
    wire c2_gt, c2_eq, c2_lt;
    wire c1_gt, c1_eq, c1_lt;

    // Bit 2 (MSB) - Las entradas de cascada iniciales se fijan (Igualdad = 1, Mayor/Menor = 0)
    comparador_1bit comp2 (
        .A(P[2]), .B(T[2]),
        .GT_in(1'b0), .EQ_in(1'b1), .LT_in(1'b0),
        .GT_out(c2_gt), .EQ_out(c2_eq), .LT_out(c2_lt)
    );

    // Bit 1
    comparador_1bit comp1 (
        .A(P[1]), .B(T[1]),
        .GT_in(c2_gt), .EQ_in(c2_eq), .LT_in(c2_lt),
        .GT_out(c1_gt), .EQ_out(c1_eq), .LT_out(c1_lt)
    );

    // Bit 0 (LSB)
    comparador_1bit comp0 (
        .A(P[0]), .B(T[0]),
        .GT_in(c1_gt), .EQ_in(c1_eq), .LT_in(c1_lt),
        .GT_out(P_gt_T), .EQ_out(P_eq_T), .LT_out(P_lt_T)
    );

endmodule
