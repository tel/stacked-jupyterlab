{ python3 }:

python3.override {
  packageOverrides = self: super: rec {
    pytorch = super.pytorch.override { cudaSupport = true; };
    torchaudio = self.callPackage ./torchaudio {};
    torchtext = self.callPackage ./torchtext {};
    plotnine = self.callPackage ./plotnine {};
    mizani = self.callPackage ./mizani {};
  };
}