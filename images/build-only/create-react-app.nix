let
  pkgs =
    import ../common/nixpkgs.nix;

  build_image =
    import ../common/build_image.nix;

#   glotNodeModules =
#     import ./javascript/glot-node-modules/default.nix { pkgs = pkgs; };
in
build_image {
  pkgs = pkgs;
  name = "glot/create-react-app";
  tag = "latest";
  installedPackages = [
    pkgs.nodejs
    pkgs.nodePackages.npm
  ];
  env = [
    "PATH=${pkgs.nodejs}/bin/:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
    # "PATH=${pkgs.nodejs}/bin/:${glotNodeModules}/libexec/glot-node-modules/node_modules/.bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
    # "NODE_PATH=${glotNodeModules}/libexec/glot-node-modules/node_modules"
  ];
}
