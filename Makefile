
# Copyright (c) 2018 embed-dsp
# All Rights Reserved

# $Author:   Gudmundur Bogason <gb@embed-dsp.com> $
# $Date:     $
# $Revision: $

# Package version number (git TAG)
PACKAGE_VERSION = Verilog-Perl_3_448

# Package name and version number
PACKAGE = $(PACKAGE_VERSION)


# Select between 32-bit or 64-bit machine (Default 64-bit)
ifeq ($(M),)
	M = 64
endif


# Set number of simultaneous jobs (Default 4)
ifeq ($(J),)
	J = 4
endif


ifeq ($(M), 64)
	PREFIX = /opt/veripool/linux_x86_64/$(PACKAGE)
else
	PREFIX = /opt/veripool/linux_x86/$(PACKAGE)
endif


all:
	@echo ""
	@echo "## First time"
	@echo "make clone              # Get openocd source from git repo"
	@echo "make prepare            # Checkout specific version"
	@echo "make configure [M=...]"
	@echo "make compile [J=...]"
	@echo "sudo make install"
	@echo ""
	@echo "## Any other time"
	@echo "make distclean          # Clean all build products"
	@echo "make pull               # ..."
	@echo "make prepare            # Checkout specific version"
	@echo "make configure [M=...]"
	@echo "make compile [J=...]"
	@echo "sudo make install"
	@echo ""


.PHONY: clone
clone:
	git clone http://git.veripool.org/git/Verilog-Perl verilog_perl


.PHONY: pull
pull:
	# Discard any local changes
	cd verilog_perl && git checkout -- .
	
	# Checkout master branch
	cd verilog_perl && git checkout master
	
	# ...
	cd verilog_perl && git pull


.PHONY: prepare
prepare:
	# Checkout specific version
	cd verilog_perl && git checkout $(PACKAGE_VERSION)


.PHONY: configure
configure:
	cd verilog_perl && perl Makefile.PL PREFIX=$(PREFIX) LIB=$(PREFIX)


.PHONY: compile
compile:
	cd verilog_perl && make -j$(J)


.PHONY: install
install:
	-mkdir -p $(PREFIX)
	cd verilog_perl && make install


.PHONY: clean
clean:
	cd verilog_perl && make clean


.PHONY: distclean
distclean:
	cd verilog_perl && make distclean
