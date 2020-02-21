{ buildPythonPackage, fetchPypi, traitlets, jupyter_client }:

buildPythonPackage rec {
  version = "0.3.0";
  pname   = "toree";
  format = "setuptools";

  src = fetchPypi {
      inherit pname version format;
      sha256 = "1fx6b359wsawimqrn56my25qbqaprqd0jxw5mfajlvxf7ay4x75b";
  };

  propagatedBuildInputs = [ traitlets jupyter_client ];

}