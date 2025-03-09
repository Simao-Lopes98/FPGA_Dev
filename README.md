# Apps for Discussing Verilog and ICE40 FPGAs

- These are the examples for a Verilog tutorial on [YouTube](https://www.youtube.com/playlist?list=PL3by7evD3F52On-ws9pcdQuEL-rYbNNFB).
- The latest ICE40 FPGA docs can be found here: https://www.latticesemi.com/Products/FPGAandCPLD/iCE40
- Documentation resources can be found here: https://github.com/johnwinans/VerilogNotes
- Original repo and packages from: https://github.com/johnwinans/Verilog-Examples 
- Kudo to: https://github.com/johnwinans

## Install from packages (where available)

On Ubuntu 22.04.2 LTS (WSL):

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

# To simulate an application and view a waveform of it running 

```
cd blinky2
make plot
```

Then, in gtkwave, open (double-click) the 'tb' object in the tree, click on 'uut'. 

Then, in the signals box below click on the 'clk' signal and ctrl-click on 'counter[24:0]'
(so that they are both selected at the same time) and click the Append button at the 
bottom left.  

At this point, you can zoom and scroll around the waveform on the right to see the 
clock signal ticking and the counter advancing on the rising/positive edge of 
the 'clk' signal.

# Program

To program the ICEStick path to the respective directory and use the following promp:

```
make program
```


If you are using WSL and to configure USB passthrough visit: 
https://learn.microsoft.com/en-us/windows/wsl/connect-usb
