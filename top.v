//module top

`timescale 1ns / 1ps
module top(
    input clk,
    input reset,
    input preset,
    input [7:0] preset_input,
    output reg tpulse
    );
    
reg [7:0] count;
always @(posedge clk)
begin
    if(reset == 1'b1)
    begin
        count = 0;
        tpulse = 0;
    end
    if(preset == 1'b1)
    begin
        count = preset_input;
    end
    else
    begin
        if(count < 8'd255)
        begin
            count <= count + 1;
            tpulse <= 1'b0;
        end
        else
        begin
            tpulse <= 1'b1;
            count <= 8'b0;
        end
    end
end
endmodule

