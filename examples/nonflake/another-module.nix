# This file is top-level, as you are probably used to with dendritic.
# You can set things that you defined in options.
{ outerArg, ... }:

{
  modules.nixos.another-module =
    { innerArg, lib, ... }:
    {
      # This option won't be accessible at the top-level, because it's defined *within* a nixos module.
      # Instead, it will be accessible within other nixos modules.
      options.some-option = lib.mkOption {
        type = lib.types.int;
        default = outerArg;
      };

      config.some-option = innerArg + 10;

      # You can also include modules that *aren't* top-level, such as:
      # imports = [ ./nixos-only/packages.nix ];
    };
}
