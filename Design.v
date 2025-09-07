module JK_flipflop(j,k,rst,clk,q,q_bar);
input j,k,clk,rst;
output reg q;
output q_bar;
    always @ (posedge clk or negedge rst) 
        begin
            if (!rst)
                q <= 0;
            else
                case({j,k})
                    2'b00 : q <= q;
                    2'b01 : q <= 1'b0;
                    2'b10 : q <= 1'b1;
                    2'b11 : q <= ~q;
                endcase 
        end
    assign q_bar = ~q;
endmodule

module down_counter(clk,rst,qa,qb,qc,qd);
input clk,rst;
output qa,qb,qc,qd;

JK_flipflop j0(.j(1'b1),.k(1'b1),.rst(rst),.clk(clk),.q_bar(qa));
JK_flipflop j1(.j(1'b1),.k(1'b1),.rst(rst),.clk(qa),.q_bar(qb));
JK_flipflop j2(.j(1'b1),.k(1'b1),.rst(rst),.clk(qb),.q_bar(qc));
JK_flipflop j3(.j(1'b1),.k(1'b1),.rst(rst),.clk(qc),.q_bar(qd));
endmodule 
