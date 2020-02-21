{ python3
, stdenv
, name ? "nixpkgs"
, packages ? (_:[])
, writeScriptBin
, spark
, toree
}:

let
  kernelEnv = python3.withPackages (p:
    packages p ++ (with p; [
      toree
    ])
  );

  kernelFile = {
    display_name = "Spark - ${name}";
    language = "spark";
    argv = [
      "${kernelEnv.interpreter}"
      "-m"
      "ipykernel_launcher"
      "-f"
      "{connection_file}"
    ];
    logo64 = "logo-64x64.png";
  };

  pythonBin = writeScriptBin "python-${name}" ''
    ${kernelEnv.interpreter} "$@"
  '';

  ipythonKernel = stdenv.mkDerivation {
    name = "ipython-${name}";
    src = ./python.png;
    phases = "installPhase";
    installPhase = ''
      mkdir -p $out/kernels/ipython_${name}
      cp $src $out/kernels/ipython_${name}/logo-64x64.png
      echo '${builtins.toJSON kernelFile}' > $out/kernels/ipython_${name}/kernel.json
    '';
  };
in
  {
    spec = ipythonKernel;
    runtimePackages = [
      # Lets the user to use libraries from the Python command.
      pythonBin
    ];
  }