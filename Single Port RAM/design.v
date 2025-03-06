// Single Port RAM module design

module single_port_ram(
  input [7:0] data, // input data
  input [5:0] addr, // address
  input we, // write enable
  input clk, // clock
  output reg [7:0] q // output data
);

  reg [7:0] ram [63:0]; // 8x64 bit RAM
  reg [5:0] addr_reg; // address register

  always @ (posedge clk) begin
    if (we)
      ram[addr] <= data;
    addr_reg <= addr;  // Always update address register
  end

  always @ (*) begin
    q = ram[addr_reg]; // Continuous read
  end

endmodule
