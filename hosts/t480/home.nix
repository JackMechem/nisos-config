{
  config,
  pkgs,
  inputs,
  ...
}:

{

  imports = [
    inputs.zen-browser.homeModules.twilight
    ../../modules/home-manager/zsh.nix
    ../../modules/home-manager/tmux.nix
    ../../modules/home-manager/hyprland.nix
    ../../modules/home-manager/homepackages.nix
  ];

  programs.home-manager.enable = true;
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "jack";
  home.homeDirectory = "/home/jack";

  home.stateVersion = "25.05"; # Please read the comment before changing.

  programs.zen-browser.enable = true;

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = { };

  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = (_: true);
    };
  };

  gtk = {
    enable = true;

    theme = {
      name = "Graphite-Dark";
      package = pkgs.graphite-gtk-theme;
    };

    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
  };

  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    name = "capitaine-cursors";
    package = pkgs.capitaine-cursors;
    size = 32; # optional, adjust as needed
  };

  xdg.configFile = {
    "gtk-4.0/assets".source =
      "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/assets";
    "gtk-4.0/gtk.css".source =
      "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/gtk.css";
    "gtk-4.0/gtk-dark.css".source =
      "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/gtk-dark.css";
  };

  home.file = {
    ".config/ghostty/config".text = ''
      font-size = 15
      palette = 0=#0d0c0c
      palette = 1=#c4746e
      palette = 2=#8a9a7b
      palette = 3=#c4b28a
      palette = 4=#8ba4b0
      palette = 5=#a292a3
      palette = 6=#8ea4a2
      palette = 7=#c8c093
      palette = 8=#a6a69c
      palette = 9=#e46876
      palette = 10=#87a987
      palette = 11=#e6c384
      palette = 12=#7fb4ca
      palette = 13=#938aa9
      palette = 14=#7aa89f
      palette = 15=#c5c9c5

      background = 181616
      foreground = c5c9c5
      cursor-color = c8c093
      selection-background = 2d4f67
      selection-foreground = c8c093
    '';
  };

  home.shellAliases = {
    nixreb = "sudo nixos-rebuild switch --flake /home/jack/nixos/#t480";
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

}
