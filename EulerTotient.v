module EulerTotient(R, clk_0, A, B, C, D, E, F, G);
    input R, clk_0;
    output wire A, B, C, D, E, F, G;

    reg [3:0] current_value; 
    reg [3:0] totient_rom [0:15]; 

    // Initialize ROM with Euler's Totient sequence
    initial begin
        totient_rom[0] = 4'b0001; totient_rom[1] = 4'b0001; totient_rom[2] = 4'b0010; 
        totient_rom[3] = 4'b0010; totient_rom[4] = 4'b0100; totient_rom[5] = 4'b0010;
        totient_rom[6] = 4'b0110; totient_rom[7] = 4'b0100; totient_rom[8] = 4'b0110; 
        totient_rom[9] = 4'b0100; totient_rom[10] = 4'b1010; totient_rom[11] = 4'b0100;
        totient_rom[12] = 4'b1100; totient_rom[13] = 4'b0110; totient_rom[14] = 4'b1000;
        totient_rom[15] = 4'b1000;
    end

    always @(posedge clk_0) begin
        if (R) begin
            current_value <= 0; 
        end else begin
            current_value <= (current_value == 15) ? 0 : current_value + 1; 
        end
    end

    // BCD to 7-segment decoder
    bcd_to_7seg_display my_decoder (totient_rom[current_value], A, B, C, D, E, F, G);
endmodule

module bcd_to_7seg_display (bcd_in, A, B, C, D, E, F, G);
    input [3:0] bcd_in; 
    output reg A, B, C, D, E, F, G;

    always @(*) begin
        case (bcd_in)
            4'b0000: {A, B, C, D, E, F, G} = 7'b1111110; // Digit 0
            4'b0001: {A, B, C, D, E, F, G} = 7'b0110000; // Digit 1
            4'b0010: {A, B, C, D, E, F, G} = 7'b1101101; // Digit 2
            4'b0011: {A, B, C, D, E, F, G} = 7'b1111001; // Digit 3
            4'b0100: {A, B, C, D, E, F, G} = 7'b0110011; // Digit 4
            4'b0101: {A, B, C, D, E, F, G} = 7'b1011011; // Digit 5
            4'b0110: {A, B, C, D, E, F, G} = 7'b1011111; // Digit 6
            4'b0111: {A, B, C, D, E, F, G} = 7'b1110000; // Digit 7
            4'b1000: {A, B, C, D, E, F, G} = 7'b1111111; // Digit 8
            4'b1001: {A, B, C, D, E, F, G} = 7'b1111011; // Digit 9
            4'b1010: {A, B, C, D, E, F, G} = 7'b1110111; // Digit A or 10
            4'b1100: {A, B, C, D, E, F, G} = 7'b0011111; // Digit C or 12
        endcase
    end
endmodule
