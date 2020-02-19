{ buildPythonPackage
, fetchPypi
, pytorch
, requests
, sentencepiece
, tqdm
}:

buildPythonPackage rec {
  version = "0.5.0";
  pname   = "torchtext";
  format = "wheel";

  src = fetchPypi {
    inherit pname version format;
    python = "py3";
    sha256 = "0rszckqkns14z1sqyy6wv7n8cbqyyjq3bdzdva2lhny4aphx5bhw";
  };

  propagatedBuildInputs = [
    pytorch requests sentencepiece tqdm 
  ];

}