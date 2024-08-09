`timescale 1ns / 1ps

//MOD N counter-->counting from 0 to N-1
//K-->number of bits

module counter #(parameter N = 7, K=3 ) (
        input i_clk,i_rst,i_en,i_up_down,
        output reg [K-1:0]o_Q
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
                        o_Q <= (i_up_down) ? ((o_Q==N-1)?(0):(o_Q+1'b1)) : ((o_Q==0)?(N-1):(o_Q-1'b1));
                end
                else
                begin
                        o_Q <= o_Q;
                end
        end

end

endmodule
