`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.03.2025 20:31:45
// Design Name: 
// Module Name: string_array_queue
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


module string_array_queue();
string Var_0 = "Hello!";
string Var_5 = "Soumya";
reg[16*8-1:0] Var_1,Var_2,Var_3;
bit[7:0] array_1D;   // A vector or 1D packed array
bit [3:0][7:0] 	array_2D;   // A 2D packed array; 4 arrays each 8 bit wide; 4 bytes
bit [2:0][3:0][7:0] array_3D; // A 3D packed array; 12bytes
byte up_array_1D [8]; // depth = 8, byte wide variable
byte up_array_2D [2][4];// rows=2 coloumn=4
 		
string 		d_array2 [];	
int 	     d_array3 [];
int id[];

int  q1 [$] =  { 1, 2, 3, 4, 5 }; // // Integer queue, initialize elements
int q2 [$];
logic [7:0]  elements [$:127];     // A bounded queue of 8-bits with maximum size of 128 slots
initial begin

array_1D=8'hA4;
$display("%s",Var_0);
foreach(Var_0[i])begin
$display("%s",Var_0[i]);
 end

Var_1="How are You"; // 5 zeros are padded from MSB , 11 charecters are stored
Var_3="How are You"; // 5 zeros are padded from MSB , 11 charecters are stored
Var_2="How are you doing?"; // 19 charecters; Var_2 will store "w are you doing?"

$display("%s",Var_1);
$display("%s",Var_2);

// String Operations 

if(Var_1 == Var_3)
 $display("Printed if Var_1 is equal to Var_3");
if(Var_1 != Var_2)
 $display("Printed if Var_1 is not equal Var_2"); 
if(Var_1 < Var_2) // check if the length of the Var_1 is less than length of the Var_2
 $display("Printed if Var_1 is less than Var_2"); 
 if(Var_2 > Var_1) // check if the length of the Var_2 is greater than length of the Var_1
 $display("Printed if Var_2 is greater than Var_1"); 
 $display("%s",Var_5);
 $display("Concatinated String = %s",{Var_0," ",Var_5}); // String concatenation : Join Var_0 and Var_5 into a single String
 
 $display("%s",{3{Var_5}}); // Replication of Var_5 3 times
 
 $display("Var_5[0]=%s,Var_5[3]=%s",Var_5[0],Var_5[3]); //String indexing
 
 $display ("array_1D = 0x%0h", array_1D);
 
 for (int i = 0; i < $size(array_1D); i++) begin
			$display ("array_1D[%0d] = %b", i, array_1D[i]);
		end


      array_2D = 32'hface_cafe;

$display ("array_2D = 0x%0h", array_2D);

for (int i = 0; i < $size(array_2D); i++) begin
        $display ("array_2D[%0d] = %b (0x%0h)", i, array_2D[i], array_2D[i]);
		end

      array_3D[0] = 32'hface_cafe;
      array_3D[1] = 32'h1234_5678;
      array_3D[2] = 32'hc0de_fade;

     $display ("array_3D = 0x%0h", array_3D);

	
      foreach (array_3D[i]) begin
        $display ("array_3D[%0d] = 0x%0h", i, array_3D[i]);
        foreach (array_3D[i][j]) begin
          $display ("array_3D[%0d][%0d] = 0x%0h", i, j, array_3D[i][j]);
        end
      end
   
   
 foreach (up_array_1D[i]) begin
			up_array_1D[i] = $random;
			$display ("Assign 0x%0h to index %0d", up_array_1D[i], i);
		end

		
		$display ("up_array_1D = %p", up_array_1D);  
		
foreach (up_array_2D[i])
          foreach (up_array_2D[i][j]) begin
            up_array_1D[i][j] = $random;
            $display ("up_array_2D[%0d][%0d] = 0x%0h", i, j,up_array_2D[i][j]);
			end
			
			
		$display ("up_array_2D = %p", up_array_2D);		
   
   
         d_array3 = new [5];

		 d_array3 = '{31, 67, 10, 4, 99};

		id = d_array3;

		// Display contents of "id"
		$display ("id = %p", id);

		// Grow size by 1 and copy existing elements to the new dyn. array "id"
		id = new [id.size() + 1] (id);

		// Assign value 6 to the newly added location [index 5]
		id [id.size() - 1] = 6;

		// Display contents of new "id"
		$display ("New id = %p", id);

		// Display size of both arrays
		$display ("d_array3.size() = %0d, id.size() = %0d", d_array3.size(), id.size());
		foreach (d_array3[i])
			$display ("d_array3[%0d] = %0d", i, d_array3[i]);
			
        d_array2 = new [3];

		// Initialize the array with five values
      	d_array2 = '{"apple", "orange", "mango"};

      	// Print size of the dynamic array
		$display ("d_array2.size() = %0d", d_array2.size());

		// Empty the dynamic array by deleting all items
		d_array2.delete();
		$display ("d_array2.size() = %0d", d_array2.size());		
	
               // Inserts value 15 to index# 2	
foreach (q1[i])
	$display ("q1[%0d] = %d", i, q1[i]);

  		// Display elements in a queue
  		$display ("q1 = %p", q1);

      	// Delete all elements in the queue
      	q1 = {};
 
 
      	$display ("After deletion, q1 = %p", q1);	

$display ("q2 = %p", q2);
q2=q1; 
$display ("coopy q1 into q2;q2=q1||q2 = %p", q2);    	
q2[2] = 15;  // Replace element at index 2 with 15
$display ("Replace element at index 2 with 15; q2[2] = 15||q2 = %p", q2);                       
q2.insert (2, 15);  
$display ("Inserts value 15 to index# 2; q2.insert (2, 15)||q2 = %p", q2);               // Inserts value 15 to index# 2
q2 = { q2, 22 };                   // Append 22 to q2
$display ("Append 22 to q2;q2 = { q2, 22 };||q2 = %p", q2);
q2 = { 99, q2 };                   // Put 99 as the first element of q2
$display ("Put 99 as the first element of q2; q2 = { 99, q2 };||q2 = %p", q2);
q2 = q2 [1:$];                     // Delete first item
$display ("Delete first item; q2 = q2 [1:$];  ||q2 = %p", q2);
q2 = q2 [0:$-1];                   // Delete last item
$display ("Delete last item; q2 = q2 [0:$-1]; ||q2 = %p", q2);
q2 = q2 [1:$-1];                   // Delete first and last item
$display ("Delete first and last item; q2 = q2 [1:$-1];||q2 = %p", q2);

end
endmodule
