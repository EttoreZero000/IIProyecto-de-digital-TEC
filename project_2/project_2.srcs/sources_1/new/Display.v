`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/29/2026 07:24:02 AM
// Design Name: 
// Module Name: Display
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


module Display(
    input clk,
    input [15:0] sw,
    output [6:0] seg,
    output [3:0] an
    );
    
    //Divisor de frecuencia
    reg [17:0] counter = 0;
    
    always @(posedge clk) begin
        counter <= counter + 1;
    end
    
    wire display_clk = counter[17];
    wire display_clock;
    BUFG clkdbuf (.I(display_clk),.O(display_clock));

    //Cambio del displya encendido en cada ciclo de reloj
    reg [1:0] which_digit = 0;
    always @(posedge display_clock) begin
        which_digit <= which_digit+1;
    end

    //Configuracion del numero que se desea mostrar en cada uno de los segmentos
    wire [6:0] dp1, dp2, dp3, dp4;
    Num_seg d1(.number(sw[3:0]), .seg(dp1));
    Num_seg d2(.number(sw[7:4]), .seg(dp2));
    Num_seg d3(.number(sw[11:8]), .seg(dp3));
    Num_seg d4(.number(sw[15:12]), .seg(dp4));

    //Variacion continua del display que se encuntra encedido en cada cliclo de reloj

    reg [6:0] segments;
    reg [3:0] anode;

    always @(posedge display_clock) begin
        case(which_digit)
        'h0: begin
            anode <= 'b1110;
            segments <=dp1;
        end
        'h1: begin
            anode <= 'b1101;
            segments <=dp2;
        end
        'h2: begin
            anode <= 'b1011;
            segments <=dp3;
        end
        'h3: begin
            anode <= 'b0111;
            segments <=dp4;
        end
        endcase
    end

    assign seg = segments;
    assign an = anode;

endmodule
