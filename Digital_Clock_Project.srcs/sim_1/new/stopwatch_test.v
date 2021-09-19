
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.08.2021 19:14:58
// Design Name: 
// Module Name: stopwatch_test
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


module stopwatch_stimulus ;

reg [4:0] hh;
reg [5:0] mm,ss;
reg clk,reset,start,set;
wire [4:0] HH;
wire [5:0] MM,SS;
wire min2sec,hour2min,s_m,m_h;

stopwatch_clock_24 UST (SS,MM,HH,clk,ss,mm,hh,start,set,reset,min2sec,hour2min,s_m,m_h);

initial
    begin
    reset=1;
    set=0;
    start=0;
    clk=0;
    hh=01;
    mm=41;
    ss=30;
    #5 reset=0;
    #50 set=1;
    #10 set=0;
    #100 start=1;
    #1000 start=0;
    #1000 start=1;
    #1000 reset=1;
    #1 reset=0;
    #100 set=1;
    #5 hh=5;
    mm=00;
    ss=00;
    #5 start=0;
    #100 start=1;
    #15000 $finish;
    end
    
 always
     #1 clk=~clk;
    
 endmodule



