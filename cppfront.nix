{ stdenv, fetchFromGitHub }:
let

  pname   = "cppfront";

  version = "v0.8.1";

  repo = fetchFromGitHub {
    owner  = "hsutter";
    repo   = pname;
    rev    = version;
    sha256 = "sha256-QYjon2EpNexYa2fl09AePkpq0LkRVBOQM++eldcVMvI=";
  };

in stdenv.mkDerivation
{
  inherit pname version;
  src          = repo;
  buildPhase   = "g++ ./source/cppfront.cpp -std=c++20 -o cppfront";
  installPhase = ''
    mkdir -p $out/bin
    cp cppfront $out/bin
    cp -r include $out
  '';
}
