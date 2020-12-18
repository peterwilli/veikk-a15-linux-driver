# Veikk A15 Driver

This driver is modified from another Veikk driver to work with the Veikk A15.

# Build the driver

(`cd` to this repo after cloning)

```
make && sudo make install clean
```

Dependencies:

- make
- gcc

# Build packages

## RPM (Fedora, tested on F33 Silverblue)

- Install kernel headers for your kernel version: `dnf install -y kernel-devel-$(uname -r)`

- (Optional, sometimes I had to do this in a Fedora 33 container): `mkdir -p /lib/modules/$(uname -r) && ln -s /usr/src/kernels/$(uname -r) /lib/modules/$(uname -r)/build`

- `fedpkg --release f33 local`