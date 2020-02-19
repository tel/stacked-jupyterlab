let
  pkgs-19_09 = import <nixpkgs> {};
  pkgs-unstable-src = pkgs-19_09.fetchFromGitHub {
    owner = "NixOS";
    repo = "nixpkgs";
    rev = "20.03-beta";
    sha256 = "04g53i02hrdfa6kcla5h1q3j50mx39fchva7z7l32pk699nla4hi";
  };
  pkgs = import pkgs-unstable-src {};

  jupyter = import (builtins.fetchGit {
    url = https://github.com/tweag/jupyterWith;
    rev = "7a6716f0c0a5538691a2f71a9f12b066bce7d55c";
  }) {};

  iPython = jupyter.kernels.iPythonWith {
    python3 = pkgs.callPackage ./my-python {};
    packages = p: with p; [
      numpy 
      matplotlib seaborn plotnine bokeh # missingno
      scipy scikitlearn 
      pytorchWithCuda torchvision 
      torchtext
      # torchaudio
    ];
  };

  iR = jupyter.kernels.iRWith {
    packages = p: with p; [ tidyverse dtplyr ];
  };

  jupyterEnvironment =
    jupyter.jupyterlabWith {
      kernels = [ iPython iR ];
      directory = ./jupyterlab;
    };
in
  jupyterEnvironment.env