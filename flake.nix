{
  description = "Experimental flake for cppfront (CPP2)";

  inputs = {
    nixpkgs.url     = "nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs = i: i.flake-parts.lib.mkFlake { inputs = i; } {
      systems = [ "x86_64-linux" "aarch64-linux" ];
      perSystem = { config, self', inputs', pkgs, system, ... }:
      let
        cppfront = pkgs.callPackage ./cppfront.nix { };
      in
      {
        packages = {
          default   = cppfront;
          example   = pkgs.callPackage             ./example_hw     { inherit cppfront; };
          exampleqt = pkgs.qt6Packages.callPackage ./example_hw_qt6 { inherit cppfront; };
        };
        devShells = {
          default = pkgs.mkShell {
            name = "CPP2";
            inputsFrom = [ config.packages.example ];
          };
          qt = pkgs.mkShell {
            name = "CPP2 CMAKE QT6";
            inputsFrom = [ config.packages.exampleqt ];
            packages = with pkgs; [ qtcreator ];
          };
        };

      };
    };
}
