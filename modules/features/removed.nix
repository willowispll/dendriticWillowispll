{
  flake.nixosModules.removed = {
    programs.nano.enable = false;
    documentation = {
      enable = false;
      man.enable = false;
      info.enable = false;
      doc.enable = false;
      nixos.enable = false;
    };
  };
}
