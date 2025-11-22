# Washing Machine Controller (Verilog HDL)

This project implements a washing machine controller using Verilog HDL.  
The design is based on a multi-state finite state machine (FSM) that manages  
each stage of the washing process: door lock, water fill, detergent, wash cycle,  
drain, and spin.

The repository includes:
- Washing machine RTL
- Testbench 
- Waveform output

---

##  FSM Overview

The controller uses six states:
 s0   --> Door closed / Start   
 s1   --> Fill water            
 s2   --> Add detergent         
 s3   --> Wash cycle            
 s4   --> Drain water           
 s5   --> Spin                  

Transitions depend on inputs such as:
- start
- door_close
- filled_water
- add_detergent
- cycle
- drain_water
- spin

Every state updates the machine outputs accordingly:
- _door_close
- water_filled
- _water_drain
- _spin
- motor_on
- done

---

##  Testbench Details

The testbench provides:
- Clock generation (`#5 clk = ~clk`)
- Reset sequence
- Input stimulus for every washing stage
- `$dumpfile` and `$dumpvars` for VCD generation
- `$monitor` to print live signal values

 ---

##  Signals & Outputs

Key outputs controlled by the FSM:

motor_on → washing cycle motor

_door_close → ensures door lock before start

water_filled → water fill signal

_water_drain → drain valve

_spin → motor spin stage

done → signals completion of the wash cycle

---
