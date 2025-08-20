`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.07.2025 10:02:55
// Design Name: 
// Module Name: synchronous_fifo_tb
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


module synchronous_fifo_tb;
parameter DATA_WIDTH=8;
parameter ADDR_WIDTH=4;
reg clk, rst, wr_en, rd_en;
reg [DATA_WIDTH-1:0] din; //If the value is assigned inside an always block, then it must be a reg


    wire [DATA_WIDTH-1:0] dout;// value is assigned using assign so it must be a wire
    wire full, empty;
    
    synchronous_fifo #(
        .DATA_WIDTH(DATA_WIDTH),
        .ADDR_WIDTH(ADDR_WIDTH)
    ) uut (.clk(clk),
        .rst(rst),
        .wr_en(wr_en),
        .rd_en(rd_en),
        .din(din),
        .dout(dout),
        .full(full),
        .empty(empty)
    );
    initial begin
    clk=0;
    end
    always #5 clk=~clk;
    initial begin
    rst = 1;
        wr_en = 0;
        rd_en = 0;
        din = 0;
        #20 rst=0;
        //Write 5 values from FIFO
        $display;
        repeat(5) begin
        
        @(posedge clk);
            wr_en = 1;
            din = din + 8'd10;
            $display("Time %t Writing %0d", $time, din);
        end
        @(posedge clk);
        wr_en = 0;
         // Wait before reading
        #20;

        // Read 5 values from FIFO
        $display;
        repeat (5) begin
            rd_en = 1;
            @(posedge clk);

            $display("Time %t Reading %d", $time, dout);
        end
        @(posedge clk);
        rd_en = 0;
        #20;
        $finish;
    end

endmodule
