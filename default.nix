{
  pkgs
}:

{
  evalModules = 
    {
      modules,
      ...
    }@args:
    pkgs.lib.evalModules (args // {
      modules = [
        ./modules.nix
      ] ++ args.modules;
    });
}
