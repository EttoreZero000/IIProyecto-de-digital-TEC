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
    input wire [2:0] pos_actual,    // Posición actual P (3 bits: [2] MSB, [0] LSB)
    input wire [2:0] pos_objetivo,  // Posición objetivo T (3 bits: [2] MSB, [0] LSB)
    
    output wire P_es_menor,          // P < T
    output wire P_es_igual,          // P = T
    output wire P_es_mayor           // P > T
);

    // Conexiones intermedias entre etapas (del bit más significativo al menos significativo)
    wire bit2_mayor, bit2_igual, bit2_menor;
    wire bit1_mayor, bit1_igual, bit1_menor;

    // --- Bit 2 (MSB: Bit más significativo) ---
    // Inicialización: En la entrada del MSB fijamos igual_in = 1, mayor_in = 0, menor_in = 0
    comparador_1bit comp_bit2 (
        .pos_actual_bit   (pos_actual[2]),
        .pos_objetivo_bit (pos_objetivo[2]),
        .mayor_in         (1'b0),
        .igual_in         (1'b1),
        .menor_in         (1'b0),
        .mayor_out        (bit2_mayor),
        .igual_out        (bit2_igual),
        .menor_out        (bit2_menor)
    );

    // --- Bit 1 ---
    comparador_1bit comp_bit1 (
        .pos_actual_bit   (pos_actual[1]),
        .pos_objetivo_bit (pos_objetivo[1]),
        .mayor_in         (bit2_mayor),
        .igual_in         (bit2_igual),
        .menor_in         (bit2_menor),
        .mayor_out        (bit1_mayor),
        .igual_out        (bit1_igual),
        .menor_out        (bit1_menor)
    );

    // --- Bit 0 (LSB: Bit menos significativo) ---
    comparador_1bit comp_bit0 (
        .pos_actual_bit   (pos_actual[0]),
        .pos_objetivo_bit (pos_objetivo[0]),
        .mayor_in         (bit1_mayor),
        .igual_in         (bit1_igual),
        .menor_in         (bit1_menor),
        .mayor_out        (P_es_mayor),
        .igual_out        (P_es_igual),
        .menor_out        (P_es_menor)
    );

endmodule