`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.07.2025 15:43:28
// Design Name: 
// Module Name: synchronous_fifo
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


module synchronous_fifo #(
    parameter DATA_WIDTH = 8,      // How wide each data value is
    parameter ADDR_WIDTH = 4       // Number of address bits Depth = 2^4 = 16
)(    input clk,    // Clock signal
    input rst,    // Reset: clears everything
    input wr_en,  // Write enable
    input rd_en,  // Read enable
    input  [DATA_WIDTH-1:0] din,    // Data to write
    output [DATA_WIDTH-1:0] dout,   // Data to read
    output full,   // FIFO is full
    output empty   // FIFO is empty
);
localparam DEPTH = 1<<ADDR_WIDTH;//shift 1 to the left by address width means 1*2^addr_width
reg[DATA_WIDTH-1:0] mem[0:DEPTH-1];//depth is equivalent to no. of mem locations
reg [ADDR_WIDTH:0] wr_ptr = 0;        // Write pointer (one bit bigger) pointer need five bit to detect wrap arount as depth is 16 so pointer initialise from 0 and end at 16
reg [ADDR_WIDTH:0] rd_ptr = 0;        // Read pointer
assign full=(wr_ptr-rd_ptr==DEPTH); //example wr_ptr = 16, rd_ptr = 0 FIFO is full.
assign empty=(wr_ptr==rd_ptr);//When write pointer equals read pointer ,it means nothing has been written yet or all written data has been read.
assign dout= mem[rd_ptr[ADDR_WIDTH-1:0]];//it gives me the data stored in the FIFO at the address pointed to by the read pointer.
always@(posedge clk) begin
if(rst) begin 
wr_ptr<=0;
end else if(wr_en&&!full) begin
mem[wr_ptr[ADDR_WIDTH-1:0]]<=din;
 wr_ptr <= wr_ptr + 1;
 end
 end
 always @(posedge clk) begin
    if (rst) begin
        rd_ptr <= 0;
    end else if (rd_en && !empty) begin
        rd_ptr <= rd_ptr + 1;  // Move to next slot
    end
end
endmodule
