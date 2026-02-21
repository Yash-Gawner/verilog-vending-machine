module simple_vending_machine(
    input clk,
    input rst,
    input coin5,
    input coin10,
    output reg dispense
);

reg [1:0]state , next_state;

parameter s0 = 2'b00,
          s1 = 2'b01,
          s2 = 2'b11;

always @(posedge clk or posedge rst) begin
  
  if(rst)
  state <= 2'b00;

  else
  state <= next_state;

end

always @(*)begin
  
  case(state)

  s0: if(coin5)
        next_state = s1;

      else if(coin10)
        next_state = s2;

      else 
        next_state = s0;

   s1 : if(coin5)
        next_state = s2;

        else if (coin10)
        next_state = s2;

        else 
        next_state = s1; 

    default : next_state = s0;

endcase
end

always @(*) begin
  
  case(state)
    s2 : dispense = 1;

    default : dispense = 0;
    endcase
end
endmodule