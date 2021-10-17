module Top(
           input        CLK100MHZ,
           output [3:0] AN,
           output [6:0] SEG,
           output       DP
           );

   reg [26:0]           cnt = 0;
   reg [1:0]            i = 0;
   wire signed [63:0]   idx = $signed({{(64-2) {1'b0}},i});
   reg [3:0]            result;

   always @(posedge CLK100MHZ) begin : cnt_register
      begin
         cnt <= cnt + 1;
      end
   end

   always @(posedge CLK100MHZ) begin : i_register
      if (cnt == 0) begin
         i <= i + 1;
      end
   end

   always @(*) begin
      result = 4'b0000;
      result[idx] = 1'b1;
   end

   assign AN = ~result;
   assign SEG = 7'd0;
   assign DP = 1'b1;

endmodule
