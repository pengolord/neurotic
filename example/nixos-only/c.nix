# this is a nixos module
{
  options.c = lib.mkOption {
    type = lib.types.int;
    default = 3;
  };
}
