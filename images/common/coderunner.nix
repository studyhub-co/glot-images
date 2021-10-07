{ pkgs }:

let
  codeRunnerSrc =
    builtins.fetchGit {
      # url = "git@github.com:glotcode/code-runner.git";
      url = "https://github.com/studyhub-co/code-runner.git";
      ref = "main";
      rev = "84e873e0ed9fc4222904b826e8cc101d3fcb0138";
    };

  codeRunner =
    import "${codeRunnerSrc}/Cargo.nix" { pkgs = pkgs; };
in
codeRunner.rootCrate.build
