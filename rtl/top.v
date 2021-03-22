`timescale 1ns / 1ps

module top(
    input           [9:0]   SW,
    input           [7:0]   AN,
    input                   DP,
    output          [6:0]   HEX
    );
    
    reg [3:0] rg;

    assign AN = 'b0000_0001;
    assign DP = 'b1;
    
    always @(*) begin
        case(SW[9:8])
            'b00: rg[3:0] = SW[3:0]/2.5;
            'b01: rg[3:0] = 4-(SW[7]+SW[6]+SW[5]+SW[4]);
            'b10: rg[3:0] = (~SW[0])&(~SW[1])^(SW[2] | SW[3]);
            'b11: rg[3:0] = SW[3:0];
        endcase
    end

    decoder dec(.x(rg), .y(HEX));

endmodule
