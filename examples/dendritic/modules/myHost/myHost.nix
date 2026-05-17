# This file is top-level, as you are probably used to with dendritic.
# You can set things that you defined in options.
{ lib, config, ... }:

{
  modules.nixos.myHostConfig =
    # arguments go here
    { ... }:
    {
      imports = [
        ./_hardware-configuration.nix
      ];

      # config goes here
      # ...
    };

  nixosConfigurations.myHost = lib.nixosSystem {
    modules = [
      config.modules.nixos.myHostConfig
      config.modules.nixos.lix
    ];
  };
}
