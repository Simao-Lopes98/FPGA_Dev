TOP=..

-include  $(TOP)/Make.local
include $(TOP)/Make.rules

.PHONY: all clean burn world timings

FILES= top.v sap_register.v byte_led.v

all:: top.bin

top.json: $(FILES)
	$(COMPILE.v) -p "synth_ice40 -top top -json $@" $^

timing: top.asc
	icetime -tmd $(DEVICE) $^

sap_top_tb.vvp: sap_top_tb.v top.v sap_register.v byte_led.v
	iverilog -o $@ $^

plot: sap_top_tb.vcd
	gtkwave $^

prog: top.bin
	$(FLASH_PROG) $^

# extra dependancies
top.asc: $(PINMAP)