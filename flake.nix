{
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    nixos-generators = {
      url = "github:nix-community/nixos-generators";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nixos-generators, ... }: {
    packages.x86_64-linux = {
      # Cloud Native
      #amazon = nixos-generators.nixosGenerate {
      #  system = "x86_64-linux";
      #  modules = [
      #    # you can include your own nixos configuration here, i.e.
      #    # ./configuration.nix
      #  ];
      #  format = "amazon";
      #};

      #gce = nixos-generators.nixosGenerate {
      #  system = "x86_64-linux";
      #  modules = [
      #  ];
      #  format = "gce";
      #};

      #docker = nixos-generators.nixosGenerate {
      #  system = "x86_64-linux";
      #  modules = [
      #  ];
      #  format = "docker";
      #};

      iso = nixos-generators.nixosGenerate {
        system = "x86_64-linux";
        modules = [
          platforms/iso.nix
        ];
        format = "iso";
      };

      # Virtual Machines

      #vagrant = nixos-generators.nixosGenerate {
      #  system = "x86_64-linux";
      #  modules = [
      #  ];
      #  format = "vagrant-virtualbox";
      #};

      #vbox = nixos-generators.nixosGenerate {
      #  system = "x86_64-linux";
      #  format = "virtualbox";
      #};

      #vmware = nixos-generators.nixosGenerate {
      #  system = "x86_64-linux";
      #  modules = [
      #  ];
      #  format = "vmware";
      #};
    };

    nixosConfigurations = {
      mini = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = with self.nixosModules; [
        { config = { nix.registry.nixpkgs.flake = nixpkgs; }; }
        traits/base.nix
        traits/brink.nix
        platforms/nuc.nix
       ];
     };
   };

}
;
}

