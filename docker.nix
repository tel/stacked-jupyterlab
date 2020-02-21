with (import ./jupyter.nix);
jupyter.mkDockerImage {
  name = "jupyter-image";
  jupyterlab = jupyterEnvironment;
}