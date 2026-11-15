# INFO
This is the working repository Dillon and I will develop his guitar pedal idea. 

# STRUCTURE
- software: This folder will host the firmware for the stm32 microcontroller that the project will ultimately use
- hardware: This folder will host the hardware related documents, simulations, schematic, pcb layout, schematic symbols, etc. 

# Making and adding ssh-keys to your github
Hey Dillon I'm going to write up some directions on the README file (we will delete them later). 

# Managing the project
### Uploading Edits
- $ make commit_all

### Pulling Edits
- $ make update

# HARDWARE
## Buck Converter (RT6200GE)
### Vout Calculation
Vout is determined by a resistor divider system that feeds the feedback pin (FB) on the RT6200GE. The equation given by the 
data sheet is Vout = 0.8 * (1 + R1/R2). I have selected R1 = 47k and R2 = 13k to have a resulting Vout of 3.692V.
### Inductor Selection
Following the datasheet recommendations, the datasheet recommends starting with a ripple current (ΔIL) of 0.4 the max current.
I set Imax to 0.5A based on knowing the max current the the mcu can consume is 300mA from the datasheet and giving some headroom
of 200mA for any other circuitry added to the voltage rail. 
- Imax = 0.5A
- △IL(max) = 0.4 *  0.5A
- Vout = 3.692V
- f=1.2MHz
- Vin(max)=9V, may need to revisit this this should be fine.
- L=(vout/(f * △IL(max)) * (1-(vout/vin(max)))
- L=9.07uH

Increasing inductance will decrease output ripple current, but increase copper losses. I increased the L to be 22uH. Which 
should decrease the output ripple current from the above calculation to 0.16 of the max input current. 

## LDO (TPS7A2033PDBVR)
I found a LDO with a low output voltage noise of 7uVrms, high PSRR to reject noise from the buck converter (40dB at 1MHz buck
converter switching frequency), and low dropout voltage 145mV at 3.3V, since the buck converters output is very close to the 
needed output of the LDO, Buck out at 3.692V - 3.3V = 0.392V. 

Following the datasheet I selected the input and output capacitance. Cin recommended 1uF. Cout recommended 0.47uF to 200uF. 
I also selected Cs with low ESR since this is in parallel with the load to minimize losses on the output. 


# Repository Management
- Cloning: $ git clone git@github.com:mark-mcnulty/base_phase.git
- Updating: $ make update
- Pushing changes: $ make commit_all

## start here
- $ cd ~/Documents/
- $ mkdir temp
- $ mv ./base_phase ./temp # moving broken one to a temp directory
- $ git clone git@github.com:mark-mcnulty/base_phase.git
- Update changes to repo in ~/Documents/base_phase from the one in ~/Documents/temp/base_phase 
- make sure that all changes have been made to the one in ~/Documents/base_phase
- $ cd ~/Documents/base_phase/
- $ make commit_all
- we are deleting the broken repo now
- $ rm -r ~/Documents/temp/base_phase
