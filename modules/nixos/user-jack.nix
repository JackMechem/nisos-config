{ pkgs, ... }:

{

  users.users.jack = {
    isNormalUser = true;
    shell = pkgs.zsh;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [ zed-editor cargo ];
  };
}
