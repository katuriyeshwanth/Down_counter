module test;
reg clk,rst;
wire qa,qb,qc,qd;
down_counter dut(clk,rst,qa,qb,qc,qd);
    always #5 
        clk = ~clk;
    initial
        begin
            clk = 1'b0;
            rst = 1'b0;
                $monitor($time,"clk=%b,rst=%b,qa=%b,qb=%b,qc=%b,qd=%b",clk,rst,qa,qb,qc,qd);
            #10 rst = 1'b1;
        #175 $finish;
    end        
endmodule 
