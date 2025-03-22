{ stdenv
, lib
, qtbase
, full
, cppfront
, cmake
, wrapQtAppsHook
}:
let

  pname   = "example_hw_qt6";
  version = "0.1.0";

in stdenv.mkDerivation
{
  inherit pname version;

  src = ./.;

  buildInputs = [
    qtbase
    full
  ];

  nativeBuildInputs = [
    cmake
    cppfront
    wrapQtAppsHook
  ];

  installPhase = ''
    ls -lsa
    mkdir -p $out
    cp -r ./bin $out
  '';
}
