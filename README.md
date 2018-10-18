
# Compile and Install of the Verilog-Perl Library

This repository contains a **make** file for easy compile and install of 
[Verilog-Perl](https://www.veripool.org/wiki/verilog-perl).
The Verilog-Perl library provides Perl parsing and utilities for the Verilog Language.

The following scripts are installed by Verilog-Perl:
* **vhier**
    * Return all files in a verilog hierarchy using Verilog::Netlist
* **vpassert**
    * Preprocess Verilog code assertions
* **vppreproc**
    * Preprocess Verilog code using verilog-perl
* **vrename**
    * Change signal names across many Verilog files


# Get Source Code

## ed_verilog_perl
Get the code for this component to a local directory on your PC.

```bash
git clone https://github.com/embed-dsp/ed_verilog_perl.git
```

## Verilog-Perl
Get the code for the Verilog-Perl.

```bash
# Enter the ed_verilog_perl directory.
cd ed_verilog_perl
```

If this is the first time Verilog-Perl is built, then ...
```bash
# Clone the Verilog-Perl git repository.
make clone
```

Otherwise just pull the latest updates ...
```bash
# Pull latest updates from the Verilog-Perl git repository.
make pull
```

Edit the **Makefile** for selecting the Verilog-Perl source version.
```bash
# Edit Makefile ...
vim Makefile

# ... and set Verilog-Perl source version.
PACKAGE_VERSION = Verilog-Perl_3_454
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
# Compile source code using 4 simultaneous jobs (Default).
make compile

# Compile source code using 2 simultaneous jobs.
make compile J=2
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
/opt/
└── veripool/
    ├── linux_x86_64/           # 64-bit binaries and libraries for Linux
    │   └── Verilog-Perl_3_454/
    │       ├── bin/
    │       │   ├── vhier       # Return all files in a verilog hierarchy
    │       │   ├── vpassert    # Preprocess Verilog code assertions
    │       │   ├── vppreproc   # Preprocess Verilog code using verilog-perl
    │       │   ├── vrename     # Change signal names across many Verilog files
    │       │       ...
    │       └── share/          # ...
    │           ...
    └── linux_x86/              # 32-bit binaries and libraries for Linux
        └── Verilog-Perl_3_454/
            ├── bin/
            │   ├── vhier       # Return all files in a verilog hierarchy
            │   ├── vpassert    # Preprocess Verilog code assertions
            │   ├── vppreproc   # Preprocess Verilog code using verilog-perl
            │   ├── vrename     # Change signal names across many Verilog files
            │       ...
            └── share/          # ...
                ...
```


# Prerequisites

## Fedora-27 64-bit | Fedora-28 64-bit

```bash
# ...
dnf install gcc-c++

# ...
dnf install perl
dnf install perl-devel
dnf install perl-Digest-SHA

# ...
dnf install redhat-rpm-config
```


# Tested System Configurations

The following system configurations have been tested.

System  | .
--------|-------------------
linux   | Fedora-27 64-bit  
linux   | Fedora-28 64-bit  
