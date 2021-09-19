`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.08.2021 21:13:02
// Design Name: 
// Module Name: stopwatch_clock
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


module stopwatch_clock_24(SS,MM,HH,clock,ss,mm,hh,start,set,reset,min2sec,hour2min,s_m,m_h);

input clock,reset,start,set;
output [5:0] SS,MM;
output [4:0] HH;
input [5:0] ss,mm;
input [4:0] hh;

output min2sec,hour2min,s_m,m_h;

stopwatch_second WSEC (clock,reset,start,set,min2sec,ss,SS,s_m);
stopwatch_minute WMIN (s_m,reset,start,set,hour2min,mm,MM,m_h,min2sec);
stopwatch_hour WHR (m_h,reset,start,set,hh,HH,hour2min);


endmodule
