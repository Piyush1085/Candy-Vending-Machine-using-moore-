# Candy-Vending-Machine-using-moore-

# 🍬 Candy Vending Machine using Moore State Machine (Verilog HDL)

This project implements a **Candy Vending Machine** using a **Moore Finite State Machine (FSM)** in Verilog. The vending machine accepts ₹5 and ₹10 coins and dispenses candy once the total inserted amount is ₹15 or more. This is an ideal project for understanding state machines in digital design using Verilog HDL.

## 🔧 Overview

The vending machine is modeled using a **Moore FSM**, meaning the output (`candy`) depends only on the current state, not the inputs. The machine progresses through a series of states representing the total money inserted, and when it reaches ₹15 or ₹20, it dispenses a candy.

## 🧠 FSM Design

The machine has the following states:

| State | Binary Code | Total Money Inserted |
|-------|-------------|----------------------|
| `s0`  | `0000`      | ₹0                   |
| `s5`  | `0001`      | ₹5                   |
| `s10` | `0010`      | ₹10                  |
| `s15` | `0011`      | ₹15 (Candy)          |
| `s20` | `0100`      | ₹20 (Candy)          |

The coin input is 4-bit wide and accepts:

- `rupee5` = `0101` (decimal 5)
- `rupee10` = `1010` (decimal 10)

### 🎯 Candy Dispense Condition

- Candy is dispensed when the machine reaches **state `s15` or `s20`**.
- Once candy is dispensed, the machine returns to the initial state (`s0`) to start a new cycle.

## 💡 Verilog Module Description

### Inputs:

- `clk`: Clock signal
- `rst`: Asynchronous reset signal
- `coin[3:0]`: 4-bit input representing either ₹5 or ₹10

### Output:

- `candy`: Output that is high (1) when candy is dispensed

### State Transition Logic

`verilog
always@(posedge clk)
begin
    if(rst)
        present_state = s0;
    else
        present_state = next_state;
end`

### Combinational Logic for Next State
Each state checks the inserted coin and transitions accordingly:

``verilog
case(present_state)
    s0: if(coin == rupee5) next_state <= s5;
        else if(coin == rupee10) next_state <= s10;
        else next_state <= s0;

    s5: ...
    s10: ...
    ...
endcase``

### Output Logic
As this is a Moore machine, the output depends only on the current state:

verilog
`assign candy = (present_state == s15 || present_state == s20) ? 1'b1 : 1'b0;`

🚀 Why This Project is Important

- Teaches Finite State Machine (FSM) design in hardware
- Demonstrates Moore vs Mealy machine concepts
- Useful in Digital Design, VLSI Verification, and FPGA projects
- Helps understand Verilog behavioral modeling
