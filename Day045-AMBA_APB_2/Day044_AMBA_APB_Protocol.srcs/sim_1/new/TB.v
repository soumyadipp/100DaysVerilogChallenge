`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: SOUMYADIP MANNA
// 
// Create Date: 12.03.2025 22:32:44
// Design Name: AMBA_APB_PROTOCOL
// Module Name: TEST_BENCH
// Project Name: 
// Target Devices: 
// Tool Versions: s
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module tb_APB_PROTOCOL();

    parameter DATA_WIDTH = 32;
    parameter ADDR_WIDTH = 8;

    reg PCLK;
    reg PRESETn;
    reg transfer;
    reg Read_Write;
    reg [ADDR_WIDTH:0] Apb_WRITE_PADDR;
    reg [DATA_WIDTH-1:0] Apb_WRITE_DATA;
    reg [ADDR_WIDTH:0] Apb_READ_PADDR;
    wire [DATA_WIDTH-1:0] Apb_READ_DATA;

    APB_PROTOCOL #(DATA_WIDTH, ADDR_WIDTH) dut (
        .PCLK(PCLK),
        .PRESETn(PRESETn),
        .transfer(transfer),
        .Read_Write(Read_Write),
        .Apb_WRITE_PADDR(Apb_WRITE_PADDR),
        .Apb_WRITE_DATA(Apb_WRITE_DATA),
        .Apb_READ_PADDR(Apb_READ_PADDR),
        .Apb_READ_DATA(Apb_READ_DATA)
    );

    // Clock generation
    initial begin
        PCLK = 0;
        forever #5 PCLK = ~PCLK;
    end

    // Reset generation
    initial begin
            PRESETn = 0;
        #20 PRESETn = 1;
    end

    // Test sequence
    initial begin
        // Initialize inputs
        transfer = 0;
        Read_Write = 0;
        Apb_WRITE_PADDR = 0;
        Apb_WRITE_DATA = 0;
        Apb_READ_PADDR = 0;

        // Wait for reset to complete
        wait(PRESETn == 1);
        #10; // Wait a bit after reset

        // Test write to address 0x10
      write_task(8'h10, 32'h12345678);
        #100;
        // Test read from the same address
        read_task(8'h10, 32'h12345678);

        // Add more test cases if needed

        #100;
        $finish;
    end

    // Write task
    task automatic write_task(input [ADDR_WIDTH:0] addr, input [DATA_WIDTH-1:0] data);
    begin
        @(posedge PCLK);
        transfer = 1;
        Read_Write = 0;
        Apb_WRITE_PADDR = addr;
        Apb_WRITE_DATA = data;

      
    end
    endtask

    // Read task
    task automatic read_task(input [ADDR_WIDTH-1:0] addr, input [DATA_WIDTH-1:0] expected_data);
    begin
        @(posedge PCLK);
        transfer = 1;
        Read_Write = 1;
        Apb_READ_PADDR = addr;

    end
    endtask

endmodule