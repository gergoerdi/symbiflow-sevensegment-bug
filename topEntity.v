module topEntity 
  (input CLK, 
   output wire [3:0] SS_AN,
   output wire [6:0] SS_SEG, 
   output wire       SS_DP);
   
   reg [26:0]         cnt = 0;
   reg [1:0]          i = 0;
   wire signed [63:0] idx = $signed({{(64-2) {1'b0}},i});
   reg [3:0]          result;
         
   always @(posedge CLK) begin : cnt_register
      begin
         cnt <= cnt + 1;        
      end
   end

   always @(posedge CLK) begin : i_register
      if (cnt == 0) begin
         i <= i + 1;
      end
   end
   
   always @(*) begin
      result = 4'b0000;
      result[idx] = 1'b1;
   end
   
   assign SS_AN = ~result;
   assign SS_SEG = 7'd0;   
   assign SS_DP = 1'b1;
   
endmodule
