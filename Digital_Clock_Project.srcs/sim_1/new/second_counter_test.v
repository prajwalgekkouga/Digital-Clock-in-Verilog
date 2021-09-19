`timescale 1s / 1ms
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.08.2021 18:25:21
// Design Name: 
// Module Name: second_counter_test
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


module stimulus ;

reg [4:0] hh;
reg [5:0] mm,ss;
reg clk,reset,load_enable;
wire [4:0] HH;
wire [5:0] MM,SS;


digital_clock_24 UUT (SS,MM,HH,clk,ss,mm,hh,load_enable,reset);



initial
    begin
    reset<=1;
    load_enable<=0;
    hh=0;
    mm=0;
    ss=0;
    clk=0;
    #5 reset<=0;
    end

always
    #0.5 clk=~clk;

initial
    #270000 $finish;
endmodule
