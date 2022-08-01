# MUX Design Verification

The verification environment is setup using [Vyoma's UpTickPro](https://vyomasystems.com) provided for the hackathon.
(https://user-images.githubusercontent.com/64627151/182175176-b4a4c00a-2a22-4f18-8365-81c078a02492.png)

## Verification Environment

The [CoCoTb](https://www.cocotb.org/) based Python test is developed as explained. The test drives inputs to the Design Under Test (adder module here) which takes in 31-bit inputs *inp* and has 5 *select* lines and output *out* 

The values are given to input ports is from 0 to 3 
```
input=random.randint(0,3)

```
The assert statement is used for comparing the adder's outut to the expected value.

The following error is seen:
```
5'b01101: out = inp12;

And absence of inp30 in the verilog code

```

## Test Scenario **(Important)**
- Test Inputs: dut.sel.value=12
               dut.inp12.value=random.randint(0,3)
- Expected Output: inp12 value
- Observed Output in the DUT error

Test Inputs: dut.sel.value=30
               dut.inp30.value=random.randint(0,3)
- Expected Output: inp30 value
- Observed Output in the DUT error

Output mismatches for the above inputs proving that there is a design bug



## Design Bug
Based on the above test input and analysing the design, we see the following

```
case(sel)
 5'b01101: out = inp12;             ====> BUG 1
 
 absence of inp30;                  ====> BUG 2
 
endcase
```
For the mux design, the logic for inp12 should be ``5'b01100 `` instead of ``5'b01101 `` as in the design code and for the inp30 there should be a case statement present as in design ther is ``no case statement for inp30``

## Design Fix
Updating the design and re-running the test makes the test pass.

![Screenshot (160)](https://user-images.githubusercontent.com/64627151/182179019-e2ab96d0-54f7-4113-bab7-d3f491748fb5.png)


The updated design is checked in as mux.v

## Verification Strategy
assigned an input value using assert statement for input 12 and input 30.
## Is the verification complete ?
YES!!!
