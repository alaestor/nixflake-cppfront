{ stdenv, lib, cppfront }:
let

  pname   = "HelloCpp2";
  version = "0.1.0";
  exename = lib.toLower pname;

in stdenv.mkDerivation
{
  inherit pname version;

  buildInputs = [
    cppfront
  ];

  src = ./src;

  buildPhase = ''
    cppfront hello.cpp2 -p
    g++ hello.cpp -std=c++20 -o ${exename}
  '';

  installPhase = ''
    mkdir -p $out/bin
    cp ${exename} $out/bin
  '';
}
