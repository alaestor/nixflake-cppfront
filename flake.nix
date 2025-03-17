{
  description = "Experimental flake for cppfront (CPP2)";

  inputs = {
    nixpkgs.url     = "nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs = i: i.flake-parts.lib.mkFlake { inputs = i; } {
      systems = [ "x86_64-linux" "aarch64-linux" "aarch64-darwin" "x86_64-darwin" ];
      perSystem = { config, self', inputs', pkgs, system, ... }:
      let
        cppfront = pkgs.callPackage ./cppfront.nix { };
      in
      {
        packages = {
          default   = cppfront;
          hellocpp2 = pkgs.callPackage ./hellocpp2.nix { inherit cppfront; };
        };
        devShells.default = pkgs.mkShell rec {
          name = "Experimental cppfront shell";
          buildInputs = [];
          packages = with pkgs; [
            libgcc
            cppfront
          ];
        };

      };
    };
}
