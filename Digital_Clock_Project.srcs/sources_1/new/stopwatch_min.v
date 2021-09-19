
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.08.2021 20:17:23
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


module stopwatch_minute(clock,reset,start,set,hour_indicator,input_load,display,out_clock,acknow);
    input clock;
    input reset;
    input start;
    input hour_indicator;
    input set;
    input [5:0] input_load;
    output reg [5:0] display;
    output reg out_clock,acknow;
    
   

    always @(posedge clock or posedge reset or negedge start or posedge set)
    
    
    if (reset)
        begin
        display<=0;
        acknow<=1;
        end
    
    else if (~start & ~set)
        display<=display;
    
    else if (~start & set) 
        begin
            if ( input_load >= 59 )
                    display<=0;
            else 
                begin
                display <= input_load;
                acknow<=0;
                end
        end
    
    else 
        begin
             if (display ==0 & hour_indicator==0)
                    begin
                    display<=59;
                    out_clock<=1;
                    acknow=0;
                    end
                    
             else if (display ==0 & hour_indicator==1)
                begin
                    display<=0;
                    acknow<=1;
                end
             else
                begin
                display<=display-1;
                out_clock=0;
                acknow=0;
                end
         end
             
endmodule
