
MAKE_PID := $(shell ps -o ppid= -p $$$)

foo: bar
	echo "The make PID is $(MAKE_PID)"
	echo "made foo from bar"
	touch foo

.PHONY: bar
	echo "making bar"
