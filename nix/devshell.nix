{ pkgs }:
pkgs.mkShell {
  # Add build dependencies
  packages = with pkgs; [
    zig
  ];

  # Add environment variables
  env = { };

  # Load custom bash code
  shellHook = ''

  '';
}
