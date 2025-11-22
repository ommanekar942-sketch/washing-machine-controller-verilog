module washing_machine(input clk, reset, start, door_close, filled_water, add_detergent, cycle, drain_water, spin, 
                      output reg done, _door_close, water_filled, _water_drain, _spin, motor_on);
  reg [2:0] state;
  reg [2:0] next_state;
  
  parameter s0=3'b000, //close the door 
             s1=3'b001, //filled the water 
             s2=3'b010, //add the detergent 
             s3=3'b011, //cycle 
             s4=3'b100, //drain 
             s5=3'b101; //spin
  
  always@(posedge clk or posedge reset)  begin 
    
    if(reset)  begin 
      state<=s0;
    end 
    else  begin 
      state<=next_state;
    end 
    
  end 
  
  always@(*)  begin 
    
    case(state)
    s0 : begin 
      if(start && door_close)  begin 
        motor_on<=0;
        _door_close<=1;
        water_filled<=0;
        _water_drain<=0;
        _spin<=0;
        motor_on<=0;
        done<=0;
        next_state<=s1;
      end 
      else   begin 
        next_state<=s0;
        motor_on<=0;
        _door_close<=0;
        water_filled<=0;
        _water_drain<=0;
        _spin<=0;
        motor_on<=0;
        done<=0;
      end 
    end 
      
      s1 : begin 
        if(filled_water)  begin 
          next_state<=s1;
          motor_on<=0;
          _door_close<=1;
          water_filled<=0;
          _water_drain<=0;
          _spin<=0;
          motor_on<=0;
          done<=0;
        end 
        else  begin 
          next_state<=s2;
          motor_on<=0;
          _door_close<=1;
          water_filled<=1;
          _water_drain<=0;
          _spin<=0;
          motor_on<=0;
          done<=0;
        end 
      end 
      
      s2 : begin 
        if(add_detergent)  begin 
          next_state<=s3;
          motor_on<=0;
          _door_close<=1;
          water_filled<=0;
          _water_drain<=0;
          _spin<=0;
          motor_on<=0;
          done<=0;
        end 
        else   begin
          next_state<=s2;
          motor_on<=0;
          _door_close<=1;
          water_filled<=0;
          _water_drain<=0;
          _spin<=0;
          motor_on<=0;
          done<=0;
        end 
      end 
      
      s3 : begin 
        if(cycle)  begin 
          next_state<=s4;
          motor_on<=0;
          _door_close<=1;
          water_filled<=0;
          _water_drain<=0;
          _spin<=0;
          motor_on<=0;
          done<=0;
        end 
        else begin 
          next_state<=s3;
          motor_on<=1;
          _door_close<=1;
          water_filled<=0;
          _water_drain<=0;
          _spin<=0;
          motor_on<=0;
          done<=0;
        end 
      end 
      
      s4 :  begin 
        if(drain_water)  begin 
          next_state<=s5;
          motor_on<=0;
          _door_close<=1;
          water_filled<=0;
          _water_drain<=0;
          _spin<=0;
          motor_on<=0;
          done<=0;
          
        end 
        else   begin 
          next_state<=s4;
          motor_on<=0;
          _door_close<=1;
          water_filled<=0;
          _water_drain<=1;
          _spin<=0;
          motor_on<=0;
          done<=0;
        end 
      end 
      
      s5 :  begin 
        if(spin)  begin 
          next_state<=s5;
          motor_on<=0;
          _door_close<=1;
          water_filled<=0;
          _water_drain<=1;
          _spin<=0;
          motor_on<=0;
          done<=0;
        end
      else  begin 
          next_state<=s0;
          motor_on<=0;
          _door_close<=1;
          water_filled<=0;
          _water_drain<=1;
          _spin<=0;
          motor_on<=0;
          done<=1;  
       end 
      end 
      
      default : begin 
         next_state<=s0;
         motor_on<=0;
         _door_close<=1;
         water_filled<=0;
         _water_drain<=1;
         _spin<=0;
         motor_on<=0;
         done<=0;  
      end 
      
    endcase 
    
  end 
  
endmodule 
