# My NeoVim config

This is my NeoVim configuration fully configured with [NixVim](https://github.com/nix-community/nixvim).

## Requirements

1. The Nix Package manager needs to be installed. Instructions to install it can be found [here](https://nixos.org/download/).
2. Flakes feature must be enabled. More information on how to do so can be found [here](https://nix.dev/concepts/flakes.html#running-commands).

## Usage

```nix
# The flake file
inputs = {
  mynixvim = {
    url = "github:solidassassin/nvim-flake"
    # This can be ommited if your system uses the unstable branch as well
    inputs.nixpkgs.follows = "<your_nixpkgs_input_name>"
  }
}
```

### As a package with Home Manager

Plug and play experience:

```nix
# Home Manager configuration file
home.packages = [
  inputs.mynixvim.packages.${pkgs.system}.default
];
```

### As a module

Useful for when you want to override some options:

```nix
# Home Manager configuration file
imports = [
  inputs.mynixvim.homeModules.default
];
```
