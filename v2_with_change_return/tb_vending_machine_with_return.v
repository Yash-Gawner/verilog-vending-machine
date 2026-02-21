module tb_vending_machine_with_return;
reg clk, rst, coin5, coin10;
wire return, dispance;

vending_machine_with_return uut(
    .clk(clk),
    .rst(rst),
    .coin5(coin5),
    .coin10(coin10),
    .return(return),
    .dispance(dispance)
);

always #5 clk = ~clk;

initial begin
$dumpfile("tb_vending_machine_with_return.vcd");
$dumpvars(0, tb_vending_machine_with_return);

  
  clk =0;
  rst =1;
  coin5=0;
  coin10=0;

  #10 rst =0;

  #10 coin5 =1;
  #10 coin5 =0;

  #10 coin5 =1;
  #10 coin5 =0;

  #10 coin10 =1;
  #10 coin10 =0;

  #10 coin5 =1;
  #10 coin5 =0;

  #10 coin10 =1;
  #10 coin10 =0;

  #20 $finish;

end
endmodule 