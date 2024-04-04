module EulerTotient(
    input R, clk_0, // these are the inputs which is R = Reset and clk_0 = Clock signal
    output A, B, C, D, E, F, G // these are the outputs
);

    wire [3:0] totient_value; // this is the 4-bit signal to store the current totient value
    wire [6:0] segments; // this is the 7-bit output for the 7-segment display

    SevenSegDecoder decoder( // this converts the 4-bit input to 7-segment display
        .input_value(totient_value),
        .segments(segments)
    );              

    TotientVal totient( // this generates the totient values for the first 16 numbers
        .clock(clk_0),
        .reset(R),
        .value(totient_value)
    );  

    assign {A, B, C, D, E, F, G} = segments; // 7-bit output will be assigned to the 7-segment display

endmodule

module TotientVal(
    input clock, reset,
    output reg [3:0] value // the 4-bit output which represents the Euler Totient value
);

    reg [3:0] val[15:0]; // array of the totient values for numbers 0-15
    reg [4:0] index = 1;    // this is the index to access the values array

    // Totient values for the first 16 numbers
    initial begin
        val[0] = 4'b0001; // 1
        val[1] = 4'b0001; // 1
        val[2] = 4'b0010; // 2
        val[3] = 4'b0010; // 2
        val[4] = 4'b0100; // 4
        val[5] = 4'b0010; // 2
        val[6] = 4'b0110; // 6
        val[7] = 4'b0100; // 4
        val[8] = 4'b0110; // 6
        val[9] = 4'b0100; // 4
        val[10] = 4'b1010; // 10 or A
        val[11] = 4'b0100; // 4
        val[12] = 4'b1100; // 12 or C
        val[13] = 4'b0110; // 6
        val[14] = 4'b1000; // 8
        val[15] = 4'b1000; // 8
    end

    reg direction = 0; // 0 for forward and 1 for the reverse
   
    // the logic to cycle through the totient values in forward and reverse directions
   always @(posedge clock or posedge reset) begin
    if (reset) begin
        index <= 1; // reset to 1
        direction <= 0; // reset to forward which is 0
    end
    else begin
        index <= (direction == 0 && index == 15) ? 15 : // switch to reverse direction if the index is 15
                 (direction == 1 && index == 0) ? 0 : // switch to forward direction if index is 0
                 (direction == 0) ? index + 1 : index - 1; // Increment index if direction is forward, decrement otherwise

        // this change the direction logic             
        direction <= (direction == 0 && index == 15) ? 1 : // switch direction if index is at the upper boundary
                     (direction == 1 && index == 0) ? 0 : // Switch direction if index is at the lower boundary
                     direction; // Keep direction unchanged otherwise
    end

    value <= val[index]; // this assign the corresponding totient value to the output
end

endmodule

module SevenSegDecoder(
    input [3:0] input_value, // this is the 4-bit value that is representing the number to display
    output reg [6:0] segments // this is the 7-bit signal to control the segments of the display
);
    always @* begin // this is the seven segment display decoder
        case(input_value)
            4'b0001: segments = 7'b0110000; // 1
            4'b0010: segments = 7'b1101101; // 2
            4'b0100: segments = 7'b0110011; // 4
            4'b0110: segments = 7'b1011111; // 6
            4'b1000: segments = 7'b1111111; // 8
            4'b1010: segments = 7'b1110111; // A or 10
            4'b1100: segments = 7'b1001110; // C or 12
            default: segments = 7'b0000000; // 0
        endcase
    end
endmodule
