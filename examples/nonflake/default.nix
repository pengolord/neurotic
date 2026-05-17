let
  pkgs = import <nixpkgs> { };
  nixosSystem = import <nixpkgs/nixos/lib/eval-config.nix>; # equivalent to lib.nixosSystem in flakes
  inherit (pkgs) lib;
  inherit (lib) evalModules;

  # Evaluate all the top-level modules.
  top-level =
    evalModules
      {
        # Defines every file that will be imported.
        # Import only top-level modules here.
        modules = [
          ./options.nix

          ./some-module.nix
          # This isn't needed because ./some-module.nix already imports ./another-module.nix.
          # ./another-module.nix

          # If you want to import everything, like in a typical dendritic config, use the import-tree function from the flake example.
        ];
        # Additional arguments that will be available across all of your top-level modules.
        specialArgs = {
          outerArg = 17;
        };
      }
      .config; # Pull out the config attribute to get the result of the evaluation.
in
nixosSystem {
  modules = [
    # You can import nixos modules here.
    ./nixos-only/c.nix

    # You can also include outputs of your top-level.
    top-level.modules.nixos.some-module
    top-level.modules.nixos.another-module
  ];
  specialArgs = {
    innerArg = 12;
  };
  system = "x86_64-linux";
}
