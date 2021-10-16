module Top(
           input [7:0]  SW,
           output [7:0] AN,
           output [6:0] SEG,
           output       DP      
           );

   assign AN[7:4] = 4'b1111;
   
   topEntity u_topEntity
     (
      .SWITCHES(SW[7:0]),
      .SS_AN(AN[3:0]),
      .SS_SEG(SEG[6:0]),
      .SS_DP(DP)
      );
   
endmodule
