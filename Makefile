
# Copyright (c) 2018 embed-dsp
# All Rights Reserved

# $Author:   Gudmundur Bogason <gb@embed-dsp.com> $
# $Date:     $
# $Revision: $


PACKAGE_NAME = verilog_perl

# Package version number (git master branch)
# PACKAGE_VERSION = master
# PACKAGE = "Verilog-Perl"_$(PACKAGE_VERSION)

# Package version number (git tag)
PACKAGE_VERSION = Verilog-Perl_3_452
PACKAGE = $(PACKAGE_VERSION)

# Build for 32-bit or 64-bit (Default)
ifeq ($(M),)
	M = 64
endif

ifeq ($(M),64)
	# CXXFLAGS = -Wall -O2 -m64
else
	# CXXFLAGS = -Wall -O2 -m64
endif

# Architecture.
ARCH = $(shell ./bin/get_arch.sh $(M))

# Installation directories.
PREFIX = /opt/veripool/$(ARCH)/$(PACKAGE)
# PREFIX = /opt/veripool/$(PACKAGE)
# EXEC_PREFIX = $(PREFIX)/$(ARCH)

# Set number of simultaneous jobs (Default 4)
ifeq ($(J),)
	J = 4
endif


all:
	@echo ""
	@echo "## Get Source Code"
	@echo "make clone"
	@echo "make pull"
	@echo ""
	@echo "## Build"
	@echo "make prepare"
	@echo "make configure"
	@echo "make compile [J=...]"
	@echo ""
	@echo "## Install"
	@echo "sudo make install"
	@echo ""
	@echo "## Cleanup"
	@echo "make distclean"
	@echo "make clean"
	@echo ""


.PHONY: clone
clone:
	git clone http://git.veripool.org/git/Verilog-Perl $(PACKAGE_NAME)


.PHONY: pull
pull:
	# Discard any local changes
	cd $(PACKAGE_NAME) && git checkout -- .
	
	# Checkout master branch
	cd $(PACKAGE_NAME) && git checkout master
	
	# ...
	cd $(PACKAGE_NAME) && git pull


.PHONY: prepare
prepare:
	# Checkout specific version
	cd $(PACKAGE_NAME) && git checkout $(PACKAGE_VERSION)


.PHONY: configure
configure:
	cd $(PACKAGE_NAME) && perl Makefile.PL PREFIX=$(PREFIX) LIB=$(PREFIX)


.PHONY: compile
compile:
	cd $(PACKAGE_NAME) && make -j$(J)


.PHONY: install
install:
	# -mkdir -p $(PREFIX)
	cd $(PACKAGE_NAME) && make install


.PHONY: clean
clean:
	cd $(PACKAGE_NAME) && make clean


.PHONY: distclean
distclean:
	cd $(PACKAGE_NAME) && make distclean
