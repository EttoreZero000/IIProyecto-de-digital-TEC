module decodificador_7seg (
    input wire [3:0] valor,
    output wire [6:0] segmentos
);
    // Asignación puramente combinacional basada en tabla de verdad
    assign segmentos = 
        (valor == 4'd0) ? 7'b1000000 :
        (valor == 4'd1) ? 7'b1111001 :
        (valor == 4'd2) ? 7'b0100100 :
        (valor == 4'd3) ? 7'b0110000 :
        (valor == 4'd4) ? 7'b0011001 :
        (valor == 4'd5) ? 7'b0010010 :
        (valor == 4'd6) ? 7'b0000010 :
        (valor == 4'd7) ? 7'b1111000 :
        (valor == 4'd8) ? 7'b0111111 : // Guion '-'
        (valor == 4'd9) ? 7'b0000110 : // Letra 'E'
                          7'b1111111; // Default: apagado
endmodule