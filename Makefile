
MAKE_PID := $(shell ps -o ppid= -p $$$)
TRY_IT := $(shell echo >&2 'Do a thing.'; sudo sleep 10)

.PHONY: all
all:
	echo "The make PID is $(MAKE_PID)"
