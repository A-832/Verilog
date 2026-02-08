`timescale 1ns/1ps

module tb_RCA;

    reg  [3:0] A;
    reg  [3:0] B;
    reg        cin;
    wire [3:0] s;
    wire       cout;

    // Instantiate DUT
    RCA dut (
        .A(A),
        .B(B),
        .cin(cin),
        .s(s),
        .cout(cout)
    );

    initial begin
        // EPWave dump commands
        $dumpfile("RCA.vcd");
        $dumpvars(0, tb_RCA);

        // Apply test vectors
        A = 4'b0000; B = 4'b0000; cin = 0; #10;
        A = 4'b0001; B = 4'b0010; cin = 0; #10;
        A = 4'b0101; B = 4'b0011; cin = 0; #10;
        A = 4'b1111; B = 4'b0001; cin = 0; #10;
        A = 4'b1010; B = 4'b0101; cin = 1; #10;
        A = 4'b1111; B = 4'b1111; cin = 1; #10;

        #10 $finish;
    end

endmodule