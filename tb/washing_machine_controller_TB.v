module washing_machine_tb;
  
  reg clk, reset, start, door_close, filled_water, add_detergent, cycle, drain_water, spin;
  wire done, _door_close, water_filled, _water_drain, _spin, motor_on;
  
  washing_machine DUT(clk, reset, start, door_close, filled_water, add_detergent, cycle, drain_water, spin, done, _door_close, water_filled, _water_drain, _spin, motor_on); 
  
  always begin 
    #5 clk=~clk;
  end 
  
  initial 
    begin 
      $dumpfile("washing_machine.vcd");
      $dumpvars(0, washing_machine_tb);
      $monitor($time, "clk=%b, reset=%b, start=%b, door_close=%b, filled_water=%b, add_detergent=%b, cycle=%b, drain_water=%b, spin=%b, done=%b, _door_close=%b, water_filled=%b, _water_drain=%b, _spin=%b, motor_on=%b", clk, reset, start, door_close, filled_water, add_detergent, cycle, drain_water, spin, done, _door_close, water_filled, _water_drain, _spin, motor_on);
      
      clk=1'b0;
      start=1'b0; 
      door_close=1'b0; 
      filled_water=1'b0;
      add_detergent=1'b0;
      cycle=1'b0;
      drain_water=1'b0;
      spin=1'b0;
      reset=1'b1;
      
      #5 reset=1'b0;
      
      #10 start=1'b1; door_close=1'b1;
      #20 filled_water=1'b1; 
      #30 add_detergent=1'b1; filled_water=1'b0;
      #40 cycle=1'b1; add_detergent=1'b0;
      #50 drain_water=1'b1; cycle=1'b0;
      #60 spin=1'b1; drain_water=1'b0;
      #70 spin=1'b0;
      
      
      
      #10 $finish;
      
    end 
  
endmodule 
