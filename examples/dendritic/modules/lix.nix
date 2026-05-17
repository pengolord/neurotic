# This file is top-level, as you are probably used to with dendritic.
# You can set things that you defined in options.
{
  modules.nixos.lix =
    { pkgs, ... }:
    {
      nix.package = pkgs.lixPackagesSets.stable.lix;
    };
}
