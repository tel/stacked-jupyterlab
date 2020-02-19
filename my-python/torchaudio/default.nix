{ buildPythonPackage
, fetchFromGitHub
, six
, which
, numpy
, pytorch
, lib
, sox
, cudatoolkit
}:

buildPythonPackage rec {
  version = "0.4.0";
  pname   = "torchaudio";
  format = "setuptools";

  src = fetchFromGitHub {
    owner = "pytorch";
    repo = "audio";
    rev = "445e14d1feb3ec4620598a3bc3f1ee3236aa87de";
    sha256 = "1dwfspfgkpia9cwwvqs9y8lss2rz10hcnb6gpnb3rvpfivdig6b2";
  };

  nativeBuildInputs = [ which cudatoolkit ];
  propagatedBuildInputs = [ six numpy pytorch sox ];

}