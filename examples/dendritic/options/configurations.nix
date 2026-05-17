# This file defines a custom option that allows config files in ../modules to set something called `nixosConfigurations`.
# It is type-checked to only allow an attribute set of raw values.
# But you could make it be whatever you want!
{ lib, ... }:

{
  options.nixosConfigurations = lib.mkOption {
    type = with lib.types; lazyAttrsOf raw;
    default = { };
  };
}
