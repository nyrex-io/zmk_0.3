SHIELD ?= nyrex65x2
BOARD ?= wonderboard

init: 
	west init -l app/
	west update

build_left:
	cd app && west build -d ../build/left -p -b $(BOARD) -S studio-rpc-usb-uart -- -DSHIELD=$(SHIELD)_left 
	mv build/left/zephyr/zmk.uf2 build/$(SHIELD)_$(BOARD)_left.uf2
	
build_right:
	cd app && west build -d ../build/right -p -b $(BOARD) -S studio-rpc-usb-uart -- -DSHIELD=$(SHIELD)_right 
	mv build/right/zephyr/zmk.uf2 build/$(SHIELD)_$(BOARD)_right.uf2

build: build_left build_right