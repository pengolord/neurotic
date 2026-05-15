{
  lib,
  ...
}:

{
  options = {
    modules = lib.mkOption {
      type = with lib.types; lazyAttrsOf (lazyAttrsOf deferredModule);
      default = {};
    };
  };
}
