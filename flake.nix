{
  description = "Simple flake with a devshell";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs?ref=nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    zig-overlay.url = "github:mitchellh/zig-overlay";
  };

  outputs =
    { self, nixpkgs, flake-utils, zig-overlay }:
    {
      templates.default = {
        path = ./.;
        description = "Simple flake with a devshell";
      };
    } // flake-utils.lib.eachDefaultSystem (system:
    let
      pkgs = nixpkgs.legacyPackages.${system};
      zig = zig-overlay.packages.${system}.master;
    in
    {
      devShells.default = import ./nix/devshell.nix { inherit pkgs zig; };
      formatter = pkgs.nixpkgs-fmt;
    });
}
