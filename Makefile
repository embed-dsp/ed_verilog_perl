
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
PACKAGE_VERSION = Verilog-Perl_3_454
PACKAGE = $(PACKAGE_VERSION)

# Build for 32-bit or 64-bit (Default)
ifeq ($(M),)
	M = 64
endif

# Set number of simultaneous jobs (Default 4)
ifeq ($(J),)
	J = 4
endif

# Kernel.
KERN = $(shell ./bin/get_kernel.sh)

# Machine.
MACH = $(shell ./bin/get_machine.sh $(M))

# Architecture.
ARCH = $(KERN)_$(MACH)

# ...
CONFIGURE_FLAGS =

# Linux specifics.
ifeq ($(KERN),linux)
	# Compiler.
	# CC = /usr/bin/gcc
	# CXX = /usr/bin/g++
	# Installation directory.
	INSTALL_DIR = /opt
endif

# Cygwin specifics.
ifeq ($(KERN),cygwin)
	# Compiler.
	# CC = /usr/bin/gcc
	# CXX = /usr/bin/g++
	# Installation directory.
	INSTALL_DIR = /cygdrive/c/opt
endif

# MinGW specifics.
ifeq ($(KERN),mingw32)
	# Compiler.
	# CC = /mingw/bin/gcc
	# CXX = /mingw/bin/g++
	# Installation directory.
	INSTALL_DIR = /c/opt
endif

# MinGW-W64 specifics.
ifeq ($(KERN),mingw64)
	# Compiler.
	# CC = /mingw64/bin/gcc
	# CXX = /mingw64/bin/g++
	# Installation directory.
	INSTALL_DIR = /c/opt
endif

# Installation directory.
PREFIX = $(INSTALL_DIR)/veripool/$(ARCH)/$(PACKAGE)
# EXEC_PREFIX = $(PREFIX)/$(ARCH)


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
	@echo "make clean"
	@echo "make distclean"
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
	cd $(PACKAGE_NAME) && perl Makefile.PL PREFIX=$(PREFIX) LIB=$(PREFIX) $(CONFIGURE_FLAGS)


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
