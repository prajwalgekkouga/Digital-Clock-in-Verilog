`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.08.2021 19:19:59
// Design Name: 
// Module Name: digital_clock_24
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


module digital_clock_24(SS,MM,HH,clock,ss,mm,hh,load,stop);

input clock,load,stop;
output [5:0] SS,MM;
output [4:0] HH;
input [5:0] ss,mm;
input [4:0] hh;

wire s_m,m_h,tp;

second_counter SEC (clock,stop,load,ss,SS,s_m);
minute_counter MIN (s_m,stop,load,mm,MM,m_h);
hour_counter HOUR (m_h,stop,load,hh,HH,tp);

endmodule
