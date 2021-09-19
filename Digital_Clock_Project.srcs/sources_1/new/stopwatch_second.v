
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


module stopwatch_second(clock,reset,start,set,min_indicator,input_load,display,out_clock);
    input clock;
    input reset;
    input start;
    input min_indicator;
    input set;
    input [5:0] input_load;
    output reg [5:0] display;
    output reg out_clock;

    always @(posedge clock or posedge reset or negedge start or posedge set)
    
    if (reset)
        begin
        display<=0;
        out_clock<=0;
        end
   
    else if (~start & ~set)
        display<=display;
    
    else if (~start & set) 
        begin
            if ( input_load >= 59 )
                    display<=0;
            else 
                display <= input_load;
        end
    
    else 
        begin
             if (display ==0 & min_indicator==0)
                    begin
                    display<=59;
                    out_clock<=1;
                    end
                    
             else if (display ==0 & min_indicator==1)
                begin
                display<=0;
                out_clock=0;
                end
             else
                begin
                display<=display-1;
                out_clock=0;
                end
         end
             
endmodule
