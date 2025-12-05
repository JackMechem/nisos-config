{ pkgs, ... }:

{
  home.packages = with pkgs; [
    pkgs.sway-contrib.grimshot
    waypaper
    hyprpaper
    swaybg
    lua-language-server
    nil
    nixfmt-rfc-style
    stylua

    lunar-client
    discord

    spotify
    pavucontrol
  ];
}
