// Design of 2x1 MUX

module mux(
  input[7:0] a,b,
  input sel,
  output reg [7:0] y
); 

  assign y = sel ? b : a;
  
  /* always @(*) begin
    if(sel)
      y <= b;
    else
      y <= a;
  end
  */
endmodule

// Testbench of 2x1 MUX

module tb;
  logic [7:0] a, b;
  logic sel;
  logic [7:0] y;
  
  initial begin
    for(int i = 0; i < 10; i++) begin
      a = $urandom_range(0, 8'hff);
      b = $urandom_range(0, 8'hff);
      sel = $random;
      #5;
    end
  end
  
  initial begin
   $dumpfile("dump.vcd");
   $dumpvars;
  end
endmodule
