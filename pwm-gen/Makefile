TOP=..

include $(TOP)/Make.rules

.PHONY: all clean burn world timings

FILES= \
	top.v \
	pwm_gen.v

all:: top.bin

top.json: $(FILES)
	$(COMPILE.v) -p "synth_ice40 -top top -json $@" $^

timing: top.asc
	icetime -tmd $(DEVICE) $^

pwm_gen_tb.vvp: pwm_gen_tb.v pwm_gen.v
	iverilog -o $@ $^

plot: pwm_gen_tb.vcd
	gtkwave $^

prog: top.bin
	$(FLASH_PROG) $^

# extra dependancies
top.asc: $(PINMAP)