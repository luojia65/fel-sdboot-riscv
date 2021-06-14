# fel-sdboot-riscv

# Build binary

Compile this project:

```
cargo build
```

Extract binary from build result:

```
cd target/riscv64imac-unknown-none-elf/debug 
rust-objcopy fel-sdboot-riscv --binary-architecture=riscv64 --strip-all -O binary fel-sdboot-riscv.bin
```

# Burn to SD card

Before this process, you may prepare an SD card. It only takes 8 KB of SD card space,
so it's possible to purchase an 32 MB or 64 MB ones for a FEL mode boot card.

(DANGER: Review your `dd` command before executing, or your will permanently lose your data!)

Then, use this command to burn binary into target SD card (danger!):

```
dd if=fel-sdboot-riscv.bin of=<Your SD Card> bs=1024 seek=8
```
