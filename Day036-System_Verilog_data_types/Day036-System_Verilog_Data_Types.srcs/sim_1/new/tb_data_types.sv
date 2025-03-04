`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.03.2025 21:37:11
// Design Name: 
// Module Name: tb_data_types
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


module tb_data_types();
parameter Width = 4;

reg[Width-1:0] var_0;   // reg can only be driven in procedural blocks like always and initial
wire[Width-1:0] var_1;  //wire can only be used in assign statements
real pi,freq;
logic [Width-1:0] var_2; //4bit logic type variable,logic that can be driven in both procedural blocks and continuous assign statements
logic [Width-1:0] var_22;
logic var_3;             // 1bit logic type variable
bit[Width-1:0] var_4;    //4 bit 'bit' type variable,logic that can be driven in both procedural blocks and continuous assign statements
byte u_var_5;            //8bit  unsigned 'byte' type variable
byte signed s_var_5;     //8bit  signed 'byte' type variable
shortint us_var_6;       //2 state 16bit 'integer' type variable .Explicitly set to 'unsigned' and represents only positive numbers  (sign casting)
shortint var_6;          //2 state 16bit 'integer' type variable .By default signed, and can represent positive and negative numbers
int var_7;               //2 state 32bit 'integer' type variable .By default signed, and can represent positive and negative numbers
longint var_8;           //2 state 64bit 'integer' type variable .By default signed, and can represent positive and negative numbers
enum { RED,YELLOW,GREEN} light_1; //enumerated type defines a set of named values.int type; RED = 0, YELLOW = 1, GREEN = 2
enum bit[1:0] { Val_1,Val_2,Val_3} Val; //// bit type; Val_1 = 0, Val_2 = 1, Val_3 = 2
enum          {RED1=3, YELLOW1, GREEN1}       light_2;         // RED1 = 3, YELLOW1 = 4, GREEN1 = 5
enum          {RED2 = 4, YELLOW2 = 9, GREEN2} light_3;         // RED2 = 4, YELLOW2 = 9, GREEN2 = 10 (automatically assigned)
typedef enum {TRUE, FALSE} Answer;                             // "Answer" is a new data-type with two valid values: TRUE and FALSE

initial begin
Answer   answer;

		// Assign TRUE/FALSE to the enumerated variable
		answer = TRUE;

		// Display string value of the variable
		$display ("typedef enum|| answer = %s", answer.name);



light_1 = RED;
$display ("enum|| light_1_RED = %0d", light_1);
light_1 = YELLOW;
$display ("enum|| light_1_YELLOW = %0d", light_1);
light_1 = GREEN;
$display ("enum|| light_1_GREEN = %0d", light_1);

light_2 = RED1;
$display ("enum|| light_2_RED = %0d", light_2);
light_2 = YELLOW1;
$display ("enum|| light_2_YELLOW = %0d", light_2);
light_2 = GREEN1;
$display ("enum|| light_2_GREEN = %0d", light_2);


light_3 = RED2;
$display ("enum|| light_3_RED = %0d", light_3);
light_3 = YELLOW2;
$display ("enum|| light_3_YELLOW = %0d", light_3);
light_3 = GREEN2;
$display ("enum|| light_3_GREEN = %0d", light_3);




var_0 = 'h0;     // Fills all bits of var_0 with 0
$display("reg|| var_0=0x%0h", var_0);
var_0 = 'hZ;     // Fills all bits of var_0 with Z
$display("reg|| var_0=0x%0h", var_0);
var_0 = 'hX;     // Fills all bits of var_0 with X
$display("reg|| var_0=0x%0h", var_0);
var_0 = 'h1;     // Only LSB is 1 making the value of var_0 = 4'0001
$display("reg|| var_0=0x%0h", var_0);
pi   = 3.14;    // Store floating point number
freq = 1e6; 	// Store exponential number
$display ("real|| Value of pi = %f", pi);
$display ("real|| Value of pi = %0.3f", pi);
$display ("real|| Value of freq = %0d", freq);
$display("logic|| var_2=0x%0h, var_3=0x%0h", var_2,var_3);
var_2=4'hb;
$display("logic|| var_2=0x%0h, var_3=0x%0h", var_2,var_3);
#5 $display("logic|| var_2=0x%0h, var_3=0x%0h", var_2,var_3);
var_22=4'b10xz;
var_4=var_22;  // If a logic type or any 4-state variable assigns its value to a "bit" type variable, then X and Z get converted to zero
$display("logic & bit|| var_22=%0b, var_4=%0b", var_22,var_4);
s_var_5  = 0;           // assign 0
$display("signed_byte|| s_var_5='d%0d", s_var_5);
s_var_5  = 2**7 - 1; 	// assign 127
$display("signed_byte|| s_var_5='d%0d", s_var_5);
s_var_5  = 2**7;        // assign 128
$display("signed_byte|| s_var_5='d%0d", s_var_5);
s_var_5  = -2**8 + 1;    // assign -255
$display("signed_byte|| s_var_5='d%0d", s_var_5);

u_var_5  = -2**8 + 1;    // assign -255
$display("unsigned_byte|| u_var_5='d%0d", u_var_5);


var_6  = 0;           // assign 0
$display("signed_shortint|| var_6='d%0d", var_6);
var_6  = 2**7 - 1; 	// assign 127
$display("signed_shortint|| var_6='d%0d", var_6);
var_6  = 2**7;        // assign 128
$display("signed_shortint|| var_6='d%0d", var_6);
var_6  = 2**8 - 1;    // assign 255
$display("signed_shortint|| var_6='d%0d", var_6);

us_var_6  = -2**8 + 1;    // assign -255
$display("unsigned_shortint|| us_var_6='d%0d", us_var_6);


var_7  = 2**31 - 1;           
$display("signed_int|| var_7='d%0d", var_7);
var_8  = 2**63 - 1; 	
$display("signed_longint|| var_8='d%0d", var_8);



end

assign var_3=var_2[0];



endmodule
