(import ./reflex-platform {}).project ({ pkgs, ... }: {
  packages = {
    bug = ./.;
  };

  shells = {
    ghc = ["bug"];
    ghcjs = ["bug"];
  };
})
