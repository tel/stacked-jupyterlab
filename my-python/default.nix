{ python3 }:

python3.override {
  packageOverrides = self: super: rec {
    missingno = self.callPackage ./missingno {};
    mizani = self.callPackage ./mizani {};
    plotnine = self.callPackage ./plotnine {};
    pytorch = super.pytorch.override { cudaSupport = true; };
    torchaudio = self.callPackage ./torchaudio {};
    torchtext = self.callPackage ./torchtext {};
    toree = self.callPackage ./toree {};
  };
}