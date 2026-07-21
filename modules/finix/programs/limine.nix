{inputs, ...}: {
  flake.modules.finix.programs.limine = {
    imports = [inputs.finix.nixosModules.limine];
    programs.limine = {
      enable = true;
      secureBoot.enable = true;
      settings.wallpaper = [];
      extraEntries = ''
        /Windows
          protocol: efi
        path: uuid(d959c6f8-557d-406a-b4c9-32f559ac7c03):/EFI/Microsoft/Boot/bootmgfw.efi
      '';
    };
  };
}
