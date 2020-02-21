{ buildPythonPackage, fetchPypi, matplotlib, scipy, seaborn }:

buildPythonPackage rec {
  version = "0.4.2";
  pname   = "missingno";
  format = "wheel";

  src = fetchPypi {
      inherit pname version format;
      python = "py3";
      sha256 = "0mxqrjrdm2sw1sg0zdp87j1rknz04cdndn84nnw25d5prcv3pld7";
  };

  propagatedBuildInputs = [ matplotlib scipy seaborn ];

}