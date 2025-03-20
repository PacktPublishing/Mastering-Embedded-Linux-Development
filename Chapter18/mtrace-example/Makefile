# Copyright (C) 2025, Frank Vasquez (frank.vasquez@gmail.com)
#
# If cross-compiling, CC must point to your cross compiler, for example:
# make CC=aarch64-buildroot-linux-gnu-gcc

LOCAL_CFLAGS ?= -O0 -g
PROGRAM = mtrace-example

$(PROGRAM): $(PROGRAM).c
	$(CC) $(CFLAGS) $(LOCAL_CFLAGS) $(LDFLAGS) $^ -o $@

clean:
	rm -f $(PROGRAM)

