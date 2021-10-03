{ pkgs }:

let
  codeRunnerSrc =
    builtins.fetchGit {
      # url = "git@github.com:glotcode/code-runner.git";
      url = "https://github.com/studyhub-co/code-runner.git";
      ref = "main";
      rev = "7e68c4cb075bc646f21efb6c238afd8f674164cb";
    };

  codeRunner =
    import "${codeRunnerSrc}/Cargo.nix" { pkgs = pkgs; };
in
codeRunner.rootCrate.build
