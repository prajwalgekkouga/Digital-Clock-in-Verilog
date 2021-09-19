
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.08.2021 20:43:23
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


module stopwatch_hour(clock,reset,start,set,input_load,display,acknow);
    input clock;
    input reset;
    input start;
    input set;
    input [4:0] input_load;
    output reg [4:0] display;
    output reg acknow;


    always @(posedge clock or posedge reset or negedge start or posedge set)
    
    if (reset)
        display<=0;
    
    else if (~start & ~set)
        display<=display;
    
    else if (~start & set) 
        begin
            if ( input_load >= 24 )
                    display<=0;
            else 
                display <= input_load;
        end
    
    else 
        begin
             if (display ==0 )
                begin
                    display<=00;
                    acknow<=1;
                end
             else
                begin
                display<=display-1;
                end
         end
             
endmodule
