
Compile and Install of the Verilog-Perl Library
===============================================

This repository contains make file for easy compile and install of [Verilog-Perl](https://www.veripool.org/wiki/verilog-perl).

Get Source Code
===============

## ed_verilog_perl
```bash
git clone https://github.com/embed-dsp/ed_verilog_perl.git
```

## Verilog-Perl
```bash
# Enter the ed_verilog_perl directory.
cd ed_verilog_perl

# Clone the Verilog-Perl git repository.
make clone

# Pull latest updates from the Verilog-Perl git repository.
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

# Configure source code.
make configure

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

This has been testes with the following Linux distributions and compilers:
* `Fedora-27 (64-bit)` and `gcc-7.2.1`
