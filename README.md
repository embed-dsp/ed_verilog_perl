
Compile and Install of the Verilog-Perl Library
===============================================

This repository contains make file for easy compile and install of the Verilog-Perl Library.

Get tool and source code
========================

## ed_verilog_perl
```bash
git clone https://github.com/embed-dsp/ed_verilog_perl.git
```

## Verilog-Perl Source
```bash
# Enter the ed_verilog_perl directory.
cd ed_verilog_perl

# Clone Verilog-Perl repository.
make clone

# Pull latest updates from Verilog-Perl repository.
make pull

# Edit the Makefile for selecting the Verilog-Perl source version.
vim Makefile
PACKAGE_VERSION = Verilog-Perl_3_448
```

Build
=====
```bash
# Checkout specific version and rebuild configure.
make prepare

# Configure source code for 64-bit compile (Default: M=64).
make configure
make configure M=64

# Configure source code for 32-bit compile.
make configure M=32

# Compile source code using 4 simultaneous jobs (Default: J=4).
make compile
make compile J=4
```

Install
=======
```bash
# Install build products.
sudo make install
```

The build products are installed in the following locations:
```bash
opt
└── veripool
    ├── linux_x86_64            # 64-bit binaries and libraries for Linux
    │   └── Verilog-Perl_3_448
    │       ├── bin
    │       │   ├── vhier       # Return all files in a verilog hierarchy
    │       │   ├── vpassert    # Preprocess Verilog code assertions
    │       │   ├── vppreproc   # Preprocess Verilog code using verilog-perl
    │       │   ├── vrename     # Change signal names across many Verilog files
    │       │       ...
    │       └── share           # ...
    │           ...
    └── linux_x86               # 32-bit binaries and libraries for Linux
        └── Verilog-Perl_3_448
            ...
```

Notes
=====
