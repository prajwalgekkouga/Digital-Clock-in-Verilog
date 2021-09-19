`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.08.2021 19:13:09
// Design Name: 
// Module Name: minute_counter
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



//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.08.2021 18:18:23
// Design Name: 
// Module Name: second_counter
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


module hour_counter(clock,reset,load_enable,input_load,display,out_clock);
    input clock;
    input reset;
    input load_enable;
    input [4:0] input_load;
    output reg [4:0] display;
    output reg out_clock;

    
    
   always @(posedge clock or posedge reset or posedge load_enable)
   
   if (~load_enable)
    begin
   
            if (reset)
                display<=0;
            else if (display >=23)
                begin
                display<=0;
                out_clock<=1;
                end
            else
                begin
                display<=display+1;
                out_clock<=0;
                end
     end
     
    else
     begin
        if (reset | (input_load>=23))
            display<=0;
        else 
            display<=input_load;
     end
endmodule