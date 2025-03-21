# Experimental [CPP2](https://github.com/hsutter/cppfront) Nix Flake

## Nix Shells

`nix develop` for the stdenv tools with cppfront.

`nix develop '.#qt` to also get cmake, qt6, and qtcreator.

## Building

### Build cppfront

`nix build`

### Build & Run Examples

Cpp2 Hello World
```sh
nix build '.#example'
./result/bin/example_hw
```

Cpp2 with CMake and Qt6
```sh
nix build '.#exampleqt'
./result/bin/example_hw_qt
```
