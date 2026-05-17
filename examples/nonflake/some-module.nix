# This file is top-level, as you are probably used to with dendritic.
# You can set things that you defined in the top-level options.
{
  # Your top-level modules can also import other modules, adding them to the top-level.
  imports = [
    ./another-module.nix
  ];

  modules.nixos.some-module =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        # ...
      ];
    };
}
