`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.03.2025 22:38:20
// Design Name: 
// Module Name: tb_file
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


module tb_file();

initial begin
  	// Declare an integer variable to hold the file descriptor
  	int fd_r, fd_w, fd_a;
  	string line;

  	// Open a file called "note.txt" in the current folder with a "read" permission
  	//"r"	Open for reading
    fd_r = $fopen ("note.txt", "r");
    if (fd_r)  $display("File was opened successfully : %0d", fd_r);
    else     $display("File was NOT opened successfully : %0d", fd_r);

    // Open a file called "note.txt" in the current folder with a "write" permission
    //"w"	Create for writing, overwrite if it exists
    fd_w = $fopen ("note.txt", "w");
    if (fd_w)  $display("File was opened successfully : %0d", fd_w);
    else     $display("File was NOT opened successfully : %0d", fd_w);

    
    //"a"	Create if file does not exist, else append; open for writing at end of file
    fd_a = $fopen ("note.txt", "a");
    if (fd_a)  $display("File was opened successfully : %0d", fd_a);
    else     $display("File was NOT opened successfully : %0d", fd_a);
    
     for (int i = 0; i < 5; i++) begin
      $fdisplay (fd_w, "Iteration = %0d", i); // write 
    end
    $fclose(fd_w);
    
    for(int i =0 ; i<5 ; i++) begin
    $fgets(line, fd_r);
    $display ("Line read : %s", line);
    end
    
  //  Close the file descriptor  
    
    $fclose(fd_r);
    $fclose(fd_a);
  end
endmodule
