
# Compile and Install of the Verilog-Perl Library

This repository contains make file for easy compile and install of [Verilog-Perl](https://www.veripool.org/wiki/verilog-perl).


# Prerequisites

## Fedora-27 64-bit

```
dnf install gcc-c++

dnf install perl
dnf install perl-devel

dnf install redhat-rpm-config
```


# Get Source Code

## ed_verilog_perl

```bash
git clone https://github.com/embed-dsp/ed_verilog_perl.git
```

## Verilog-Perl

```bash
# Enter the ed_verilog_perl directory.
cd ed_verilog_perl

# FIXME: Only first time
# Clone the Verilog-Perl git repository.
make clone

# FIXME: Any other time
# Pull latest updates from the Verilog-Perl git repository.
make pull
```

```bash
# FIXME: Check for available versions
cd iverilog
git tag

# Edit the Makefile for selecting the Verilog-Perl source version.
vim Makefile
PACKAGE_VERSION = Verilog-Perl_3_452
```


# Build

```bash
# Checkout specific version and rebuild configure.
make prepare
```

```bash
# Configure source code.
make configure
```

```bash
# Compile source code using 4 simultaneous jobs (Default: J=4).
make compile
make compile J=4
```


# Install

```bash
# Install build products.
sudo make install
```

The Verilog-Perl package does NOT install correctly according to the
[GNU Coding Standards](https://www.gnu.org/prep/standards/standards.html).
The build products are therefore installed in the following locations in order 
to allow separate installation for different architectures:

```bash
opt/
└── veripool/
    ├── linux_x86_64/           # 64-bit binaries and libraries for Linux
    │   └── Verilog-Perl_3_452/
    │       ├── bin/
    │       │   ├── vhier       # Return all files in a verilog hierarchy
    │       │   ├── vpassert    # Preprocess Verilog code assertions
    │       │   ├── vppreproc   # Preprocess Verilog code using verilog-perl
    │       │   ├── vrename     # Change signal names across many Verilog files
    │       │       ...
    │       └── share/          # ...
    │           ...
    └── linux_x86/              # 32-bit binaries and libraries for Linux
        └── Verilog-Perl_3_452/
            ├── bin/
            │   ├── vhier       # Return all files in a verilog hierarchy
            │   ├── vpassert    # Preprocess Verilog code assertions
            │   ├── vppreproc   # Preprocess Verilog code using verilog-perl
            │   ├── vrename     # Change signal names across many Verilog files
            │       ...
            └── share/          # ...
                ...
```


# Notes

This has been testes with the following Linux distributions and compilers:
* `Fedora-27 (64-bit)`
    * `gcc-7.2.1`
    * `gcc-7.3.1`
