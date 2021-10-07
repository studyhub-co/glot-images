{
  pkgs,
  name,
  tag,
  installedPackages,
  run ? "",
  env ? [],
  keepContentsDirlinks ? false
}:

let
  codeRunner =
    import ./coderunner.nix { pkgs = pkgs; };

  commonPackages = [
    pkgs.bash
    pkgs.coreutils
  ];

  commonEnv = [
    "LANG=C.UTF-8"
  ];
in
pkgs.dockerTools.buildImage {
  name = name;
  tag = tag;
  created = "now";

  contents =
    pkgs.lib.concatLists [
      commonPackages
      installedPackages
    ];

  # 1Gb should be enough
  diskSize = 1*1024*1024;
  keepContentsDirlinks = keepContentsDirlinks;

  runAsRoot = ''
    ${pkgs.stdenv.shell}
    ${pkgs.dockerTools.shadowSetup}
    ${pkgs.shadow}/bin/groupadd glot
    ${pkgs.shadow}/bin/useradd -d /home/glot -g glot -s /bin/bash glot
    ${run}
  '';

  config = {
    Env =
      pkgs.lib.concatLists [
        commonEnv
        env
      ];

    Cmd = [ "${codeRunner}/bin/code-runner" "--path" "/home/glot"];
  };
}
