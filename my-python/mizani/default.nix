{ buildPythonPackage
, fetchPypi
, matplotlib
, palettable
, pandas
, descartes
}:

buildPythonPackage rec {
  version = "0.6.0";
  pname   = "mizani";
  format = "wheel";

  src = fetchPypi {
      inherit pname version format;
      sha256 = "16z2m5mljsgj9pj9sd8jk6318rsrcqkwfihfpq8x8s481rn6p2fs";
  };

  propagatedBuildInputs = [ matplotlib palettable pandas descartes ];

}