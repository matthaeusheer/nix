{ pkgs, ... }:

{
  home.packages = [
    pkgs.lazygit
    pkgs.gh
  ];

  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "Matthaeus Heer";
        email = "matthaeusheer@gmail.com";
      };
      credential = {
        helper = "!gh auth git-credential";
      };
    };
  };
}
