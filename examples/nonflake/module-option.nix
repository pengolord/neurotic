# This file defines a custom option that allows config files in your top-level to set something called `modules`.
# It is type-checked to only allow an attribute set of attribute sets of deferredModules.
# But you could make it be whatever you want!
{ lib, ... }:

{
  options.modules = lib.mkOption {
    type = with lib.types; lazyAttrsOf (lazyAttrsOf deferredModule);
    default = { };
  };
}
