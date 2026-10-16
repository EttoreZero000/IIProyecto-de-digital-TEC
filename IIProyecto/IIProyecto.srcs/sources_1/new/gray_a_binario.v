module gray_a_binario (
    input wire [2:0] gray,
    output wire [2:0] bin
);
    // Conversión combinacional pura de Gray a Binario natural de 3 bits
    assign bin[2] = gray[2];
    assign bin[1] = gray[2] ^ gray[1];
    assign bin[0] = gray[2] ^ gray[1] ^ gray[0];
endmodule