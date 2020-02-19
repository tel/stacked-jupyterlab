{ buildPythonPackage
, fetchPypi
, statsmodels
, mizani
}:

buildPythonPackage rec {
  version = "0.6.0";
  pname   = "plotnine";
  format = "wheel";

  src = fetchPypi {
      inherit pname version format;
      python = "py3";
      sha256 = "10znympw4aayn3qxxjk8pjk7mz0n2555992ik7h6nvr7vy7d0wf2";
  };

  propagatedBuildInputs = [ statsmodels mizani ];

}