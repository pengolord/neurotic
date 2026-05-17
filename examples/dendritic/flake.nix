{
  inputs.nixpkgs.url = "nixpkgs"; # Replace with your preferred version of nixpkgs.
  # note the lack of any other inputs!!

  outputs =
    { nixpkgs, ... }@inputs:
    let
      # Bring helper functions into scope from nixpkgs lib.
      inherit (nixpkgs.lib) evalModules hasPrefix;
      inherit (nixpkgs.lib.fileset) fileFilter toList;

      # Helper function that recursively imports every nix file in a directory that doesn't start with '_'.
      import-tree =
        path: toList (fileFilter (file: file.hasExt "nix" && !(hasPrefix "_" file.name)) path);

      # This function takes arguments almost identical to `lib.nixosSystem`. If you've used that before, it should look similar!
      top-level = evalModules {
        # Defines every file that will be imported.
        # In this case, we use the import-tree function we defined earlier to import every nix file from the ./modules and ./options directories.
        modules = (import-tree ./modules) ++ (import-tree ./options);
        # Additional arguments that will be available across all of your modules.
        specialArgs = {
          # By doing this, all our modules can access inputs! This isn't used in this example, but it probably will be in your config.
          inherit inputs;
        };
      };
    in
    {
      # Now, top-level is going to be an attribute set that outputs everything we defined in `options`.
      # We can pull in the `nixosConfigurations` output from it and add it to our flake!
      nixosConfigurations.myHost = top-level.config.nixosConfigurations.myHost;
    };
    # Alternatively, you can just replace the previous 5 lines with `top-level.config`, 
    # and the outputs of your flake will be the same as the result of evaluating your top level.
}
