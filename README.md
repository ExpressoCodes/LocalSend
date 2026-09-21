# localsend-flake

A NixOS flake module that enables [LocalSend](https://localsend.org/) — an open-source app for sharing files locally over your network.

## What this flake does

This flake exposes a NixOS module that:
- Enables `programs.localsend`
- Opens the firewall for LocalSend traffic (`openFirewall = true`)

## Usage

### 1. Add as a flake input

In your `flake.nix`:

```nix
{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    localsend-flake = {
      url = "github:<your-username>/localsend-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, localsend-flake }: {
    nixosConfigurations.my-host = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./configuration.nix
        localsend-flake.nixosModules.default
      ];
    };
  };
}
```

### 2. Options enabled

| Option | Value |
|--------|-------|
| `programs.localsend.enable` | `true` |
| `programs.localsend.openFirewall` | `true` |

## Available module attributes

- `nixosModules.default` — the LocalSend module
- `nixosModules.localsend` — same as above (alias)
