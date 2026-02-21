module tb_simple_vending_machine;
reg clk,rst,coin5,coin10;
wire dispense;

simple_vending_machine uut(
    .clk(clk),
    .rst(rst),
    .coin5(coin5),
    .coin10(coin10),
    .dispense(dispense)
);

always #5 clk = ~clk;

initial begin
$dumpfile("tb_simple_vending_machine.vcd");
$dumpvars(0, tb_simple_vending_machine);
$monitor("Time=%0t | rst=%b | coin5=%b | coin10=%b | state=%b | dispense=%b",
              $time, rst, coin5, coin10, uut.state, dispense);
  
  clk = 0;
  rst = 1;
  coin5 = 0;
  coin10 = 0;
  
  #10 rst =0;
  #10 coin5 =1;
  #10 coin5 =0;

  #10 coin10 =1;
  #10 coin10 =0;

  #10 coin5 =1;
  #10 coin5 =0;

  #10 coin5 =1;
  #10 coin5 =0;

  #10 $finish;

end
endmodule