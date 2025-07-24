{ config, lib, pkgs, inputs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    inputs.home-manager.nixosModules.default
    ../../modules/nixos/gtkapps.nix
    ../../modules/nixos/gtkbar.nix
    ../../modules/nixos/fonts.nix
    ../../modules/nixos/system-packages.nix
    ../../modules/nixos/user-jack.nix
    ../../modules/nixos/sound.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "t480";
  networking.networkmanager.enable = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  time.timeZone = "America/Los_Angeles";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  services.dbus.enable = true;

  programs.zsh.enable = true;

  programs.thunar.enable = true;

  programs.dconf.enable = true;

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = { "jack" = import ./home.nix; };
  };

  nixpkgs.config.allowUnfree = true;

  services.libinput.enable = true;

  services.openssh.enable = true;

  system.stateVersion = "25.05";

}

