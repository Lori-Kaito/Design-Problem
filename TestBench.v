`timescale 1ns / 1ps
 
 module TestBench();
    reg R, clk_0;
    wire A, B, C, D, E, F, G;
    reg [3:0] num;
 
 EulerTotient DUT0(R, clk_0, A, B, C, D, E, F, G);
 
 always begin
    clk_0 = 0;
    forever #1000 clk_0 = ~clk_0;
 end

 always @(posedge clk_0) begin
            R=0;
            #100
            R=1;
            #2000
            $display("R=%b clk_0=%b ABCDEFG = %b%b%b%b%b%b%b", R, clk_0, A, B, C, D, E ,F, G, " (One)"); // 1
            #2000
            $display("R=%b clk_0=%b ABCDEFG = %b%b%b%b%b%b%b", R, clk_0, A, B, C, D, E ,F, G, " (One)"); // 1
            #2000
            $display("R=%b clk_0=%b ABCDEFG = %b%b%b%b%b%b%b", R, clk_0, A, B, C, D, E ,F, G, " (One) Start"); // 1
            R=0;
            #2000
            $display("R=%b clk_0=%b ABCDEFG = %b%b%b%b%b%b%b", R, clk_0, A, B, C, D, E ,F, G, " (One)"); // 1
            #2000
            $display("R=%b clk_0=%b ABCDEFG = %b%b%b%b%b%b%b", R, clk_0, A, B, C, D, E ,F, G, " (Two)"); // 2
            #2000
            $display("R=%b clk_0=%b ABCDEFG = %b%b%b%b%b%b%b", R, clk_0, A, B, C, D, E ,F, G, " (Two)"); // 2
            #2000
            $display("R=%b clk_0=%b ABCDEFG = %b%b%b%b%b%b%b", R, clk_0, A, B, C, D, E ,F, G, " (Four)"); // 4
            #2000
            $display("R=%b clk_0=%b ABCDEFG = %b%b%b%b%b%b%b", R, clk_0, A, B, C, D, E ,F, G, " (Two)"); // 2
            #2000
            $display("R=%b clk_0=%b ABCDEFG = %b%b%b%b%b%b%b", R, clk_0, A, B, C, D, E ,F, G, " (Six)"); // 6
            #2000
            $display("R=%b clk_0=%b ABCDEFG = %b%b%b%b%b%b%b", R, clk_0, A, B, C, D, E ,F, G, " (Four)"); // 4
            #2000
            $display("R=%b clk_0=%b ABCDEFG = %b%b%b%b%b%b%b", R, clk_0, A, B, C, D, E ,F, G, " (Six)"); // 6
            #2000
            $display("R=%b clk_0=%b ABCDEFG = %b%b%b%b%b%b%b", R, clk_0, A, B, C, D, E ,F, G, " (Four)"); // 4
            #2000
            $display("R=%b clk_0=%b ABCDEFG = %b%b%b%b%b%b%b", R, clk_0, A, B, C, D, E ,F, G, " (Ten or A)"); // 10 or A
            #2000
            $display("R=%b clk_0=%b ABCDEFG = %b%b%b%b%b%b%b", R, clk_0, A, B, C, D, E ,F, G, " (Four)"); // 4
            #2000
            $display("R=%b clk_0=%b ABCDEFG = %b%b%b%b%b%b%b", R, clk_0, A, B, C, D, E ,F, G, " (Twelve or C)"); // 12 or C 
            #2000
            $display("R=%b clk_0=%b ABCDEFG = %b%b%b%b%b%b%b", R, clk_0, A, B, C, D, E ,F, G, " (Six)"); // 6
            #2000
            $display("R=%b clk_0=%b ABCDEFG = %b%b%b%b%b%b%b", R, clk_0, A, B, C, D, E ,F, G, " (Eight)"); // 8
            #2000
            $display("R=%b clk_0=%b ABCDEFG = %b%b%b%b%b%b%b", R, clk_0, A, B, C, D, E ,F, G, " (Eight) End"); // 8
            $display("\n");
            #2000
            $display("R=%b clk_0=%b ABCDEFG = %b%b%b%b%b%b%b", R, clk_0, A, B, C, D, E ,F, G, " (One) Start"); // 1
            R=0;
            #2000
            $display("R=%b clk_0=%b ABCDEFG = %b%b%b%b%b%b%b", R, clk_0, A, B, C, D, E ,F, G, " (One)"); // 1
            #2000
            $display("R=%b clk_0=%b ABCDEFG = %b%b%b%b%b%b%b", R, clk_0, A, B, C, D, E ,F, G, " (Two)"); // 2
            #2000
            $display("R=%b clk_0=%b ABCDEFG = %b%b%b%b%b%b%b", R, clk_0, A, B, C, D, E ,F, G, " (Two)"); // 2
            #2000
            $display("R=%b clk_0=%b ABCDEFG = %b%b%b%b%b%b%b", R, clk_0, A, B, C, D, E ,F, G, " (Four)"); // 4
            #2000
            $display("R=%b clk_0=%b ABCDEFG = %b%b%b%b%b%b%b", R, clk_0, A, B, C, D, E ,F, G, " (Two)"); // 2
            #2000
            $display("R=%b clk_0=%b ABCDEFG = %b%b%b%b%b%b%b", R, clk_0, A, B, C, D, E ,F, G, " (Six)"); // 6
            #2000
            $display("R=%b clk_0=%b ABCDEFG = %b%b%b%b%b%b%b", R, clk_0, A, B, C, D, E ,F, G, " (Four)"); // 4
            #2000
            $display("R=%b clk_0=%b ABCDEFG = %b%b%b%b%b%b%b", R, clk_0, A, B, C, D, E ,F, G, " (Six)"); // 6
            #2000
            $display("R=%b clk_0=%b ABCDEFG = %b%b%b%b%b%b%b", R, clk_0, A, B, C, D, E ,F, G, " (Four)"); // 4
            #2000
            $display("R=%b clk_0=%b ABCDEFG = %b%b%b%b%b%b%b", R, clk_0, A, B, C, D, E ,F, G, " (Ten or A)"); // 10 or A
            #2000
            $display("R=%b clk_0=%b ABCDEFG = %b%b%b%b%b%b%b", R, clk_0, A, B, C, D, E ,F, G, " (Four)"); // 4
            #2000
            $display("R=%b clk_0=%b ABCDEFG = %b%b%b%b%b%b%b", R, clk_0, A, B, C, D, E ,F, G, " (Twelve or C)"); // 12 or C 
            #2000
            $display("R=%b clk_0=%b ABCDEFG = %b%b%b%b%b%b%b", R, clk_0, A, B, C, D, E ,F, G, " (Six)"); // 6
            #2000
            $display("R=%b clk_0=%b ABCDEFG = %b%b%b%b%b%b%b", R, clk_0, A, B, C, D, E ,F, G, " (Eight)"); // 8
            #2000
            $display("R=%b clk_0=%b ABCDEFG = %b%b%b%b%b%b%b", R, clk_0, A, B, C, D, E ,F, G, " (Eight) End"); // 8
            $display("\n");
           /* R=1;
            #2000
            $display("R=%b clk_0=%b ABCDEFG = %b%b%b%b%b%b%b", R, clk_0, A, B, C, D, E ,F, G, " (Eight) Start"); // 8
            #2000
            $display("R=%b clk_0=%b ABCDEFG = %b%b%b%b%b%b%b", R, clk_0, A, B, C, D, E ,F, G, " (Eight)"); // 8
            #2000
            $display("R=%b clk_0=%b ABCDEFG = %b%b%b%b%b%b%b", R, clk_0, A, B, C, D, E ,F, G, " (Six)"); // 6
            #2000
            $display("R=%b clk_0=%b ABCDEFG = %b%b%b%b%b%b%b", R, clk_0, A, B, C, D, E ,F, G, " (Twelve or C)"); // 12 or C 
            #2000
            $display("R=%b clk_0=%b ABCDEFG = %b%b%b%b%b%b%b", R, clk_0, A, B, C, D, E ,F, G, " (Four)"); // 4
            #2000
            $display("R=%b clk_0=%b ABCDEFG = %b%b%b%b%b%b%b", R, clk_0, A, B, C, D, E ,F, G, " (Ten or A)"); // 10 or A
            #2000
            $display("R=%b clk_0=%b ABCDEFG = %b%b%b%b%b%b%b", R, clk_0, A, B, C, D, E ,F, G, " (Four)"); // 4
            #2000
            $display("R=%b clk_0=%b ABCDEFG = %b%b%b%b%b%b%b", R, clk_0, A, B, C, D, E ,F, G, " (Six)"); // 6
            #2000
            $display("R=%b clk_0=%b ABCDEFG = %b%b%b%b%b%b%b", R, clk_0, A, B, C, D, E ,F, G, " (Four)"); // 4
            #2000
            $display("R=%b clk_0=%b ABCDEFG = %b%b%b%b%b%b%b", R, clk_0, A, B, C, D, E ,F, G, " (Six)"); // 6
            #2000
            $display("R=%b clk_0=%b ABCDEFG = %b%b%b%b%b%b%b", R, clk_0, A, B, C, D, E ,F, G, " (Two)"); // 2
            #2000
            $display("R=%b clk_0=%b ABCDEFG = %b%b%b%b%b%b%b", R, clk_0, A, B, C, D, E ,F, G, " (Four)"); // 4
            #2000
            $display("R=%b clk_0=%b ABCDEFG = %b%b%b%b%b%b%b", R, clk_0, A, B, C, D, E ,F, G, " (Two)"); // 2
            #2000
            $display("R=%b clk_0=%b ABCDEFG = %b%b%b%b%b%b%b", R, clk_0, A, B, C, D, E ,F, G, " (Two)"); // 2
            #2000
            $display("R=%b clk_0=%b ABCDEFG = %b%b%b%b%b%b%b", R, clk_0, A, B, C, D, E ,F, G, " (One)"); // 1
            
            #2000
            $display("R=%b clk_0=%b ABCDEFG = %b%b%b%b%b%b%b", R, clk_0, A, B, C, D, E ,F, G, " (One) End"); // 1
             add more tests as needed*/
    $finish;
 end

 endmodule