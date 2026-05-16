let
  pkgs = import <nixpkgs> {};
  lib = pkgs.lib;
  nixosSystem = import <nixpkgs/nixos/lib/eval-config.nix>; # equivalent to lib.nixosSystem in flakes
  neurotic = import ../. { inherit pkgs; };

  # evaluate the top-level modules
  top-level = neurotic.evalModules {
    modules = [
      # import only top-level modules here
      ./a.nix # b.nix is imported by a.nix
    ];
    specialArgs.argOuter = 1;
  };
in
nixosSystem {
  modules = [
    # import nixos modules here
    top-level.config.modules.nixos.default # include the nixos module using the path: modules.nixos.default
    ./nixos-only/c.nix # alternatively, see b.nix
  ];
  specialArgs.argInner = 2;
  system = "x86_64-linux";
}
