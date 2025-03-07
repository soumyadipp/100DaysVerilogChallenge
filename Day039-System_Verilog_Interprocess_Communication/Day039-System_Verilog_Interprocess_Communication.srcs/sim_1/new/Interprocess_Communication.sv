`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.03.2025 22:07:55
// Design Name: 
// Module Name: Interprocess_Communication
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


module Interprocess_Communication;


//Events ||	Different threads synchronize with each other via event handles in a testbench

//Semaphores ||	Different threads might need to access the same resource; they take turns by using a semaphore



/*.........................................................................................................................................................*/


event event_A;
semaphore key;

initial begin
key = new(1);
 fork

     WaitforTrigger(event_A);
     #10 -> event_A;

 join

fork
    
 personA();
 personB();
 #25personA();

join

end
task WaitforTrigger (input event event_A);
  $display("[%0t]Waiting for trigger Event_A",$time);
wait(event_A.triggered);
  $display("[%0t]Event_A is Triggered ",$time);
endtask
 task personA();
  
  getroom(1);
#10 putroom(1);
 
 endtask
 
 task personB();
  
    getroom(2);
#20 putroom(2);
 
 endtask
 
 task getroom(input bit[1:0] id);
 $display("[%d]at[%0t] is trying to get the Room.",id,$time);
 key.get(1);
 $display("[%d]at[%0t] Entering the Room.",id,$time);
 endtask
 
 task putroom(input bit[1:0] id);
$display("[%d]at[%0t] is trying to leave the Room.",id,$time);
 key.put(1);
$display("[%d]at[%0t] is left the Room.",id,$time); 
 endtask
endmodule
