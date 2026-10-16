`timescale 1ns / 1ps

module tb_top;

    // Entradas como registros (reg)
    reg [2:0] G_input;
    reg [2:0] T_input;
    reg EN_input;
    reg STOP_input;

    // Salidas como cables (wire)
    wire [1:0] motor_out;
    wire led_pos;
    wire led_mov;
    wire led_alarm;
    wire [2:0] led_target;
    wire [6:0] seg;
    wire [3:0] an;

    // Contador de 8 bits para las 256 combinaciones posibles (0 a 255)
    // [7]   -> STOP_input
    // [6]   -> EN_input
    // [5:3] -> G_input (Gray: G2, G1, G0)
    // [2:0] -> T_input (Binario objetivo: T2, T1, T0)
    reg [7:0] combinacion;

    // Instancia del módulo principal (Top)
    top uut (
        .G_input(G_input),
        .T_input(T_input),
        .EN_input(EN_input),
        .STOP_input(STOP_input),
        .motor_out(motor_out),
        .led_pos(led_pos),
        .led_mov(led_mov),
        .led_alarm(led_alarm),
        .led_target(led_target),
        .seg(seg),
        .an(an)
    );

    // Mapeo continuo del vector de 8 bits hacia las entradas del sistema
    always @* begin
        STOP_input = combinacion[7];
        EN_input   = combinacion[6];
        G_input    = combinacion[5:3];
        T_input    = combinacion[2:0];
    end

    // Secuencia de pruebas exhaustiva
    initial begin
        $display("========================================================================================================");
        $display("                 VERIFICACION EXHAUSTIVA DE LAS 256 COMBINACIONES - MESA GIRATORIA TEC                  ");
        $display("========================================================================================================");
        $display(" #   | STOP | EN | Gray (G2G1G0) | Obj (T2T1T0) | Motor (IN1IN2) | L_POS | L_MOV | L_ALM | Segmentos (a-g)");
        $display("========================================================================================================");

        combinacion = 8'd0;
        #10;

        // Bucle que recorre estrictamente de 0 a 255 (256 combinaciones totales)
        repeat (256) begin
            #10; 
            
            // Imprime cada una de las 256 filas en la Tcl Console de Vivado
            $display("%3d  |  %b   | %b  |    %b     |    %b     |       %b        |   %b   |   %b   |   %b   |   %b  ",
                combinacion, STOP_input, EN_input, G_input, T_input, 
                motor_out, led_pos, led_mov, led_alarm, seg);

            combinacion = combinacion + 1;
        end

        #10;
        $display("========================================================================================================");
        $display(" ¡LAS 256 COMBINACIONES FUERON EVALUADAS EXITOSAMENTE! ");
        $display("========================================================================================================");
        $finish;
    end

endmodule