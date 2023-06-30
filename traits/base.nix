{ config, pkgs, ... }:

{
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };

  environment.systemPackages = with pkgs; [
    vim
    git
  ];

  networking = {
    networkmanager.enable = true;
    firewall = {
      allowedTCPPorts = [ 22 ];
      allowedUDPPorts = [ ];
    };
  };

  services = {
    openssh.enable = true;
    fstrim.enable = true;
  };

  security.sudo.extraConfig = ''
    Defaults lecture="never"
  '';

  users.mutableUsers = false;

  system.stateVersion = "23.05";
}

