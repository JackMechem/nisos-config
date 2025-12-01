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
    c = "clear";
    cl = "clear && ls";
    nixconf = "nvim ~/nixos/";
    a = ''echo -e " a -> List aliases nixreb -> Rebuild nixos config\n nixconf -> Open nixos config\n v -> nvim\n c -> clear\n cl -> clear && ls"'';
  };
}
