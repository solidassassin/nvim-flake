{
  description = "A Nixvim configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    nixvim.url = "github:nix-community/nixvim";
    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs =
    { nixvim, flake-parts, ... }@inputs:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];

      flake = {
        homeModules.default =
          { pkgs, lib, ... }:
          {
            imports = [ nixvim.homeModules.nixvim ];
            programs.nixvim = import ./config { inherit pkgs lib; };
          };
        nixosModules.default =
          { pkgs, lib, ... }:
          {
            imports = [ nixvim.nixosModules.nixvim ];
            programs.nixvim = import ./config { inherit pkgs lib; };
          };
        darwinModules.default =
          { pkgs, lib, ... }:
          {
            imports = [ nixvim.darwinModules.nixvim ];
            programs.nixvim = import ./config { inherit pkgs lib; };
          };
      };

      perSystem =
        { system, ... }:
        let
          nixvimLib = nixvim.lib.${system};
          nixvim' = nixvim.legacyPackages.${system};
          nixvimModule = {
            inherit system; # or alternatively, set `pkgs`
            module = import ./config; # import the module directly
            # You can use `extraSpecialArgs` to pass additional arguments to your module files
            extraSpecialArgs = {
              # inherit (inputs) foo;
            };
          };
          nvim = nixvim'.makeNixvimWithModule nixvimModule;
        in
        {
          checks = {
            # Run `nix flake check .` to verify that your config is not broken
            default = nixvimLib.check.mkTestDerivationFromNixvimModule nixvimModule;
          };

          packages = {
            # Lets you run `nix run .` to start nixvim
            default = nvim;
          };
        };
    };
}
