`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.08.2021 21:08:51
// Design Name: 
// Module Name: stopwatch_hours
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




module stopwatch_hour(clock,reset,start,set,input_load,display,ackn);
    input clock;
    input reset;
    input start;
    input set;
    input [4:0] input_load;
    output reg [4:0] display;
    output reg ackn;
    
   

    always @(posedge clock or posedge reset or negedge start or posedge set)
    
    
    if (reset)
        begin
        display<=0;
        ackn<=1; //was zero
        end
    
    else if (~start & ~set)
        display<=display;
    
    else if (~start & set) 
        begin
            if ( input_load >= 24 )
                    display<=0;
            else if ( input_load==0)
                begin
                display<=0;
                ackn<=1;
                end
            else 
                begin
                display <= input_load;
                ackn<=0;
                end
        end
    
    else 
        begin
            if (display==1 | display==0)
                begin
                    display<=0;
                   ackn<=1;
                end
             else
                begin
                display<=display-1;
                ackn=0;
                end
         end
             
endmodule
