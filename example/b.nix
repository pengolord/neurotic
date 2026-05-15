{
  argOuter,
  ...
}:

{
  modules.nixos.default = { argInner, lib, ... }: {
    options.b = lib.mkOption {
      type = lib.types.int;
      default = argInner;
    };
    config.b = argInner + 10;
    # you can also include nixos modules (not top-level), i.e.
    # imports = [ ./nixos-only/c.nix ];
  };
}
