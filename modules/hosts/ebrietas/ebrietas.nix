{ self, inputs, ... }:
let
  inherit (inputs.finix.lib) finixSystem;
in
{
  flake.nixosConfigurations.ebrietas = finixSystem {
    inherit (inputs.nixpkgs) lib;
    modules = with self.nixosModules; [
      ebrietasHardware
      ebrietasConfiguration
      nixpkgs

      inputs.finix.nixosModules.bash
      inputs.finix.nixosModules.sudo
      inputs.finix.nixosModules.dhcpcd
      inputs.finix.nixosModules.iwd
      inputs.finix.nixosModules.nix-daemon
      inputs.finix.nixosModules.polkit
      inputs.finix.nixosModules.sysklogd
      inputs.finix.nixosModules.nano
      inputs.finix.nixosModules.getty
    ];
  };
}
