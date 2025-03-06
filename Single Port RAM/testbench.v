// Single Port RAM testbench

module single_port_ram_tb;
  reg [7:0] data; // input data
  reg [5:0] addr; // address
  reg we; // write enable
  reg clk; // clock
  wire [7:0] q; // output data
  
  single_port_ram spr1(
    .data(data),
    .addr(addr),
    .we(we),
    .clk(clk),
    .q(q)
  );

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, single_port_ram_tb);  

    clk = 0;
    forever #5 clk = ~clk;
  end

  initial begin
    data = 8'h01; addr = 6'd0; we = 1'b1; #10;
    data = 8'h02; addr = 6'd1; #10;
    data = 8'h03; addr = 6'd2; #10;
    
    // Read operations
    addr = 6'd0; we = 1'b0; #10;
    addr = 6'd1; #10;
    addr = 6'd2; #10;

    // Write and Read new data
    data = 8'h04; addr = 6'd1; we = 1'b1; #10;
    addr = 6'd1; we = 1'b0; #10;
    
    addr = 6'd3; #10;
  end

  initial #90 $stop;
endmodule
