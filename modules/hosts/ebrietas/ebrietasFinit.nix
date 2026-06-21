{
  flake.nixosModules.ebrietasFinit = { config, ... }: {
    finit = {
      runlevel = 3;
      services.nix-daemon = {
        environment.CURL_CA_BUNDLE = config.security.pki.caBundle;
      };
    };
  };
}
