module control_sistema (
    input wire [2:0] P,          // Posición actual (binaria)
    input wire [2:0] T,          // Posición objetivo (binaria)
    input wire P_menor,          // P < T
    input wire P_igual,          // P = T
    input wire P_mayor,          // P > T
    input wire EN,               // Habilitación (0 = habilitado, 1 = deshabilitado)
    input wire STOP,             // Paro de emergencia (0 = activado, 1 = normal)
    
    output reg [1:0] IN_motor,   // Control del Puente H {IN1, IN2}
    output reg LEDPOS,           // LED de posición alcanzada
    output reg LEDMOV,           // LED de movimiento
    output reg LEDALARM,         // LED de alarma (Active-Low)
    output reg [3:0] sel_display // Selector interno para el display
);

    always @* begin
        // Valores por defecto para evitar latches (lógica combinacional pura)
        IN_motor    = 2'b00;
        LEDPOS      = 1'b0;
        LEDMOV      = 1'b0;
        LEDALARM    = 1'b1; 
        sel_display = {1'b0, P};

        // 1. Prioridad Máxima: Paro de Emergencia (STOP = 0)
        if (STOP == 1'b0) begin
            IN_motor    = 2'b00;
            LEDPOS      = 1'b0;
            LEDMOV      = 1'b0;
            LEDALARM    = 1'b0;        // Alarma encendida (Active-Low)
            sel_display = 4'd9;        // Código para mostrar 'E'
        end
        // 2. Segunda Prioridad: Sistema Deshabilitado (STOP = 1, EN = 1)
        else if (EN == 1'b1) begin
            IN_motor    = 2'b00;
            LEDPOS      = 1'b0;
            LEDMOV      = 1'b0;
            LEDALARM    = 1'b1;
            sel_display = 4'd8;        // Código para mostrar '-'
        end
        // 3. Tercera Prioridad: Posicionamiento Normal (STOP = 1, EN = 0)
        else begin
            LEDALARM    = 1'b1;
            sel_display = {1'b0, P};

            if (P_menor) begin         // P < T -> Giro horario
                IN_motor = 2'b10;
                LEDMOV   = 1'b1;
                LEDPOS   = 1'b0;
            end
            else if (P_mayor) begin    // P > T -> Giro antihorario
                IN_motor = 2'b01;
                LEDMOV   = 1'b1;
                LEDPOS   = 1'b0;
            end
            else if (P_igual) begin    // P = T -> Freno activo
                IN_motor = 2'b11;
                LEDMOV   = 1'b0;
                LEDPOS   = 1'b1;
            end
            else begin
                IN_motor = 2'b00;
                LEDMOV   = 1'b0;
                LEDPOS   = 1'b0;
            end
        end
    end
endmodule