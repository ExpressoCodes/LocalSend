{
  description = "NixOS module for LocalSend";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs }: {
    nixosModules.localsend = { config, pkgs, ... }: {
      programs.localsend = {
        enable = true;
        openFirewall = true;
      };
    };
    nixosModules.default = self.nixosModules.localsend;
  };
}
