module Question_449(F1, F2, A, B, C, D);
output F1;
output F2;
input A, B, C, D;
wire T1, T2, T3, T4, n1Out, n2Out, n3Out;

//Set up prims
not n1(n1Out, B);
and a1(T1, n1Out, C);
or o1(T3, T1, A);
not n2(n2Out, A);
and a2(T2, n2Out, B);
not n3(n3Out, D);
xor x1(T4, T2, D);
or o2(F1, T4, T3);
or o3(F2, T2, n3Out);

endmodule       
 
module t_Question_449;
reg tA,tB,tC,tD;
wire tF1, tF2;

Question_449 tM(tF1, tF2, tA, tB, tC, tD);

initial 
	begin 
	    tA = 0; tB = 0; tC = 0; tD = 0;
	#10 tA = 0; tB = 0; tC = 0; tD = 1;	
   	#10 tA = 0; tB = 0; tC = 1; tD = 0;
	#10 tA = 0; tB = 0; tC = 1; tD = 1;
        #10 tA = 0; tB = 1; tC = 0; tD = 0;
	#10 tA = 0; tB = 1; tC = 0; tD = 1;
        #10 tA = 0; tB = 1; tC = 1; tD = 0;
        #10 tA = 0; tB = 1; tC = 1; tD = 1;
        #10 tA = 1; tB = 0; tC = 0; tD = 0;
	#10 tA = 1; tB = 0; tC = 0; tD = 1;
        #10 tA = 1; tB = 0; tC = 1; tD = 0;
        #10 tA = 1; tB = 0; tC = 1; tD = 1;
        #10 tA = 1; tB = 1; tC = 0; tD = 0;
        #10 tA = 1; tB = 1; tC = 0; tD = 1;
        #10 tA = 1; tB = 1; tC = 1; tD = 0;
        #10 tA = 1; tB = 1; tC = 1; tD = 1;
	end

initial 
	begin 
	$monitor("F1 = %b F2 = %b A = %b B = %b	C = %b D = %b ", tF1, tF2, tA, tB, tC, tD);
	end
endmodule
