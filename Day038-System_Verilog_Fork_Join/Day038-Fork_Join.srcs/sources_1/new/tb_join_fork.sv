`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.03.2025 21:44:49
// Design Name: 
// Module Name: tb_join_fork
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


module tb_join_fork();



// today we will different types fork and join


initial begin

#1 $display("[%0t]strat Fork & Join ....",$time);
$display("Fork & Join ....Main Process: Fork these processes in parallel and wait untill all of them finish");
fork

    #5$display("ThreadA1: This is 100days of verilog  ....",$time);
    
    begin
       #2 $display("ThreadA2a: Today is 39th day  ....",$time);
       #4 $display("ThreadA2b: Today I am Doing FORK_JOIN ....",$time);
    end
 #10 $display("ThreadA3: This is Fork & Join....",$time);
 
 join
 $display("End of Fork & Join");
 $display("Fork & Join_any Fork these processes in parallel and wait until any one of them finish ");
 #13 $display("ThreadB1: Today is 39th day  ....",$time);
 
 fork
   #5$display("ThreadB1: This is 100days of verilog  ....",$time);
    
    begin
       #2 $display("ThreadB2a: Today is 39th day  ....",$time);
       #4 $display("ThreadB2b: Today I am Doing Fork_Join ....",$time);
    end
 #10 $display("ThreadB3: This is Fork & Join_any  ....",$time);
 
 join_any
  $display("End of Fork & Join_any");
  //disable fork;
  //wait fork;
 $display("Fork & Join_none Fork these processes in parallel and exits immediately ");
 #33 $display("ThreadC1: Today is 39th day  ....",$time);
 fork
   #5$display("ThreadC1: This is 100days of verilog  ....",$time);
    
    begin
       #2 $display("ThreadC2a: Today is 39th day  ....",$time);
       #4 $display("ThreadC2b: Today I am Doing Fork_Join ....",$time);
    end
 #10 $display("ThreadC3: This is Fork & Join_none  ....",$time);
 
 join_none
 //wait fork;
 $display("End of Fork & Join_none"); 
 //disable fork;
end

endmodule  
