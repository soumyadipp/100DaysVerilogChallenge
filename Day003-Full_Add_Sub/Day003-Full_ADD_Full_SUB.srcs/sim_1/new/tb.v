module tb(

    );
    
    reg a,
        b,
        c_in,
        b_in;
        
    wire Sum,
         c_out,
         Diff,
         b_out;
         
         
 Full_Add_Full_Sub UUT(
.a(a),
.b(b),
.c_in(c_in),
.b_in(b_in),
.c_out(c_out),
.b_out(b_out),
.Sum(Sum),
.Diff(Diff)
     );
                    
initial begin
a=0;b=0;c_in=0;b_in=0;
#100
a=0;b=1;c_in=0;b_in=0;
#100
a=1;b=0;c_in=0;b_in=0;
#100
a=1;b=1;c_in=0;b_in=0;
#100
a=0;b=0;c_in=1;b_in=1;
#100
a=0;b=1;c_in=1;b_in=1;
#100
a=1;b=0;c_in=1;b_in=1;
#100
a=1;b=1;c_in=1;b_in=1;
end 

endmodule
