# this is a top-level module that can contain different types of modules under
# modules.<key>.<subkey>
# such as:
# modules.nixos.default = nixos_module_here;
# modules.home-manager-standalone.abcde = hm_module_here;
{
  argOuter,
  ...
}:

{
  # You can import other top-level modules here
  imports = [
    ./b.nix
  ];

  modules.nixos.default = { customInner, lib, ... }: {
    options.a = lib.mkOption {
      type = lib.types.int;
      default = argOuter;
    };
  };
}
