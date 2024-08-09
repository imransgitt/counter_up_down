`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.08.2024 12:30:52
// Design Name: 
// Module Name: counter
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



module counter #(parameter N = 3) (
        input i_clk,i_rst,i_en,i_up_down,
        output reg [N-1:0]o_Q
);

always@(posedge i_clk , posedge i_rst , posedge i_en)
begin
        if(i_rst)
        begin
                o_Q<=0;
        end

        else
        begin
                if(i_en)
                begin
                        o_Q <= (i_up_down) ? ((o_Q==6)?(0):(o_Q+1'b1)) : ((o_Q==0)?(6):(o_Q-1'b1));
                end
                else
                begin
                        o_Q <= o_Q;
                end
        end

end

endmodule
