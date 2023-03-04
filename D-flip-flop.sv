// Design for D flip-flop
module dff (
  input logic clk, 
  input logic reset,
  input logic d,
  
  output logic q_norst_o, 
  output logic q_syncrst_o, 
  output logic q_asyncrst_o
);

  // No reset
  always@(posedge clk)
    q_norst_o <= d;

  // Synchronous reset
  always@(posedge clk)
    if (reset)
      q_syncrst_o <= 1'b0;
    else
      q_syncrst_o <= d;

  // Asynchronous reset
  always @(posedge clk or posedge reset)
    if (reset)
      q_asyncrst_o <= 1'b0;
    else
      q_asyncrst_o <= d;

endmodule

// Testbench for D flip-flop
module dff_tb ();

  logic clk, reset, d;
  logic q_norst_o, q_syncrst_o, q_asyncrst_o;

  // Generating Clock
  always begin
    clk = 1'b1;
    #5;
    clk = 1'b0;
    #5;
  end

  // Generating Stimulus
  initial begin
    reset = 1'b1;
    d = 1'b0;
    @(posedge clk);
    reset = 1'b0;
    @(posedge clk);
    d = 1'b1;
    @(posedge clk);
    @(posedge clk);
    @(negedge clk);
    reset = 1'b1;
    @(posedge clk);
    @(posedge clk);
    reset = 1'b0;
    @(posedge clk);
    @(posedge clk);
    $finish();
  end

  // Observe waveforms
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end
endmodule
