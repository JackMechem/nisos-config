{
  config,
  lib,
  pkgs,
  ...
}:

{
  home.shellAliases = {
    nixreb = "sudo nixos-rebuild switch --flake /home/jack/nixos/#t480";
    v = "nvim";
  };
}
