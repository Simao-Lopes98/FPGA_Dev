TOP=..

-include  $(TOP)/Make.local
include $(TOP)/Make.rules

.PHONY: all clean burn world timings

# workspace directories
CODE_DIR = src/

TEST_BENCH_DIR = test/

FILES = $(CODE_DIR)top.v \
		$(CODE_DIR)sap_register.v \
		$(CODE_DIR)byte_led.v \
		$(CODE_DIR)sap_alu.v

all:: top.bin

top.json: $(FILES)
	$(COMPILE.v) -p "synth_ice40 -top top -json $@" $^

timing: top.asc
	icetime -tmd $(DEVICE) $^

sap_top_tb.vvp: $(TEST_BENCH_DIR)sap_top_tb.v $(FILES)
	iverilog -o $@ $^

plot: sap_top_tb.vcd
	gtkwave $^

prog: top.bin
	$(FLASH_PROG) $^

# extra dependancies
top.asc: $(PINMAP)