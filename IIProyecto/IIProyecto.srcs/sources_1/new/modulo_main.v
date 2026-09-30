`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/29/2026 08:15:56 PM
// Design Name: 
// Module Name: modulo_main
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


module modulo_main(
    // 1. Reloj y Reset
    input wire clk,                 // Reloj principal (ej. 50 MHz / 100 MHz)
    input wire rst_n,               // Reset general (activo en bajo)

    // 2. Sensores del sistema
    input wire [2:0] ir_gray,       // Lectura actual de los sensores IR en la mesa

    // 3. Comandos de control
    input wire [2:0] target_gray,   // Posición objetivo en código Gray
    input wire start,               // Pulso para iniciar la maniobra

    // Salidas físicas
    output wire [3:0] in_pins       // Conexión física a IN1..IN4 de la placa ULN2003
    );
endmodule
