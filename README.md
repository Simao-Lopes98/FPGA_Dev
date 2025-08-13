# Apps for Discussing Verilog and ICE40 FPGAs

- These are the examples for a Verilog tutorial on [YouTube](https://www.youtube.com/playlist?list=PL3by7evD3F52On-ws9pcdQuEL-rYbNNFB).
- The latest ICE40 FPGA docs can be found here: https://www.latticesemi.com/Products/FPGAandCPLD/iCE40
- Documentation resources can be found here: https://github.com/johnwinans/VerilogNotes
- Original repo and packages from: https://github.com/johnwinans/Verilog-Examples 
- Kudos to: https://github.com/johnwinans

# iCEstick Evaluation Board

![image](https://github.com/user-attachments/assets/f8377aca-dbc5-4fd2-8f2d-b29c184d58db)


## Install from packages (where available)

On Ubuntu 22.04.2:

First update and upgrade Linux packages
```
sudo apt update
sudo apt upgrade
```
Second install the following packages

```
sudo apt install iverilog
sudo apt install gtkwave
sudo apt install fpga-icestorm
sudo apt install yosys
sudo apt install nextpnr-ice40
sudo apt install flashrom
```

Note that, on older systems, packages for these tools can be outdated or missing.

# To compile applications

You can compile/clean all the projects in this REPO from the top level directory
using `make` and `make clean`.  If you want to only build one then go into its
directory and `make`, `make clean` from there.

# Simulate

To simulate navigate to the disered project dir and perform the following:

```
make plot
```
# Program

To program the ICEStick path to the respective directory and use the following promp:

```
make program
```


If you are using WSL and to configure USB passthrough visit: 
https://learn.microsoft.com/en-us/windows/wsl/connect-usb
