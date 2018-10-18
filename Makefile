
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

# ==============================================================================

# Set number of simultaneous jobs (Default 4)
ifeq ($(J),)
	J = 4
endif

# System and Machine.
SYSTEM = $(shell ./bin/get_system.sh)
MACHINE = $(shell ./bin/get_machine.sh)

# System configuration.
CONFIGURE_FLAGS =

# Linux system.
ifeq ($(SYSTEM),linux)
	# Installation directory.
	INSTALL_DIR = /opt
endif

# Cygwin system.
ifeq ($(SYSTEM),cygwin)
	# Installation directory.
	INSTALL_DIR = /cygdrive/c/opt
endif

# MSYS2/mingw32 system.
ifeq ($(SYSTEM),mingw32)
	# Installation directory.
	INSTALL_DIR = /c/opt
endif

# MSYS2/mingw64 system.
ifeq ($(SYSTEM),mingw64)
	# Installation directory.
	INSTALL_DIR = /c/opt
endif

# Architecture.
ARCH = $(SYSTEM)_$(MACHINE)

# Installation directory.
PREFIX = $(INSTALL_DIR)/veripool/$(ARCH)/$(PACKAGE)
# EXEC_PREFIX = $(PREFIX)/$(ARCH)


all:
	@echo "ARCH   = $(ARCH)"
	@echo "PREFIX = $(PREFIX)"
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
	@echo "[sudo] make install"
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
