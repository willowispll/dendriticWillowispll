{self, ...}: let
  inherit (self.lib) mkSystem;
in {
  flake.nixosConfigurations.micolash = mkSystem {
    modules = with self.nixosModules; [
      #hostModules
      micolashBoot
      micolashHardware
      micolashLocale
      micolashNetworking
      micolashNix
      micolashStateVersion
      micolashTime
      self.modules.hosts.micolash.user

      #featuresModules
      homeManager
      nixLSP
      removed
      specialisation
      systemPackages
      xdg

      #sharedModules
      self.modules.shared.features.nix
      self.modules.shared.features.nixpkgs
      self.modules.shared.programs.nvf

      #nixosPrograms
      nixosProgramsAmnezia
      nixosProgramsNiri
      nixosProgramsSteam
      nixosProgramsXwayland

      #nixosServices
      nixosServicesLy
    ];

    homeModules = with self.homeModules; [
      #programs
      anki
      bash
      fastfetch
      fuzzel
      git
      glide
      kitty
      nh
      nixcord
      obsidian
      onlyoffice
      spicetify
      waybar
      zed

      #services
      mako

      #utils
      fontconfig
      xdg

      #stylix
      stylix
    ];
  };
}
