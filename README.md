# washing-machine-controller-verilog
Washing Machine Controller implemented in Verilog HDL using a multi-state FSM. Includes input sequencing, motor control logic, water fill/drain control, spin cycle handling, and a complete testbench with waveform generation.
# Washing Machine Controller (Verilog HDL)

This project implements a washing machine controller using Verilog HDL.  
The design is based on a multi-state finite state machine (FSM) that manages  
each stage of the washing process: door lock, water fill, detergent, wash cycle,  
drain, and spin.

The repository includes:
- Washing machine RTL (`washing_machine.v`)
- Testbench (`washing_machine_tb.v`)
- Waveform output (`washing_machine.vcd`)
- Optional simulation screenshots in `/images`

---

## 1. FSM Overview

The controller uses six states:

| State | Meaning               |
|-------|-----------------------|
| s0    | Door closed / Start   |
| s1    | Fill water            |
| s2    | Add detergent         |
| s3    | Wash cycle            |
| s4    | Drain water           |
| s5    | Spin                  |

Transitions depend on inputs such as:
- `start`
- `door_close`
- `filled_water`
- `add_detergent`
- `cycle`
- `drain_water`
- `spin`

Every state updates the machine outputs accordingly:
- `_door_close`
- `water_filled`
- `_water_drain`
- `_spin`
- `motor_on`
- `done`

---

## 2. Project Structure

