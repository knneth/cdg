# kbuild includes this file
obj-m := tcp_cdg.o

build:
	make -C /lib/modules/$(shell uname -r)/build M=$(abspath .) modules

clean:
	make -C /lib/modules/$(shell uname -r)/build M=$(abspath .) clean

load: build
	sudo modprobe -r -q tcp_cdg
	sudo insmod tcp_cdg.ko

.PHONY: build clean load
