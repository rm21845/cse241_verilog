module Question_436(y, x, V, D);
output y;
output x;
output V;
input [3:0] D;
wire  and1Out, or2Out;

//Instantiate prims
not n1(n1Out, D[2]);
and a1(and1Out, n1Out, D[1]);
or o1(y, and1Out, D[3]);
or o2(or2Out, D[2], D[3]);
assign x = or2Out;
or o3(V, or2Out, D[1], D[0]);
endmodule

//Testbench
module t_Question_436;
wire t_y, t_x, t_V;
reg [3:0] TD;

//Call module?
Question_436 tM(t_y, t_x, t_V, TD);

initial
    begin
    TD[3] = 0; TD[2] = 0; TD[1] = 0 ; TD[0] = 0;   
    #10 TD[3] = 0; TD[2] = 0; TD[1] = 0; TD[0] = 1;
    #10 TD[3] = 0; TD[2] = 0; TD[1] = 1; TD[0] = 0;
    #10 TD[3] = 0; TD[2] = 0; TD[1] = 1; TD[0] = 1;
    #10 TD[3] = 0; TD[2] = 1; TD[1] = 0; TD[0] = 0;
    #10 TD[3] = 0; TD[2] = 1; TD[1] = 0; TD[0] = 1;
    #10 TD[3] = 0; TD[2] = 1; TD[1] = 1; TD[0] = 0;
    #10 TD[3] = 0; TD[2] = 1; TD[1] = 1; TD[0] = 1;
    #10 TD[3] = 1; TD[2] = 0; TD[1] = 0; TD[0] = 0;
    #10 TD[3] = 1; TD[2] = 0; TD[1] = 0; TD[0] = 1;
    #10 TD[3] = 1; TD[2] = 0; TD[1] = 1; TD[0] = 0;
    #10 TD[3] = 1; TD[2] = 0; TD[1] = 1; TD[0] = 1;
    #10 TD[3] = 1; TD[2] = 1; TD[1] = 0; TD[0] = 0;
    #10 TD[3] = 1; TD[2] = 1; TD[1] = 0; TD[0] = 1;
    #10 TD[3] = 1; TD[2] = 1; TD[1] = 1; TD[0] = 0;
    #10 TD[3] = 1; TD[2] = 1; TD[1] = 1; TD[0] = 1;
    end

initial
    begin
    $monitor("time=",$time,,"y = %d x = %d V = %d D = %d ", t_y, t_x, t_V,
        TD[3], TD[2], TD[1], TD[0]);
    end
endmodule 
