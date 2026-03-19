{ pkgs, zig }:
pkgs.mkShell {
  # Add build dependencies
  packages = [
    zig
  ];

  # Add environment variables
  env = { };

  # Load custom bash code
  shellHook = ''

  '';
}
