module EulerTotient(R, clk_0, A, B, C, D, E, F, G);
    input R, clk_0; // inputs
    output wire A, B, C, D, E, F, G; // outputs

    reg [3:0] current_value; // this is the internal register to store the current value being displayed

    reg [3:0] totient_rom [0:15]; // this is the ROM to store the pre calculated Euler's Totient values

    // this initialize ROM with Euler's Totient sequence
    initial begin
        totient_rom[0] = 4'b0001; totient_rom[1] = 4'b0001; totient_rom[2] = 4'b0010; 
        totient_rom[3] = 4'b0010; totient_rom[4] = 4'b0100; totient_rom[5] = 4'b0010;
        totient_rom[6] = 4'b0110; totient_rom[7] = 4'b0100; totient_rom[8] = 4'b0110; 
        totient_rom[9] = 4'b0100; totient_rom[10] = 4'b1010; totient_rom[11] = 4'b0100;
        totient_rom[12] = 4'b1100; totient_rom[13] = 4'b0110; totient_rom[14] = 4'b1000;
        totient_rom[15] = 4'b1000;
    end

    // the logic to cycle through ROM values and handle the reset
    always @(posedge clk_0) begin
        if (R) begin // this resets if R is high
            current_value <= 0; 
        end else begin
            current_value <= (current_value == 15) ? 0 : current_value + 1; // increment or reset
        end
    end

    // pass the current value to the decoder
    bcd_to_7seg_display my_decoder (totient_rom[current_value], A, B, C, D, E, F, G);
endmodule

module bcd_to_7seg_display (bcd_in, A, B, C, D, E, F, G);
    input [3:0] bcd_in; // inputs
    output reg A, B, C, D, E, F, G; // outputs

    always @(*) begin // this is the combinational logic to decode BCD and light up segments
        case (bcd_in)
            4'b0001: {A, B, C, D, E, F, G} = 7'b0110000; // 1
            4'b0010: {A, B, C, D, E, F, G} = 7'b1101101; // 2
            4'b0100: {A, B, C, D, E, F, G} = 7'b0110011; // 4
            4'b0110: {A, B, C, D, E, F, G} = 7'b1011111; // 6
            4'b1000: {A, B, C, D, E, F, G} = 7'b1111111; // 8
            4'b1010: {A, B, C, D, E, F, G} = 7'b1110111; // A or 10
            4'b1100: {A, B, C, D, E, F, G} = 7'b1001110; // C or 12
            default: {A, B, C, D, E, F, G} = 7'b0000000; // 0
        endcase
    end
endmodule
