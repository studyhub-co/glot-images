{ pkgs }:

let
  codeRunnerSrc =
    builtins.fetchGit {
      # url = "git@github.com:glotcode/code-runner.git";
      url = "https://github.com/studyhub-co/code-runner.git";
      ref = "main";
      rev = "55062dd2e88f87164d2e8ed46ea34e0a276d4a27";
    };

  codeRunner =
    import "${codeRunnerSrc}/Cargo.nix" { pkgs = pkgs; };
in
codeRunner.rootCrate.build
