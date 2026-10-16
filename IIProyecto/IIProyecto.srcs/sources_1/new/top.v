module top (
    input wire [2:0] G_input,    // Entradas del codificador óptico Gray (G2, G1, G0)
    input wire [2:0] T_input,    // Posición objetivo desde interruptores (T2, T1, T0)
    input wire EN_input,         // Habilitación del sistema
    input wire STOP_input,       // Paro de emergencia
    
    output wire [1:0] motor_out, // {IN1, IN2}
    output wire led_pos,         // LEDPOS
    output wire led_mov,         // LEDMOV
    output wire led_alarm,       // LEDALARM (External current-sinking)
    output wire [2:0] led_target,// LEDs LD2-LD0 reflejan T2T1T0
    output wire [6:0] seg,       // Segmentos del display (a-g)
    output wire [3:0] an         // Ánodos del display de 7 segmentos
);

    // Cables internos de interconexión
    wire [2:0] pos_actual_bin;
    wire p_menor, p_igual, p_mayor;
    wire [3:0] selector_display;

    // 1. Instancia del Convertidor Gray a Binario
    gray_a_binario u_gray2bin (
        .gray(G_input),
        .bin(pos_actual_bin)
    );

    // 2. Instancia del Comparador de 3 bits
    comparador_3bits u_comparador (
        .pos_actual(pos_actual_bin),
        .pos_objetivo(T_input),
        .P_es_menor(p_menor),
        .P_es_igual(p_igual),
        .P_es_mayor(p_mayor)
    );

    // 3. Instancia de la Lógica de Control del Motor e Indicadores
    control_sistema u_control (
        .P(pos_actual_bin),
        .T(T_input),
        .P_menor(p_menor),
        .P_igual(p_igual),
        .P_mayor(p_mayor),
        .EN(EN_input),
        .STOP(STOP_input),
        .IN_motor(motor_out),
        .LEDPOS(led_pos),
        .LEDMOV(led_mov),
        .LEDALARM(led_alarm),
        .sel_display(selector_display)
    );

    // 4. Instancia del Decodificador de 7 Segmentos
    decodificador_7seg u_dec7seg (
        .valor(selector_display),
        .segmentos(seg)
    );

    // 5. Solo habilitar el display derecho
    assign an = 4'b1110;

    // 6. reflejar los leds del objectivo
    assign led_target = T_input;

endmodule