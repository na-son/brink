{ config, pkgs, ... }:

{


  environment.systemPackages = with pkgs; [
    pixiecore
  ];

  networking = {
    hostName = "brink";
    firewall = {
      allowedTCPPorts = [ 22 ];
      allowedUDPPorts = [ ];
    };
  };



  services = {
    pixiecore = {
      enable = true;
      openFirewall = true;
    };
  };

  users.users.nason = {
    initialPassword = "test";
    isNormalUser = true;
     extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
     packages = with pkgs; [
       vim
     ];
  };

  system.stateVersion = "23.05";
}

