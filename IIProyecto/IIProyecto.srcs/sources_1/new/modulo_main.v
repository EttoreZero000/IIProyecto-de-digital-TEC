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
    // 1. Sensores del sistema
    input wire [2:0] ir_gray,       // Lectura actual de los sensores IR en la mesa

    // 2. Comandos de control
    input wire [2:0] target_gray,   // Posición objetivo en código Gray
    input wire start,               // Pulso para iniciar la maniobra
    input wire stop,               // Pulso para detener toda la maniobra

    // 3. Salidas físicas
    output wire [1:0] in_pins       // Conexión física a IN1, IN2
    );
endmodule
