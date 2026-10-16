module comparador_1bit (
    input wire P,         // Posición Actual P
    input wire T,         // Posición Objetivo T
    
    // Entradas en cascada
    input wire mayor_in,          // P > T anterior
    input wire igual_in,          // P == T anterior
    input wire menor_in,          // P < T anterior
    
    // Salidas en cascada
    output wire mayor_out,        // P > T
    output wire igual_out,        // P == T
    output wire menor_out         // P < T
);

    // Señales intermedias de comparación
    wire bits_iguales;            // P == T
    wire pos_actual_mayor;        // P > T
    wire pos_actual_menor;        // P < T

    // Lógica del bit actual
    assign bits_iguales     = ~(P ^ T);     // XNOR
    assign pos_actual_mayor = P & (~T);     // 1 y 0
    assign pos_actual_menor = (~P) & T;     // 0 y 1

    // Salidas en cascada (mantiene prioridad de los bits más significativos)
    assign mayor_out = mayor_in | (igual_in & pos_actual_mayor);    // P>T
    assign menor_out = menor_in | (igual_in & pos_actual_menor);    // P<T
    assign igual_out = igual_in & bits_iguales;                     // P=T

endmodule