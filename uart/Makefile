TOP=..

-include  $(TOP)/Make.local
include $(TOP)/Make.rules

.PHONY: all clean burn world timings

FILES= \
	clk_presc.v\
	blink.v\
	top.v

all:: top.bin

top.json: $(FILES)
	$(COMPILE.v) -p "synth_ice40 -top top -json $@" $^

timing: top.asc
	icetime -tmd $(DEVICE) $^

clk_presc_tb.vvp: clk_presc_tb.v clk_presc.v
	iverilog -o $@ $^

plot: clk_presc_tb.vcd
	gtkwave $^

prog: top.bin
	$(FLASH_PROG) $^

# extra dependancies
top.asc: $(PINMAP)